import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../theme/colors.dart';

class DialogoSiNo {
  Future<int?> abrirDialogoSiNo(String titulo, String mensaje,
          {String? positiveText, String? negativeText}) async =>
      await Get.dialog<int>(
        _DialogSiNo(
          titulo: titulo,
          mensaje: mensaje,
          positiveText: positiveText ?? 'SI',
          negativeText: negativeText ?? 'NO',
        ),
        useSafeArea: true,
        barrierDismissible: false,
      );

  Future<int?> abrirDialogo(String titulo, String mensaje,
          {Icon? icon}) async =>
      await Get.dialog<int>(
        _Dialog(titulo: titulo, mensaje: mensaje, icon: icon),
        useSafeArea: true,
        barrierDismissible: false,
      );

  Future<int?> abrirDialogoSucccess(String mensaje) async =>
      await Get.dialog<int>(
        _DialogSuccess(
          titulo: "Proceso exitoso",
          mensaje: mensaje,
        ),
        useSafeArea: true,
        barrierDismissible: false,
      );

  Future<int?> abrirDialogoError(String mensaje) async => await Get.dialog<int>(
        _DialogError(
          titulo: "Atención, no se completó la operación",
          mensaje: mensaje,
        ),
        useSafeArea: true,
        barrierDismissible: false,
      );
}

class _Dialog extends StatelessWidget {
  final String titulo;
  final String mensaje;
  final Icon? icon;

  const _Dialog({
    required this.titulo,
    required this.mensaje,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _StackDialog(mensaje: mensaje, titulo: titulo, icon: icon),
    );
  }
}

class _DialogSiNo extends StatelessWidget {
  final String titulo;
  final String mensaje;
  final String? positiveText;
  final String? negativeText;

  const _DialogSiNo(
      {required this.titulo,
      required this.mensaje,
      this.positiveText,
      this.negativeText});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _StackDialogSiNo(
        mensaje: mensaje,
        titulo: titulo,
        positiveText: positiveText,
        negativeText: negativeText,
      ),
    );
  }
}

class _DialogSuccess extends StatelessWidget {
  final String titulo;
  final String mensaje;

  const _DialogSuccess({required this.titulo, required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _StackDialogSuccess(
        mensaje: mensaje,
        titulo: titulo,
      ),
    );
  }
}

class _DialogError extends StatelessWidget {
  final String titulo;
  final String mensaje;

  const _DialogError({required this.titulo, required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _StackDialogError(
        mensaje: mensaje,
        titulo: titulo,
      ),
    );
  }
}

class _StackDialog extends StatelessWidget {
  final String titulo;
  final String mensaje;
  final Icon? icon;

  const _StackDialog({required this.titulo, required this.mensaje, this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            left: 20,
            top: 35.0,
            right: 20,
            bottom: 20.0,
          ),
          margin: const EdgeInsets.only(top: 45.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 10),
                blurRadius: 10,
              ),
            ],
          ),
          child: _Formulario(
            mensaje: mensaje,
            titulo: titulo,
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: icon ??
                  Image.asset(
                    "assets/images/zoomin.png",
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

class _StackDialogSiNo extends StatelessWidget {
  final String titulo;
  final String mensaje;
  final String? positiveText;
  final String? negativeText;

  const _StackDialogSiNo(
      {required this.titulo,
      required this.mensaje,
      this.positiveText,
      this.negativeText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            left: 20,
            top: 40.0,
            right: 20,
            bottom: 20.0,
          ),
          margin: const EdgeInsets.only(top: 50.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 10),
                blurRadius: 10,
              ),
            ],
          ),
          child: _FormularioSiNo(
            mensaje: mensaje,
            titulo: titulo,
            positiveText: positiveText,
            negativeText: negativeText,
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                "assets/images/zoomin.png",
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _StackDialogSuccess extends StatelessWidget {
  final String titulo;
  final String mensaje;

  const _StackDialogSuccess({required this.titulo, required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            left: 20,
            top: 35.0,
            right: 20,
            bottom: 20.0,
          ),
          margin: const EdgeInsets.only(top: 60.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 10),
                blurRadius: 10,
              ),
            ],
          ),
          child: _FormularioSuccess(
            mensaje: mensaje,
            titulo: titulo,
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Container(
                  color: Colors.white,
                  height: 100,
                  width: 100,
                  child: Icon(
                    FontAwesomeIcons.circleCheck,
                    color: Colors.green.shade700,
                    size: 60,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}

class _StackDialogError extends StatelessWidget {
  final String titulo;
  final String mensaje;

  const _StackDialogError({required this.titulo, required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            left: 20,
            top: 35.0,
            right: 20,
            bottom: 20.0,
          ),
          margin: const EdgeInsets.only(top: 45.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 10),
                blurRadius: 10,
              ),
            ],
          ),
          child: _FormularioError(
            mensaje: mensaje,
            titulo: titulo,
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Container(
                  color: Colors.white,
                  height: 100,
                  width: 100,
                  child: Icon(
                    FontAwesomeIcons.circleXmark,
                    color: Colors.red.shade700,
                    size: 60,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}

class _Formulario extends StatelessWidget {
  final String titulo;
  final String mensaje;

  const _Formulario({required this.titulo, required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 180, maxHeight: 200),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titulo,
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            mensaje,
            style: context.textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 40,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 90, maxWidth: 150),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  AppColors.primaryColor,
                ),
              ),
              child: const Text(
                'Aceptar',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              onPressed: () => Get.back(result: 0),
            ),
          ),
        ],
      ),
    );
  }
}

class _FormularioSiNo extends StatelessWidget {
  final String titulo;
  final String mensaje;
  final String? positiveText;
  final String? negativeText;
  const _FormularioSiNo({
    super.key,
    required this.titulo,
    required this.mensaje,
    this.positiveText = 'Aceptar',
    this.negativeText = 'Cancelar',
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 180, maxHeight: 220),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            titulo,
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            height: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            mensaje,
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 90, maxWidth: 150),
                child: OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.red.shade700,
                    ),
                  ),
                  child: Text(
                    negativeText!,
                    style: context.textTheme.titleSmall?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  onPressed: () => Get.back(result: 0),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 90, maxWidth: 150),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      AppColors.primaryColor,
                    ),
                  ),
                  child: Text(
                    positiveText!,
                    style: context.textTheme.titleSmall?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  onPressed: () => Get.back(result: 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FormularioSuccess extends StatelessWidget {
  final String titulo;
  final String mensaje;

  const _FormularioSuccess({required this.titulo, required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 150, maxHeight: 220),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titulo,
            style: TextStyle(
                color: Colors.green.shade700,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          const SizedBox(
            height: 5,
          ),
          Text(
            mensaje,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 90, maxWidth: 150),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      AppColors.primaryColor,
                    ),
                  ),
                  child: const Text(
                    'Aceptar',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  onPressed: () => Get.back(result: 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FormularioError extends StatelessWidget {
  final String titulo;
  final String mensaje;

  const _FormularioError({required this.titulo, required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 150, maxHeight: 250),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            titulo,
            textAlign: TextAlign.center,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleMedium?.copyWith(
                color: Colors.red.shade700, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Text(
            mensaje,
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 90, maxWidth: 150),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      AppColors.primaryColor,
                    ),
                  ),
                  child: const Text(
                    'Aceptar',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  onPressed: () => Get.back(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
