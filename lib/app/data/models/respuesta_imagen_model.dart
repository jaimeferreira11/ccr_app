import 'package:isar/isar.dart';

part 'respuesta_imagen_model.g.dart';

@collection
class RespuestaImagenModel {
  Id? isarId;
  int? id;
  int? idRespuestaCab;
  String pathImagen;
  @ignore
  String? imgBase64String;

  @ignore
  String? pathImagenAux; // solo para uso local

  RespuestaImagenModel(
      {this.id,
      this.idRespuestaCab,
      required this.pathImagen,
      this.imgBase64String,
      this.isarId});

  factory RespuestaImagenModel.fromJson(Map<String, dynamic> json) =>
      RespuestaImagenModel(
        isarId: json["isarId"],
        id: json["id"],
        idRespuestaCab: json["idRespuestaCab"],
        pathImagen: json["pathImagen"],
        imgBase64String: json["imgBase64String"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idRespuestaCab": idRespuestaCab,
        "isarId": isarId,
        "pathImagen": pathImagen,
        "imgBase64String": imgBase64String,
      };
}
