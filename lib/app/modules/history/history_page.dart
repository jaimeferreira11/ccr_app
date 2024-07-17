import 'package:ccr_app/app/global_widgets/buscando_progress_w.dart';
import 'package:ccr_app/app/global_widgets/custom_appbar.dart';
import 'package:ccr_app/app/helpers/ui_helper.dart';
import 'package:ccr_app/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'history_controller.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
        id: 'historico-page',
        builder: (controller) => SafeArea(
              child: Scaffold(
                appBar: const CustomAppBar(
                  titulo: 'Historico',
                ),
                body: Stack(
                  children: [
                    controller.tabController == null
                        ? const SizedBox()
                        : Column(
                            children: [
                              TabBar(
                                controller: controller.tabController,
                                indicatorColor: AppColors.primaryColor,
                                labelColor: AppColors.textColor,
                                unselectedLabelColor: Colors.black54,
                                tabs: const [
                                  Tab(
                                    text: 'Pendientes',
                                  ),
                                  Tab(
                                    text: 'Subidos',
                                  ),
                                  Tab(
                                    text: 'Todos',
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  margin: UiHelper.marginBody,
                                  child: controller.children[
                                      controller.tabController?.index ?? 0],
                                ),
                              )
                            ],
                          ),
                    BuscandoProgressWidget(buscando: controller.workInProgress)
                  ],
                ),
              ),
            ));
  }
}
