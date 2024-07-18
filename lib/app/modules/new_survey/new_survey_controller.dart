import 'dart:async';
import 'dart:developer';

import 'package:ccr_app/app/data/models/models.dart';
import 'package:ccr_app/app/data/providers/local/cache.dart';
import 'package:ccr_app/app/helpers/date_helper.dart';
import 'package:ccr_app/app/helpers/file_helper.dart';
import 'package:ccr_app/app/modules/home/home_controller.dart';
import 'package:ccr_app/app/modules/new_survey/survey_items_precio_correcto_page.dart';
import 'package:ccr_app/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_android/image_picker_android.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../flavors/build_config.dart';
import '../../data/providers/local/db_isar.dart';
import '../../data/repositories/local/auth_repository.dart';
import '../../data/repositories/remote/server_repository.dart';
import '../../global_widgets/yes_no_dialog.dart';
import '../../helpers/notifications/notificacion_service.dart';
import '../../helpers/notifications/notifications_keys.dart';
import '../../routes/navigator.dart';
import 'survey_items_page.dart';
import 'survey_main_page.dart';

class NewSurveyController extends GetxController {
  final authRepo = Get.find<AuthRepository>();
  final serverRepo = Get.find<ServerRepository>();
  final nav = Get.find<NavigatorController>();
  final noti = Get.find<NotificationService>();
  final homeController = Get.find<HomeController>();

  RxBool workInProgress = false.obs;
  final isar = DBIsar();

  List<XFile> fotos = [];
  late int idBoca;
  RespuestaCabModel? nuevaRespuesta;

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    final id = Get.arguments['id'];

