import 'package:ccr_app/app/global_widgets/buscando_progress_w.dart';
import 'package:ccr_app/app/global_widgets/custom_appbar.dart';
import 'package:ccr_app/app/global_widgets/custom_icon_button.dart';
import 'package:ccr_app/app/helpers/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'new_survey_controller.dart';

class TemplatePage extends StatelessWidget {
  const TemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewSurveyController>(
        builder: (_) => SafeArea(
              child: Scaffold(
                appBar: const CustomAppBar(
                  titulo: 'Nuevo relevo - Fotografía',
                ),
                body: Stack(
                  children: [
                    Padding(
                      padding: UiHelper.marginBody,
                      child: Column(
                        children: [
                          const Spacer(),
                          CustomIconButton(
                            onPressed: () {},
                            text: 'Siguiente',
                            isFilled: true,
                            enabled: _.fotos.isNotEmpty,
                          )
                        ],
                      ),
                    ),
                    BuscandoProgressWidget(buscando: _.workInProgress)
                  ],
                ),
              ),
            ));
  }
}
