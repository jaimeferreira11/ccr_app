import 'package:ccr_app/app/data/models/respuesta_cab_model.dart';
import 'package:ccr_app/app/helpers/extensions.dart';
import 'package:ccr_app/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../global_widgets/custom_card.dart';
import '../../../helpers/date_helper.dart';
import '../../../routes/app_routes.dart';
import '../history_controller.dart';

class HistoricoItemWidget extends StatelessWidget {
  final RespuestaCabModel item;

  const HistoricoItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HistoryController>();

    return InkWell(
      onTap: () => controller.nav.goTo(AppRoutes.resumeSurvey,
          parameters: {'id': item.isarId.toString(), 'isFromSurvey': 'false'}),
      child: CustomCard(
        marginHorizontal: 2,
        marginVertical: context.hp(.5),
        child: ListTile(
          visualDensity: VisualDensity.compact,
          title: Text(
            item.descBoca,
            style: context.textTheme.titleSmall
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            item.sincronizado
                ? 'Subido el ${item.fechaSincronizacion == null ? ' -- ' : DateHelper.humanizaDate(date: DateHelper.stringToDate(dateString: item.fechaSincronizacion!))}'
                : 'Creado el ${DateHelper.humanizaDate(date: DateHelper.stringToDate(dateString: item.fechaCreacion))}',
            style: context.textTheme.labelSmall
                ?.copyWith(color: AppColors.secondaryColor),
          ),
          // contentPadding: EdgeInsets.zero,
          trailing: item.sincronizado
              ? const Icon(
                  FontAwesomeIcons.circleCheck,
                  color: AppColors.successColor,
                )
              : Icon(
                  FontAwesomeIcons.circle,
                  color: Colors.grey.shade400,
                ),
        ),
      ),
    );
  }
}
