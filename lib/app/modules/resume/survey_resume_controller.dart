import 'package:ccr_app/app/helpers/notifications/notificacion_service.dart';
import 'package:get/get.dart';

import '../../data/models/models.dart';
import '../../data/providers/local/db_isar.dart';
import '../../data/repositories/local/auth_repository.dart';
import '../../data/repositories/remote/server_repository.dart';
import '../../routes/navigator.dart';

class SurveyResumeController extends GetxController {
  final authRepo = Get.find<AuthRepository>();
  final serverRepo = Get.find<ServerRepository>();
  final nav = Get.find<NavigatorController>();
  final notif = Get.find<NotificationService>();
  RxBool workInProgress = false.obs;
  final isar = DBIsar();

  RespuestaCabModel? respuesta;
  Map<String, List<RespuestaDetModel>> data = {};
  List<String> keys = [];

  bool isFromSurvey = true;

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    workInProgress.value = true;

    final id = Get.parameters['id'];

    final fromParam = Get.parameters['isFromSurvey'] ?? true;

    if (fromParam == 'false') {
      isFromSurvey = false;
    }

    if (id != null) {
      respuesta = await isar.findRespuestaById(int.parse(id));
      armarData();
      update(['resume-survey']);
    } else {
      nav.back();
    }
    workInProgress.value = false;
  }

  void armarData() {
    for (var respuesta in respuesta?.detalles ?? []) {
      if (data.containsKey(respuesta.cabecera)) {
        data[respuesta.cabecera]!.add(respuesta);
      } else {
        data[respuesta.cabecera] = [respuesta];
      }
    }

    // Ordenar cada lista de respuestas para que los elementos con valor "SI" aparezcan primero
    data.forEach((key, value) {
      value.sort((a, b) => b.valor.compareTo(a.valor));
    });

    keys = data.keys.toList();
  }
}
