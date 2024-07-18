import 'package:ccr_app/app/global_widgets/custom_icon_button.dart';
import 'package:ccr_app/app/global_widgets/no_data_widget.dart';
import 'package:ccr_app/app/helpers/extensions.dart';
import 'package:ccr_app/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../history_controller.dart';
import '../local_widgets/historico_item_widget.dart';

class HistoryUploadedView extends StatelessWidget {
  const HistoryUploadedView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
        builder: (_) => _.respuestasSubidas.isEmpty
            ? const NoDataWidget()
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: context.hp(1),
                        left: context.wp(2),
                        right: context.wp(2)),
                    child: CustomIconButton(
                        isFilled: true,
                        icon: Icons.delete_outline,
                        color: AppColors.errorColor,
                        onPressed: () => _.deleteSincronizados(),
                        text: '¿Borrar todos los subidos?'),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _.respuestasSubidas.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => HistoricoItemWidget(
                        item: _.respuestasSubidas[index],
                      ),
                    ),
                  )
                ],
              ));
  }
}
