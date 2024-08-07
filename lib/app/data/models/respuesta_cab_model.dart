import 'package:ccr_app/app/data/models/respuesta_imagen_model.dart';
import 'package:isar/isar.dart';

import 'respuesta_det_model.dart';

part 'respuesta_cab_model.g.dart';

@collection
class RespuestaCabModel {
  Id? isarId;

  int? id;
  int idBoca;
  String codBoca;
  String descBoca;
  String usuario;
  String longitud;
  String latitud;
  // String pathImagen; //! se mudó a RespuestaImagen
  String fechaCreacion;
  String horaInicio;
  String horaFin;
  bool sincronizado;
  String? fechaSincronizacion;

  // @ignore
  // String? imgBase64String; //! se mudó a RespuestaImagen

  @ignore
  List<RespuestaDetModel> detalles;

  @ignore
  List<RespuestaImagenModel> imagenes;

  // @ignore
  // String? pathImagenAux; // solo para uso local //! se mudó a RespuestaImagen

  RespuestaCabModel(
      {this.id,
      this.isarId,
      required this.idBoca,
      required this.codBoca,
      required this.descBoca,
      required this.usuario,
      required this.longitud,
      required this.latitud,
      // required this.pathImagen,
      required this.fechaCreacion,
      required this.horaInicio,
      required this.horaFin,
      this.detalles = const [],
      this.imagenes = const [],
      // this.imgBase64String,
      this.sincronizado = false,
      this.fechaSincronizacion});

  factory RespuestaCabModel.fromJson(Map<String, dynamic> json) =>
      RespuestaCabModel(
        id: json["id"],
        isarId: json["isarId"],
        idBoca: json["idBoca"],
        codBoca: json["codBoca"],
        descBoca: json["descBoca"],
        usuario: json["usuario"],
        longitud: json["longitud"],
        latitud: json["latitud"],
        // pathImagen: json["pathImagen"],
        fechaCreacion: json["fechaCreacion"],
        fechaSincronizacion: json["fechaSincronizacion"],
        horaInicio: json["horaInicio"],
        horaFin: json["horaFin"],
        sincronizado: json["sincronizado"],
        // imgBase64String: json["imgBase64String"],
        detalles: json["detalles"] == null
            ? []
            : List<RespuestaDetModel>.from(
                json["detalles"].map((x) => RespuestaDetModel.fromJson(x))),
        imagenes: json["imagenes"] == null
            ? []
            : List<RespuestaImagenModel>.from(
                json["imagenes"].map((x) => RespuestaImagenModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isarId": isarId,
        "idBoca": idBoca,
        "codBoca": codBoca,
        "descBoca": descBoca,
        "usuario": usuario,
        "longitud": longitud,
        "latitud": latitud,
        // "pathImagen": pathImagen,
        "fechaCreacion": fechaCreacion,
        "fechaSincronizacion": fechaSincronizacion,
        "horaInicio": horaInicio,
        "horaFin": horaFin,
        "sincronizado": sincronizado,
        // "imgBase64String": imgBase64String,
        "detalles": List<dynamic>.from(detalles.map((x) => x.toJson())),
        "imagenes": List<dynamic>.from(imagenes.map((x) => x.toJson())),
      };
}
