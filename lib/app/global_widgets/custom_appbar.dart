import 'package:ccr_app/app/data/repositories/local/auth_repository.dart';
import 'package:ccr_app/app/global_widgets/yes_no_dialog.dart';
import 'package:ccr_app/app/routes/navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titulo;
  final bool? showLogOutButton;

  const CustomAppBar({super.key, this.titulo, this.showLogOutButton = false});

  @override
  Widget build(BuildContext context) {
    // final responsive = Responsive.of(context);
    return AppBar(
      // backgroundColor: AppColors.darkColor,
      // foregroundColor: Colors.white,
      title: titulo == null
          ? Container(
              margin: const EdgeInsets.only(top: 5),
              child: const Hero(tag: 'login', child: FlutterLogo()
                  // Image.asset(
                  //   'assets/images/heroes.png',
                  //   height: responsive.hp(5),
                  //   width: double.infinity,
                  // ),
                  ))
          : Text(
              titulo!,
              style: const TextStyle(color: Colors.white),
            ),
      centerTitle: true,
      actions: showLogOutButton!
          ? [
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: IconButton(
                    onPressed: () => launchDialogCerrarSesion(),
                    icon: const Icon(Icons.exit_to_app)),
              ),
            ]
          : [],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height * 1.1);

  Future<void> launchDialogCerrarSesion() async {
    final dial = await DialogoSiNo().abrirDialogoSiNo('¿Cerrar sesión?', '');
    if (dial == 0) return;

    Get.dialog(
        const AlertDialog(
          content: Text("Cerrando sesión...",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                  fontSize: 18.0,
                  color: Colors.black)),
        ),
        barrierDismissible: false);
    await cerrarSesion();
  }

  Future<void> cerrarSesion() async {
    final authRepo = Get.find<AuthRepository>();
    final nav = Get.find<NavigatorController>();

    await authRepo.deleteAuthToken();
    await authRepo.deleteSyncData();

    Future.delayed(const Duration(milliseconds: 500), () {
      nav.back();
      nav.goToAndClean(AppRoutes.login);
    });
  }
}
