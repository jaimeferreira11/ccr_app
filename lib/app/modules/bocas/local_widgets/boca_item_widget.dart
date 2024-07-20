import 'package:ccr_app/app/helpers/extensions.dart';
import 'package:ccr_app/app/helpers/notifications/notifications_keys.dart';
import 'package:ccr_app/app/modules/bocas/bocas_controller.dart';
import 'package:ccr_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../data/models/models.dart';
import '../../../theme/colors.dart';

class BocaItemWidget extends StatelessWidget {
  final BocaModel boca;
  const BocaItemWidget({
    super.key,
    required this.boca,
  });

  @override
  Widget build(BuildContext context) {
    // final responsive = Responsive.of(context);
    final controller = Get.find<BocasController>();
    return InkWell(
      onTap: boca.estaRelevado
          ? () => controller.notif.mostrarSnackBar(
              color: NotiKey.info,
              mensaje: 'Esta boca ya está relevado',
              titulo: 'No permitido')
          : () async {
              final estaRelevado = await controller.estaRelevado(boca.id);
              if (estaRelevado) {
                boca.estaRelevado = estaRelevado;
                controller.update();
                controller.notif.mostrarSnackBar(
                    color: NotiKey.info,
                    mensaje: 'Esta boca ya está relevado',
                    titulo: 'No permitido');
                return;
              }
              controller.nav
                  .goTo(AppRoutes.newSurvey, arguments: {'id': boca.id});
            },
      child: Container(
        margin: EdgeInsets.only(bottom: context.hp(.5), right: 2, left: 2),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: .5,
            blurRadius: 1,
            offset: Offset(.5, 1),
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: boca.estaRelevado ? AppColors.successColor : null,
            child: boca.estaRelevado
                ? Icon(
                    FontAwesomeIcons.check,
                    color: Colors.white,
                    size: context.dp(2),
                  )
                : Text(
                    boca.nombre.trim().substring(0, 1),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
          ),
          title: Text(boca.nombre.trim()),
          subtitle: Text('Cod. ${boca.codBoca}'),
          minLeadingWidth: 1,
          contentPadding: EdgeInsets.symmetric(horizontal: context.wp(2)),
          trailing: boca.estaRelevado ? null : const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