    if (id != null) {
      idBoca = id;
      final boca = await isar.findBocaById(idBoca);
      nuevaRespuesta = RespuestaCabModel(
          id: null,
          isarId: null,
          idBoca: idBoca,
          codBoca: boca!.codBoca,
          descBoca: boca.nombre,
          usuario: Cache.instance.loginData.usuario.usuario,
          longitud: Cache.instance.currentLocation?.longitude.toString() ?? '',
          latitud: Cache.instance.currentLocation?.latitude.toString() ?? '',
          pathImagen: '',
          fechaCreacion: DateHelper.dateToString(
              date: DateTime.now(), format: 'dd-MM-yyyy HH:mm'),
          horaInicio:
              DateHelper.dateToString(date: DateTime.now(), format: 'HH:mm:ss'),
          horaFin: '',
          detalles: []);
    }
    await getLostData();
  }

  /******************* 1. Foto - Inicio  *******************/ ///

  Future<void> getLostData() async {
    final ImagePicker picker = ImagePicker();
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    final List<XFile>? files = response.files;
    if (files != null) {
      // _handleLostFiles(files);
    } else {
      // _handleError(response.exception);
    }
  }

  capturarImagen() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      log('Pidiendo de nuevo');
      status = await Permission.camera.request();
    }
    if (!status.isGranted) {
      noti.mostrarSnackBar(
          color: NotiKey.error,
          mensaje: 'Favor conceda los permisos para acceder a la camara',
          titulo: 'Atención');
      return;
    }

    final ImagePickerPlatform imagePickerImplementation =
        ImagePickerPlatform.instance;
    if (imagePickerImplementation is ImagePickerAndroid) {
      imagePickerImplementation.useAndroidPhotoPicker = true;
    }

    final ImagePicker picker = ImagePicker();

    workInProgress.value = true;
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 40);

    workInProgress.value = false;
    if (pickedFile != null) {
      fotos.add(pickedFile);
      update();

      FileHelper.getFileSize(pickedFile.path);
    }
  }

  // Future<void> agregarMarcaAgua(String fullPath) async {
  //   if (fotos.isEmpty) return;

  //   final pickedFile = fotos.last;

  //   Uint8List bytes = await pickedFile.readAsBytes();

  //   final watermarkedImg = await ImageWatermark.addTextWatermark(
  //       rightJustify: true,
  //       imgBytes: bytes,
  //       dstY: 150,
  //       dstX: 70,
  //       color: Colors.red,
  //       watermarkText: DateHelper.dateToString(
  //           date: DateTime.now(), format: 'dd/mm/yyyy HH:mm'));

  //   log('Se colocó la marca de agua en la imagen');
  //   final newFile =
  //       await FileHelper.convertUint8ListToXFile(watermarkedImg, fullPath);

  //   fotos = [newFile!];

  //   log('la foto con la marca de agua se grabó en ${newFile.path}');
  // }

  borrarImagen(int tipo) async {
    final dial = await DialogoSiNo().abrirDialogoSiNo('¿Borrar imagen?', '');

    if (dial == 1) {
      if (tipo == 1) fotos.removeAt(0);
      update();
    }
  }

  Future<void> nextPage1() async {
    workInProgress.value = true;
    cabeceras = await isar.getCabeceras();
    String mes = DateHelper.dateToString(date: DateTime.now(), format: 'MM');
    String anio = DateHelper.dateToString(date: DateTime.now(), format: 'yyyy');
    String dia = DateHelper.dateToString(date: DateTime.now(), format: 'dd');
    String fileName = '${nuevaRespuesta!.codBoca}_${dia}_${mes}_${anio}_1';
    log(fileName);
    final path = await FileHelper.saveImageToDirectory(fotos.last,
        folderName: BuildConfig.instance.config.imagesFolder,
        fileName: fileName);
    log('la imagen se guardó en: $path');

    nuevaRespuesta!.pathImagen = path ?? '';

    // await agregarMarcaAgua(path!);
    update();
    workInProgress.value = false;
    Get.to(() => const SurveyMainPage());
  }

  /******************* 1. Foto - FIN  *******************/ ///

  /******************* 2. Main - Inicio  *******************/ ///
  List<CabeceraModel> cabeceras = [];

  Future<void> finalizar() async {
    final dial = await DialogoSiNo().abrirDialogoSiNo(
        '¿Finalizar relevo?', 'Los datos se guardarán en el dispositivo');

    if (dial == 0) return;

    workInProgress.value = true;

    await Future.delayed(const Duration(milliseconds: 500));
    try {
      nuevaRespuesta!.horaFin =
          DateHelper.dateToString(date: DateTime.now(), format: 'HH:mm:ss');
      final savedId = await isar.insertRespuesta(nuevaRespuesta!);
      workInProgress.value = false;

      await Future.delayed(const Duration(milliseconds: 50), () {
        Get.back();
        Get.back();
        nav.goToOff(AppRoutes.resumeSurvey,
            parameters: {'id': savedId.toString()});
      });

      DialogoSiNo().abrirDialogoSucccess('¡Guardado correctamente!');
      nuevaRespuesta = null;
    } catch (e) {
      workInProgress.value = false;
      print(e);
      DialogoSiNo()
          .abrirDialogoError('No se guardó el relevo: ${e.toString()}');

      //* Actualizar el home
      Cache.instance.syncData?.cantidadPendientes =
          Cache.instance.syncData?.cantidadPendientes == null
              ? 1
              : Cache.instance.syncData!.cantidadPendientes! + 1;
      homeController.addDataToStream(Cache.instance.syncData!);
    }
  }

  /******************* 2. Main - Fin  *******************/ ///

  /******************* 3. Items - Inicio  *******************/ ///
  CabeceraModel? cabeceraSelected;

  void selectCabecera(CabeceraModel c) {
    cabeceraSelected = c;

    if (c.codigo.toUpperCase() == 'PRECIO_CORRECTO') {
      Get.to(() => const SurveyItemsPrecioCorrectoPage());
      return;
    }

    Get.to(() => const SurveyItemsPage());
  }

  double getTotalProgress() {
    // Sumar la cantidad total de items
    int totalItems = cabeceras.fold(0, (sum, c) => sum + c.items.length);

    // Obtener la cantidad total de respuestas
    int totalRespuestas = nuevaRespuesta!.detalles.length;

    // Calcular el progreso total
    if (totalItems == 0) {
      return 0; // Evitar división por cero
    }
    return totalRespuestas / totalItems;
  }

  /******************* 3. Items - Fin  *******************/ ///

  Future<void> responder(
      {required ItemModel item,
      required String valor,
      String comentario = '',
      String precio = ''}) async {
    final existe =
        nuevaRespuesta!.detalles.firstWhereOrNull((d) => d.idItem == item.id);
    if (existe != null) {
      nuevaRespuesta!.detalles.remove(existe);
    }

    nuevaRespuesta!.detalles.add(RespuestaDetModel(
        idItem: item.id,
        descItem: item.descripcion,
        cabecera: item.codCabecera,
        valor: valor,
        precio: precio,
        comentario: comentario));
  }

  Future<void> reponderTodos(CabeceraModel cabecera) async {
    borrarRespuestas(cabecera);

    nuevaRespuesta!.detalles = [
      ...nuevaRespuesta!.detalles,
      ...cabecera.items.map((item) => RespuestaDetModel(
          idItem: item.id,
          descItem: item.descripcion,
          cabecera: cabecera.codigo,
          valor: 'NO'))
    ];
    update(['survey-items']);
  }

  void borrarRespuestas(CabeceraModel cabecera) {
    nuevaRespuesta!.detalles.removeWhere((d) => d.cabecera == cabecera.codigo);
  }

  int getCountRespuestasByCabecera(String codCabecera) {
    return nuevaRespuesta!.detalles
        .where((d) => d.cabecera == codCabecera)
        .length;
  }
}
