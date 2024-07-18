class ImageUploadDtoModel {
  final String pathImagen;
  final String imgBase64String;
  final String fechaCreacion;

  ImageUploadDtoModel({
    required this.pathImagen,
    required this.imgBase64String,
    required this.fechaCreacion,
  });

  factory ImageUploadDtoModel.fromJson(Map<String, dynamic> json) =>
      ImageUploadDtoModel(
        pathImagen: json["pathImagen"],
        imgBase64String: json["imgBase64String"],
        fechaCreacion: json["fechaCreacion"],
      );

  Map<String, dynamic> toJson() => {
        "pathImagen": pathImagen,
        "imgBase64String": imgBase64String,
        "fechaCreacion": fechaCreacion,
      };
}
