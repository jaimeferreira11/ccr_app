import 'package:ccr_app/app/data/models/respuesta_cab_model.dart';
import 'package:ccr_app/app/helpers/date_helper.dart';
import 'package:ccr_app/app/helpers/extensions.dart';
import 'package:ccr_app/app/modules/history/history_controller.dart';
import 'package:ccr_app/app/routes/app_routes.dart';
import 'package:ccr_app/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../global_widgets/custom_card.dart';

class HistoricoItemPendingWidget extends StatelessWidget {
  final RespuestaCabModel item;
  const HistoricoItemPendingWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HistoryController>();

    return InkWell(
      onTap: () => controller.nav.goTo(AppRoutes.resumeSurvey,
          parameters: {'id': item.isarId.toString(), 'isFromSurvey': 'false'}),
      child: CustomCard(
        marginVertical: context.hp(.5),
        marginHorizontal: 2,
        child: ListTile(
          leading: Checkbox(
            visualDensity: VisualDensity.compact,
            onChanged: (checked) {
              if (checked == null) return;
              if (checked == true) {
                controller.respuestaToUpload.add(item);
              } else {
                controller.respuestaToUpload
                    .removeWhere((r) => r.isarId == item.isarId);
              }
              controller.update();
            },
            activeColor: AppColors.accentColor,
            value: controller.respuestaToUpload
                .any((r) => r.isarId == item.isarId),
          ),
          visualDensity: VisualDensity.compact,
          title: Text(
            item.descBoca,
            style: context.textTheme.titleSmall
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            DateHelper.humanizaDate(
                date: DateHelper.stringToDate(dateString: item.fechaCreacion)),
            style: context.textTheme.labelSmall
                ?.copyWith(color: AppColors.secondaryColor),
          ),
          contentPadding: EdgeInsets.zero,
          trailing: IconButton(
              style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(
                    AppColors.errorColor,
                  ),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ))),
              onPressed: () {
                controller.eliminarRespuesta(item);
              },
              icon: Icon(
                FontAwesomeIcons.trashCan,
                color: Colors.white,
                size: context.dp(1.5),
              )),
        ),
      ),
    );
  }
}
