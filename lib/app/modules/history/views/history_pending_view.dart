import 'package:ccr_app/app/global_widgets/custom_icon_button.dart';
import 'package:ccr_app/app/global_widgets/no_data_widget.dart';
import 'package:ccr_app/app/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../history_controller.dart';
import '../local_widgets/historico_item_pending_widget.dart';

class HistoryPendindView extends StatelessWidget {
  const HistoryPendindView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HistoryController>();
    return GetBuilder<HistoryController>(
        builder: (_) => controller.respuestasPendientes.isEmpty
            ? const NoDataWidget()
            : Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: CheckboxListTile(
                              activeColor: AppColors.accentColor,
                              visualDensity: VisualDensity.compact,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              controlAffinity: ListTileControlAffinity.leading,
                              title: const Text('Seleccionar todos'),
                              value: controller.respuestaToUpload.length ==
                                  controller.respuestasPendientes.length,
                              onChanged: (checked) {
                                if (checked! == true) {
                                  controller.respuestaToUpload =
                                      controller.respuestasPendientes;
                                } else {
                                  controller.respuestaToUpload = [];
                                }
                                controller.update();
                              })),
                      SizedBox(
                        width: context.wp(30),
                        child: CustomIconButton(
                          icon: Icons.arrow_upward,
                          onPressed: () {
                            _.subirRespuestas();
                          },
                          text: ' Subir',
                          paddingHorizontal: 0,
                          isFilled: true,
                          contentCenter: true,
                          enabled: _.respuestaToUpload.isNotEmpty,
                        ),
                      )
                    ],
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.respuestasPendientes.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          HistoricoItemPendingWidget(
                        item: controller.respuestasPendientes[index],
                      ),
                    ),
                  )
                ],
              ));
  }
}
