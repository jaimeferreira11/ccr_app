import 'package:ccr_app/app/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'notificacion_colors.dart';
import 'notifications_keys.dart';

class NotificationService {
  void mostrarSnackBar(
      {required String color,
      required String mensaje,
      required String titulo,
      SnackPosition position = SnackPosition.TOP}) {
    Get.snackbar('', '',
        snackPosition: position,
        isDismissible: true,
        margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        dismissDirection: DismissDirection.horizontal,
        titleText: Text(
          titulo,
          style: TextStyle(
            fontSize: AppTextStyles.titleSmall.fontSize,
            color: Colors.white,
          ),
        ),
        messageText: Text(
          mensaje,
          style: TextStyle(
            fontSize: AppTextStyles.bodyMedium.fontSize,
            color: Colors.white,
          ),
        ),
        colorText: Colors.white,
        backgroundColor: coloresSnack[color],
        duration: const Duration(
          milliseconds: 3000,
        ),
        icon: (color == NotiKey.success)
            ? const Icon(FontAwesomeIcons.circleCheck)
            : (color == NotiKey.error)
                ? const Icon(FontAwesomeIcons.circleXmark)
                : (color == NotiKey.info)
                    ? const Icon(FontAwesomeIcons.circleInfo)
                    : (color == NotiKey.warning)
                        ? const Icon(FontAwesomeIcons.triangleExclamation)
                        : null);
  }

  void mostrarInternalError(
      {required String mensaje, SnackPosition position = SnackPosition.TOP}) {
    Get.snackbar('', '',
        snackPosition: position,
        isDismissible: true,
        margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        dismissDirection: DismissDirection.horizontal,
        titleText: Text(
          "Ocurrio un error interno",
          style: TextStyle(
            fontSize: AppTextStyles.titleSmall.fontSize,
            color: Colors.white,
          ),
        ),
        messageText: Text(
          mensaje,
          style: TextStyle(
            fontSize: AppTextStyles.bodyMedium.fontSize,
            color: Colors.white,
          ),
        ),
        colorText: Colors.white,
        backgroundColor: coloresSnack[NotiKey.error],
        duration: const Duration(
          milliseconds: 2500,
        ),
        icon: const Icon(
          FontAwesomeIcons.circleExclamation,
          color: Colors.white,
        ));
  }

  void mostrarSuccess(
      {String titulo = "Proceso exitoso",
      required String mensaje,
      SnackPosition position = SnackPosition.TOP}) {
    Get.snackbar('', '',
        snackPosition: position,
        isDismissible: true,
        margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        dismissDirection: DismissDirection.horizontal,
        titleText: Text(
          titulo,
          style: TextStyle(
            fontSize: AppTextStyles.titleSmall.fontSize,
            color: Colors.white,
          ),
        ),
        messageText: Text(
          mensaje,
          style: TextStyle(
            fontSize: AppTextStyles.bodyMedium.fontSize,
            color: Colors.white,
          ),
        ),
        colorText: Colors.white,
        backgroundColor: coloresSnack[NotiKey.success],
        duration: const Duration(
          milliseconds: 2500,
        ),
        icon: const Icon(
          FontAwesomeIcons.circleCheck,
          color: Colors.white,
        ));
  }
}
