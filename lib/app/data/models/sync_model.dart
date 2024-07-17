// To parse this JSON data, do
//
//     final syncModel = syncModelFromJson(jsonString);

import 'dart:convert';

SyncModel syncModelFromJson(String str) => SyncModel.fromJson(json.decode(str));

String syncModelToJson(SyncModel data) => json.encode(data.toJson());

class SyncModel {
  final String? upload;
  final String? download;

  int? cantidadPendientes;

  SyncModel({
    this.upload,
    this.download,
  });

  factory SyncModel.fromJson(Map<String, dynamic> json) => SyncModel(
        upload: json["upload"],
        download: json["download"],
      );

  Map<String, dynamic> toJson() => {
        "upload": upload,
        "download": download,
      };
}
