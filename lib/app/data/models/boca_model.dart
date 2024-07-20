import 'package:isar/isar.dart';

part 'boca_model.g.dart';

@collection
class BocaModel {
  Id? isarId;
  final int id;

  @Index(type: IndexType.value)
  final String codBoca;
  final String nombre;
  final String? direccion;
  final String ciudad;
  final String tipoBoca;
  final bool activo;

  @ignore
  bool estaRelevado;

  BocaModel(
      {required this.id,
      required this.codBoca,
      required this.nombre,
      this.direccion,
      required this.ciudad,
      required this.activo,
      required this.tipoBoca,
      this.estaRelevado = false});

  factory BocaModel.fromJson(Map<String, dynamic> json) => BocaModel(
        id: json["id"],
        codBoca: json["codBoca"],
        nombre: json["nombre"],
        direccion: json["direccion"],
        ciudad: json["ciudad"],
        activo: json["activo"],
        tipoBoca: json["tipoBoca"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "codBoca": codBoca,
        "nombre": nombre,
        "direccion": direccion,
        "ciudad": ciudad,
        "activo": activo,
        "tipoBoca": tipoBoca,
      };

  static List<BocaModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) {
      return item is BocaModel ? item : BocaModel.fromJson(item);
    }).toList();
  }
}
