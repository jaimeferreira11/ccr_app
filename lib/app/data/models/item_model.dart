import 'package:isar/isar.dart';

part 'item_model.g.dart';

@collection
class ItemModel {
  Id? isarId;
  final int id;
  final int? codigo;
  final String descripcion;
  final String codCabecera;
  final String? pregunta;
  final String? leyenda;
  final String? ocasion;
  String? imgBase64String;
  final bool activo;

  ItemModel({
    required this.id,
    this.codigo,
    required this.descripcion,
    required this.codCabecera,
    this.pregunta,
    this.leyenda,
    this.ocasion,
    this.imgBase64String,
    required this.activo,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["id"],
        codigo: json["codigo"],
        descripcion: json["descripcion"],
        codCabecera: json["codCabecera"],
        pregunta: json["pregunta"],
        leyenda: json["leyenda"],
        ocasion: json["ocasion"],
        activo: json["activo"],
        imgBase64String: json["imgBase64String"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "codigo": codigo,
        "descripcion": descripcion,
        "codCabecera": codCabecera,
        "pregunta": pregunta,
        "leyenda": leyenda,
        "ocasion": ocasion,
        "activo": activo,
        "imgBase64String": imgBase64String,
      };

  static List<ItemModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) {
      return item is ItemModel ? item : ItemModel.fromJson(item);
    }).toList();
  }
}
