import 'package:isar/isar.dart';

part 'respuesta_det_model.g.dart';

@collection
class RespuestaDetModel {
  Id? isarId;
  int? id;
  int? idRespuestaCab;
  int idItem;
  String descItem;
  String cabecera;
  String valor;
  String? comentario;
  int? precio;

  RespuestaDetModel({
    this.id,
    this.idRespuestaCab,
    required this.idItem,
    required this.descItem,
    required this.cabecera,
    required this.valor,
    this.comentario,
    this.precio,
  });

  factory RespuestaDetModel.fromJson(Map<String, dynamic> json) =>
      RespuestaDetModel(
        id: json["id"],
        idRespuestaCab: json["idRespuestaCab"],
        idItem: json["idItem"],
        descItem: json["descItem"],
        cabecera: json["cabecera"],
        valor: json["valor"],
        comentario: json["comentario"],
        precio: json["precio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idRespuestaCab": idRespuestaCab,
        "idItem": idItem,
        "descItem": descItem,
        "cabecera": cabecera,
        "valor": valor,
        "comentario": comentario,
        "precio": precio,
      };
}
