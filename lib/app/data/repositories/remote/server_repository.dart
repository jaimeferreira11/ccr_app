import 'package:ccr_app/app/data/models/models.dart';
import 'package:ccr_app/app/data/repositories/remote/server_api.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../config/errors/failures.dart';
import '../../models/image_upload_dto_model.dart';

class ServerRepository {
  final ServerAPI _api = Get.find<ServerAPI>();

  // Future<Either<Failure, UsuarioModel>> verfificarSession() =>
  //     _api.verificarSession();

  Future<Either<Failure, TokenModel>> login(String username, String password) =>
      _api.login(username, password);

  Future<Either<Failure, List<BocaModel>>> getBocas() => _api.getBocas();
  Future<Either<Failure, List<CabeceraModel>>> getCabeceras() =>
      _api.getCabeceras();
  Future<Either<Failure, List<ItemModel>>> getItems() => _api.getItems();

  Future<Either<Failure, void>> subirRespuestas(
          List<RespuestaCabModel> respuestas) =>
      _api.subirRespuestas(respuestas);

  Future<Either<Failure, void>> subirImagen(ImageUploadDtoModel body) =>
      _api.subirImagen(body);

  Future<Either<Failure, void>> subirListImagen(
          List<ImageUploadDtoModel> list) =>
      _api.subirListImagen(list);

  Future<Either<Failure, void>> cambiarPassword(
          {required String usuario,
          required String oldPwd,
          required String newPwd}) =>
      _api.cambiarPassword(usuario: usuario, oldPwd: oldPwd, newPwd: newPwd);

  // Future<Either<Failure, String>> actualizarUsuario(UsuarioModel user) =>
  //     _api.actualizarUsuario(user);

  // Future<void> logout() => _api.logout();

  // Future<Either<Failure, String>> sendMail(String asunto, String mensaje) =>
  //     _api.sendMail(asunto, mensaje);

  // Future<Either<Failure, int>> getVersion() => _api.getVersion();

  // // Microfranquicias
  // Future<Either<Failure, ClienteModel>> verificarDisponibilidadCliente(
  //         String tipoDoc, String doc) =>
  //     _api.verificarDisponibilidadCliente(tipoDoc, doc);

  // Future<Either<Failure, String>> solicitarCodigoVerificacion(
  //         {int idpersona, String cel, String monto, String plazo}) =>
  //     _api.solicitarCodigoVerificacion(
  //         idpersona: idpersona, cel: cel, monto: monto, plazo: plazo);

  // Future<Either<Failure, bool>> reenviarCodigo(String numero, String mensaje) =>
  //     _api.reenviarCodigo(numero, mensaje);

  // Future<Either<Failure, String>> enviarSolicitud(
  //         String numero, ProformaModel proforma) =>
  //     _api.enviarSolicitud(numero, proforma);

  // Future<Either<Failure, List<ProformaModel>>> obtenerSolicitudes(
  //         int mes, int anio) =>
  //     _api.obtenerSolicitudes(mes, anio);

  // // Agentes
  // Future<Either<Failure, ClienteModel>> buscarClienteByTipoDocAndDoc(
  //         String tipoDoc, String doc) =>
  //     _api.buscarClienteByTipoDocAndDoc(tipoDoc, doc);

  // Future<Either<Failure, AgenteParametroModel>> obtenerParametrosAgente() =>
  //     _api.obtenerParametrosAgente();

  // Future<Either<Failure, List<DestinoSolicitudAgenteModel>>>
  //     obtenerDestinosAgente() => _api.obtenerDestinosAgente();

  // Future<Either<Failure, bool>> subirArchivosAgente(
  //         Uint8List bytes, String filePath, int idsolicitud, String tipo) =>
  //     _api.subirArchivosAgente(bytes, filePath, idsolicitud, tipo);

  // Future<Either<Failure, int>> enviarSolicitudAgente(
  //         SolicitudAgenteModel solicitud) =>
  //     _api.enviarSolicitudAgente(solicitud);

  // Future<Either<Failure, List<SolicitudAgenteModel>>> obtenerReporteAgente(
  //         int mes, int anio) =>
  //     _api.obtenerReporteAgente(mes, anio);

  // Future<Either<Failure, List<SolicitudAgenteModel>>>
  //     solicitudesPendientesAgente() => _api.solicitudesPendientesAgente();

  // Future<Either<Failure, List<SolicitudAgenteModel>>>
  //     solicitudesAprobadosAgente() => _api.solicitudesAprobadosAgente();

  // Future<Either<Failure, List<SolicitudAgenteModel>>>
  //     solicitudesRechazadosAgente() => _api.solicitudesRechazadosAgente();
}
