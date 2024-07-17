import 'package:ccr_app/app/data/models/models.dart';
import 'package:isar/isar.dart';

part 'cabecera_model.g.dart';

@collection
class CabeceraModel {
  Id? isarId;
  final int id;
  final String codigo;
  final String titulo;
  final String? descripcion;
  final bool activo;

  @ignore
  List<ItemModel> items;

  CabeceraModel(
      {required this.id,
      required this.codigo,
      required this.titulo,
      required this.activo,
      this.descripcion,
      this.items = const []});

  factory CabeceraModel.fromJson(Map<String, dynamic> json) => CabeceraModel(
        id: json["id"],
        codigo: json["codigo"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        activo: json["activo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "codigo": codigo,
        "titulo": titulo,
        "descripcion": descripcion,
        "activo": activo,
      };

  static List<CabeceraModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) {
      return item is CabeceraModel ? item : CabeceraModel.fromJson(item);
    }).toList();
  }
}
