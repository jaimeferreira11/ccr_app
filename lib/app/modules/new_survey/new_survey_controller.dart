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

import '../../data/providers/local/db_isar.dart';
import '../../data/repositories/local/auth_repository.dart';
import '../../data/repositories/remote/server_repository.dart';
import '../../global_widgets/yes_no_dialog.dart';
import '../../helpers/notifications/notificacion_service.dart';
import '../../helpers/notifications/notifications_keys.dart';
import '../../routes/navigator.dart';
import 'survey_items_page.dart';

class NewSurveyController extends GetxController {
  final authRepo = Get.find<AuthRepository>();
  final serverRepo = Get.find<ServerRepository>();
  final nav = Get.find<NavigatorController>();
  final noti = Get.find<NotificationService>();
  final homeController = Get.find<HomeController>();

  RxBool workInProgress = false.obs;
  final isar = DBIsar();

  XFile? fotPortada;
  late int idBoca;
  BocaModel? boca;
  RespuestaCabModel? nuevaRespuesta;

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    workInProgress.value = true;
    final id = Get.arguments['id'];

    if (id != null) {
      idBoca = id;
      boca = await isar.findBocaById(idBoca);
      nuevaRespuesta = RespuestaCabModel(
          id: null,
          isarId: null,
          idBoca: idBoca,
          codBoca: boca!.codBoca,
          descBoca: boca!.nombre.trim(),
          usuario: Cache.instance.loginData.usuario.usuario,
          longitud: Cache.instance.currentLocation?.longitude.toString() ?? '',
          latitud: Cache.instance.currentLocation?.latitude.toString() ?? '',
          fechaCreacion: DateHelper.dateToString(
              date: DateTime.now(), format: 'dd-MM-yyyy HH:mm'),
          horaInicio:
              DateHelper.dateToString(date: DateTime.now(), format: 'HH:mm:ss'),
          horaFin: '',
          detalles: [],
          imagenes: []);
    }

    cabeceras = await isar.getCabeceras(tipoClienteBoca: boca!.tipoBoca);
    await getLostData();
    workInProgress.value = false;

    update(['survey-main']);
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

  Future<XFile?> capturarImagen() async {
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
      return null;
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
      fotPortada = pickedFile;
      update();

      FileHelper.getFileSize(pickedFile.path);
    }

    return pickedFile;
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
      if (tipo == 1) fotPortada = null;
      update();
    }
  }

  String armarNombreFoto(int nro) {
    String mes = DateHelper.dateToString(date: DateTime.now(), format: 'MM');
    String anio = DateHelper.dateToString(date: DateTime.now(), format: 'yyyy');
    return '${nuevaRespuesta!.codBoca}_${anio}_${mes}_$nro';
  }

  // Future<void> nextPage1() async {
  //   workInProgress.value = true;
  //   cabeceras = await isar.getCabeceras(tipoClienteBoca: boca!.tipoBoca);
  // final fileName = armarNombreFoto(1);
  // log(fileName);
  // final path = await FileHelper.saveImageToDirectory(fotPortada!,
  //     folderName: BuildConfig.instance.config.imagesFolder,
  //     fileName: fileName);
  // log('la imagen se guardó en: $path');

  // nuevaRespuesta!.pathImagen = path ?? '';

  // await agregarMarcaAgua(path!);
  //   update();
  //   workInProgress.value = false;
  //   // Get.to(() => const SurveyMainPage());
  // }

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

      // poner la fachada en primera fila, ya no se usa al quitar la primera pagina
      // nuevaRespuesta!.imagenes = [
      //   RespuestaImagenModel(pathImagen: nuevaRespuesta!.pathImagen),
      //   ...nuevaRespuesta!.imagenes
      // ];
      final savedId = await isar.insertRespuesta(nuevaRespuesta!);
      workInProgress.value = false;

      // guardar las imagenes en base
      for (var img in nuevaRespuesta!.imagenes) {
        img.idRespuestaCab = savedId;
      }
      await isar.updateImagenesList(nuevaRespuesta!.imagenes);

      await Future.delayed(const Duration(milliseconds: 50), () {
        Get.back();
        // Get.back(); // Se quito la pagina de la foto
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
    if (nuevaRespuesta == null) {
      return 0;
    }
    // Sumar la cantidad total de items
    int totalItems = cabeceras.fold(0, (sum, c) => sum + c.items.length) + 1;

    // Obtener la cantidad total de respuestas
    int totalRespuestas = nuevaRespuesta!.detalles.length;

    if (nuevaRespuesta?.imagenes.isNotEmpty ?? false) {
      totalRespuestas++;
    }

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
