import 'package:ccr_app/app/global_widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../history_controller.dart';
import '../local_widgets/historico_item_widget.dart';

class HistoryAllView extends StatelessWidget {
  const HistoryAllView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HistoryController>();
    return controller.allRespuestas.isEmpty
        ? const NoDataWidget()
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.allRespuestas.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => HistoricoItemWidget(
                    item: controller.allRespuestas[index],
                  ),
                ),
              )
            ],
          );
  }
}
