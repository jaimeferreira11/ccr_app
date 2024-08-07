import 'dart:convert';

import 'package:ccr_app/app/data/models/image_upload_dto_model.dart';
import 'package:ccr_app/app/data/models/models.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../config/dio_config.dart';
import '../../../config/errors/failures.dart';
import '../../providers/local/cache.dart';

class ServerAPI {
  final DioService _dio = Get.find<DioService>();

  Future<Either<Failure, TokenModel>> login(
      String username, String password) async {
    try {
      String url = 'auth/login';
      final res = await _dio.client.post(url, data: {
        'usuario': username.trim(),
        'contrasena': password.trim(),
      });

      if (res.statusCode == 200) {
        final data = TokenModel.fromJson(res.data);

        Cache.instance.loginData = data;

        return right(data);
      } else {
        return left(const ServerFailure());
      }
    } catch (e) {
      print(e);
      return left(const ServerFailure(mensaje: 'Error en el servidor'));
    }
  }

  Future<Either<Failure, List<BocaModel>>> getBocas() async {
    try {
      const url = 'api/v1/bocas';

      final res = await _dio.client.get(url);
      if (res.statusCode == 200) {
        final data = BocaModel.fromJsonList(res.data);
        return right(data);
      } else {
        return left(ServerFailure(mensaje: res.data));
      }
    } catch (e) {
      print(e);
      return left(const ServerFailure(mensaje: 'Error en el servidor'));
    }
  }

  Future<Either<Failure, List<CabeceraModel>>> getCabeceras() async {
    try {
      const url = 'api/v1/cabeceras';

      final res = await _dio.client.get(url);
      if (res.statusCode == 200) {
        final data = CabeceraModel.fromJsonList(res.data);
        return right(data);
      } else {
        return left(ServerFailure(mensaje: res.data));
      }
    } catch (e) {
      print(e);
      return left(const ServerFailure(mensaje: 'Error en el servidor'));
    }
  }

  Future<Either<Failure, List<ItemModel>>> getItems() async {
    try {
      const url = 'api/v1/items';

      final res = await _dio.client.get(url);
      if (res.statusCode == 200) {
        final data = ItemModel.fromJsonList(res.data);
        return right(data);
      } else {
        return left(ServerFailure(mensaje: res.data));
      }
    } catch (e) {
      print(e);
      return left(const ServerFailure(mensaje: 'Error en el servidor'));
    }
  }

  Future<Either<Failure, void>> subirRespuestas(
      List<RespuestaCabModel> respuestas) async {
    const url = 'api/v1/respuestas';

    final List<Map<String, dynamic>> respuestasJson =
        respuestas.map((respuesta) => respuesta.toJson()).toList();

    final res = await _dio.client.post(url, data: jsonEncode(respuestasJson));
    if (res.statusCode == 201) {
      return right(null);
    } else {
      return left(const ServerFailure());
    }
  }

  Future<Either<Failure, void>> subirImagen(ImageUploadDtoModel body) async {
    const url = 'api/v1/upload-image';

    final res = await _dio.client.post(url, data: jsonEncode(body));
    if (res.statusCode == 200) {
      return right(null);
    } else {
      return left(const ServerFailure());
    }
  }

  Future<Either<Failure, void>> subirListImagen(
      List<ImageUploadDtoModel> lista) async {
    const url = 'api/v1/upload-list-image';

    final List<Map<String, dynamic>> listaJson =
        lista.map((respuesta) => respuesta.toJson()).toList();

    final res = await _dio.client.post(url, data: jsonEncode(listaJson));
    if (res.statusCode == 200) {
      return right(null);
    } else {
      return left(const ServerFailure());
    }
  }

  Future<Either<Failure, void>> cambiarPassword(
      {required String usuario,
      required String oldPwd,
      required String newPwd}) async {
    const url = 'api/v1/usuarios/change-password';

    final body = {
      'usuario': usuario,
      'oldPassword': oldPwd,
      'newPassword': newPwd,
    };
    final res = await _dio.client.put(url, data: jsonEncode(body));
    if (res.statusCode == 200) {
      return right(null);
    }
    if (res.statusCode == 400 || res.statusCode == 403) {
      return left(const ServerFailure(mensaje: 'Datos incorrectos'));
    } else {
      return left(const ServerFailure());
    }
  }

  // Future<Either<Failure, UsuarioModel>> verificarSession() async {
  //   final url = AppConstants.API_URL + 'api/v1/oauth/check-token';

  //   final res = await _dio.client.get(url);
  //   if (res.statusCode == 200) {
  //     final data = UsuarioModel.fromJson(res.data);

  //     Cache.instance.user = data;

  //     return right(data);
  //   } else {
  //     return left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, UsuarioModel>> obtenerUserInfo(String token) async {
  //   //final url = AppConstants.API_URL + 'private/user-info';
  //   final url = 'private/user-info';

  //   final res = await _dio.client.get(url);
  //   if (res.statusCode == 200) {
  //     final data = RespuestaModel.fromJson(res.data);

