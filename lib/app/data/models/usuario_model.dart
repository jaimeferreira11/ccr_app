class UsuarioModel {
  final int id;
  final String usuario;
  final String password;
  final String nombreApellido;
  final bool activo;

  UsuarioModel({
    required this.id,
    required this.usuario,
    required this.password,
    required this.nombreApellido,
    required this.activo,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        id: json["id"],
        usuario: json["usuario"],
        password: json["password"],
        nombreApellido: json["nombreApellido"],
        activo: json["activo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario,
        "password": password,
        "nombreApellido": nombreApellido,
        "activo": activo,
      };
}
