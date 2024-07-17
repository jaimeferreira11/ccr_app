import 'package:ccr_app/app/global_widgets/no_data_widget.dart';
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