  //     return right(UsuarioModel.fromJson(data.datos));
  //   } else {
  //     return left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, String>> recuperarClave(String correo) async {
  //   final url = AppConstants.API_URL + 'public/usuario/cambiar-clave"';

  //   final res =
  //       await _dio.client.post(url, queryParameters: {'correo': correo});
  //   if (res.statusCode == 200) {
  //     return right(res.data['datos']);
  //   } else {
  //     return left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, String>> actualizarUsuario(UsuarioModel user) async {
  //   final url = AppConstants.API_URL + 'private/update-user-aliado';

  //   final res = await _dio.client.post(url,
  //       queryParameters: {"celular": user.phonenumber, "correo": user.email});
  //   if (res.statusCode == 200) {
  //     return right(res.data['datos']);
  //   } else {
  //     return left(ServerFailure());
  //   }
  // }

  // Future<void> logout() async {
  //   final url = AppConstants.API_URL + 'oauth/revoke-token';

  //   await _dio.client.post(url);
  //   // await _localAuth.();
  // }

  // Future<Either<Failure, ClienteModel>> verificarDisponibilidadCliente(
  //     String tipoDoc, String doc) async {
  //   //final url = AppConstants.API_URL + 'private/user-info';
  //   final url = 'private/franquicia/disponibilidad-cliente/$doc/$tipoDoc';

  //   final res = await _dio.client.get(url);
  //   if (res.statusCode == 200) {
  //     print(res.data);
  //     final data = RespuestaModel.fromJson(res.data);

  //     if (data.estado.toUpperCase() == 'OK') {
  //       return right(ClienteModel.fromJson(data.datos));
  //     } else {
  //       return left(NoDataFailure(mensaje: data.error));
  //     }
  //   } else {
  //     return left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, String>> solicitarCodigoVerificacion(
  //     {int idpersona, String cel, String monto, String plazo}) async {
  //   //final url = AppConstants.API_URL + 'private/user-info';
  //   final url =
  //       'private/franquicia/solicitar-codigo/$idpersona/$cel/$monto/$plazo';

  //   final res = await _dio.client.get(url);
  //   print(res.statusCode);
  //   if (res.statusCode == 200) {
  //     return right(res.data['datos']);
  //   }
  //   return left(ServerFailure());
  // }

  // Future<Either<Failure, String>> enviarSolicitud(
  //     String codigo, ProformaModel proforma) async {
  //   print(proforma.toJson());

  //   try {
  //     final url = AppConstants.API_URL +
  //         'private/franquicia/enviar-solicitud/$codigo?json=${jsonEncode(proforma)}';

  //     final res = await _dio.client
  //         .post(url, queryParameters: {"json": proforma.toJson()});
  //     if (res.statusCode == 200) {
  //       print(res);
  //       if (res.data['estado'].toUpperCase() == 'OK') {
  //         return right(res.data['datos']);
  //       } else {
  //         return left(CustomFailure(mensaje: res.data['error']));
  //       }
  //     } else {
  //       return left(ServerFailure(mensaje: res.data['error']));
  //     }
  //   } catch (e) {
  //     print(e);
  //     return left(ServerFailure(mensaje: 'Erro interno'));
  //   }
  // }

  // Future<Either<Failure, bool>> reenviarCodigo(
  //     String numero, String mensaje) async {
  //   final url = AppConstants.API_URL + 'private/reenviar-sms';

  //   final res = await _dio.client.post(url, queryParameters: {
  //     'numero': numero,
  //     'mensaje': mensaje,
  //   });
  //   if (res.statusCode == 200) {
  //     return right(true);
  //   }
  //   return left(ServerFailure());
  // }

  // Future<Either<Failure, List<ProformaModel>>> obtenerSolicitudes(
  //     int mes, int anio) async {
  //   final url = AppConstants.API_URL + 'private/franquicia/$mes/$anio';

  //   final res = await _dio.client.get(url);
  //   if (res.statusCode == 200) {
  //     return right(ProformaModel.fromJsonList(res.data['datos']));
  //   }
  //   return left(ServerFailure());
  // }

  // Future<Either<Failure, String>> sendMail(
  //     String asunto, String mensaje) async {
  //   final url = AppConstants.API_URL + 'public/send-mail';

  //   final res = await _dio.client.post(url, queryParameters: {
  //     "destinatario": AppConstants.EMAIL_ADMIN,
  //     "mensaje": mensaje,
  //     "asunto": asunto
  //   });
  //   if (res.statusCode == 200) {
  //     return right(res.data['datos']);
  //   } else {
  //     return left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, int>> getVersion() async {
  //   String app = "APP_ALIADOS_ANDROID";
  //   if (Platform.isIOS) app = "APP_ALIADOS_IOS";

  //   final url = AppConstants.API_URL + 'public/v2/version-app/$app';

  //   final res = await _dio.client.get(url);
  //   if (res.statusCode == 200) {
  //     return right(res.data['datos']);
  //   }
  //   return left(ServerFailure());
  // }

  // // Agentes
  // Future<Either<Failure, ClienteModel>> buscarClienteByTipoDocAndDoc(
  //     String tipoDoc, String doc) async {
  //   final url = 'private/cliente/byDoc/$doc/$tipoDoc';

  //   final res = await _dio.client.get(url);
  //   if (res.statusCode == 200) {
  //     print(res.data);
  //     final data = RespuestaModel.fromJson(res.data);

  //     if (data.estado.toUpperCase() == 'OK') {
  //       return right(ClienteModel.fromJson(data.datos));
  //     } else {
  //       return left(NoDataFailure(mensaje: data.error));
  //     }
  //   } else {
  //     return left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, AgenteParametroModel>>
  //     obtenerParametrosAgente() async {
  //   final url = 'private/agente/parametros';

  //   final res = await _dio.client.get(url);
  //   if (res.statusCode == 200) {
  //     final data = RespuestaModel.fromJson(res.data);

  //     if (data.estado.toUpperCase() == 'OK') {
  //       print(data.datos);
  //       return right(AgenteParametroModel.fromMap(data.datos));
  //     } else {
  //       return left(NoDataFailure(mensaje: data.error));
  //     }
  //   } else {
  //     return left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, List<DestinoSolicitudAgenteModel>>>
  //     obtenerDestinosAgente() async {
  //   final url = 'private/agente/destinos';

  //   final res = await _dio.client.get(url);
  //   if (res.statusCode == 200) {
  //     final data = RespuestaModel.fromJson(res.data);

  //     if (data.estado.toUpperCase() == 'OK') {
  //       print(data.datos);
  //       return right(DestinoSolicitudAgenteModel.fromJsonList(data.datos));
  //     } else {
  //       return left(NoDataFailure(mensaje: data.error));
  //     }
  //   } else {
  //     return left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, bool>> subirArchivosAgente(
  //     Uint8List bytes, String filePath, int idsolicitud, String tipo) async {
  //   final url = AppConstants.API_URL + 'private/agente/v2/subir-archivo';

  //   dio.FormData formData = dio.FormData.fromMap({
  //     'file': dio.MultipartFile.fromBytes(bytes, filename: basename(filePath)),
  //     'idsolicitud': idsolicitud,
  //     'tipo': tipo
  //   });

  //   final res = await _dio.client.post(url, data: formData);
  //   if (res.statusCode == 200) {
  //     return right(true);
  //   } else {
  //     return left(ServerFailure());
  //   }
  // }

  // Future<Either<Failure, int>> enviarSolicitudAgente(
  //     SolicitudAgenteModel solicitud) async {
  //   try {
  //     final url = AppConstants.API_URL + 'private/agente/enviar-solicitud';

  //     final res = await _dio.client.post(url, data: solicitud.toMap());
  //     if (res.statusCode == 200) {
  //       print(res);
  //       if (res.data['estado'].toUpperCase() == 'OK') {
  //         return right(res.data['datos']);
  //       } else {
  //         return left(CustomFailure(mensaje: res.data['error']));
  //       }
  //     } else {
  //       return left(ServerFailure(mensaje: res.data['error']));
  //     }
  //   } catch (e) {
  //     print(e);
  //     return left(ServerFailure(mensaje: 'Erro interno'));
  //   }
  // }

  // Future<Either<Failure, List<SolicitudAgenteModel>>> obtenerReporteAgente(
  //     int mes, int anio) async {
  //   final url = AppConstants.API_URL + 'private/agente/confirmados/$mes/$anio';

  //   final res = await _dio.client.get(url);
  //   if (res.statusCode == 200) {
  //     return right(SolicitudAgenteModel.fromJsonList(res.data['datos']));
  //   }
  //   return left(ServerFailure());
  // }

  // Future<Either<Failure, List<SolicitudAgenteModel>>>
  //     solicitudesPendientesAgente() async {
  //   final url = 'private/agente/solicitudes/pendientes';

  //   final res = await _dio.client.get(url);
  //   if (res.statusCode == 200) {
  //     return right(SolicitudAgenteModel.fromJsonList(res.data['datos']));
  //   }
  //   return left(ServerFailure());
  // }

  // Future<Either<Failure, List<SolicitudAgenteModel>>>
  //     solicitudesAprobadosAgente() async {
  //   final url = 'private/agente/solicitudes/aprobados';

  //   final res = await _dio.client.get(url);
  //   if (res.statusCode == 200) {
  //     return right(SolicitudAgenteModel.fromJsonList(res.data['datos']));
  //   }
  //   return left(ServerFailure());
  // }

  // Future<Either<Failure, List<SolicitudAgenteModel>>>
  //     solicitudesRechazadosAgente() async {
  //   final url = 'private/agente/solicitudes/rechazados';

  //   final res = await _dio.client.get(url);
  //   if (res.statusCode == 200) {
  //     return right(SolicitudAgenteModel.fromJsonList(res.data['datos']));
  //   }
  //   return left(ServerFailure());
  // }
}
