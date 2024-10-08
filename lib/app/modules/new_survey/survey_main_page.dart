import 'dart:developer';
import 'dart:io';

import 'package:ccr_app/app/config/constants.dart';
import 'package:ccr_app/app/global_widgets/buscando_progress_w.dart';
import 'package:ccr_app/app/global_widgets/custom_appbar.dart';
import 'package:ccr_app/app/global_widgets/custom_card.dart';
import 'package:ccr_app/app/global_widgets/custom_icon_button.dart';
import 'package:ccr_app/app/helpers/extensions.dart';
import 'package:ccr_app/app/helpers/ui_helper.dart';
import 'package:ccr_app/app/modules/new_survey/survey_multiple_photo_page.dart';
import 'package:ccr_app/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../data/models/respuesta_imagen_model.dart';
import '../../global_widgets/yes_no_dialog.dart';
import 'new_survey_controller.dart';

class SurveyMainPage extends StatelessWidget {
  const SurveyMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewSurveyController>(
        id: 'survey-main',
        builder: (_) => PopScope(
              canPop: false,
              onPopInvoked: (pop) async {
                if (pop) return;
                final dial = await DialogoSiNo()
                    .abrirDialogoSiNo('Cancelar relevo?', '');
                if (dial == 0) return;
                Get.back();
              },
              child: SafeArea(
                child: Scaffold(
                  appBar: const CustomAppBar(
                    titulo: 'Nuevo relevo - Categorías',
                  ),
                  body: Stack(
                    children: [
                      if (_.nuevaRespuesta != null)
                        Padding(
                          padding: UiHelper.marginBody,
                          child: Column(
                            children: [
                              SizedBox(
                                height: context.hp(1),
                              ),
                              Text(
                                "${(_.getTotalProgress() * 100).round()}%",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: context.wp(3)),
                                child: LinearProgressIndicator(
                                  color: AppColors.successColor,
                                  value: _.getTotalProgress(),
                                  minHeight: context.hp(1.5),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              SizedBox(
                                height: context.hp(2),
                              ),
                              ..._.cabeceras.map(
                                (c) => InkWell(
                                  onTap: () {
                                    _.selectCabecera(c);
                                  },
                                  child: CustomCard(
                                      marginVertical: context.hp(1),
                                      child: ListTile(
                                        dense: false,
                                        title: Text(
                                            '${c.titulo}  (${_.getCountRespuestasByCabecera(c.codigo)}/${c.items.length})'),
                                        trailing: _.getCountRespuestasByCabecera(
                                                    c.codigo) ==
                                                0
                                            ? Icon(
                                                FontAwesomeIcons.circle,
                                                color: Colors.grey.shade400,
                                                size: context.dp(3),
                                              )
                                            : (_.getCountRespuestasByCabecera(
                                                        c.codigo) ==
                                                    c.items.length)
                                                ? Icon(
                                                    FontAwesomeIcons
                                                        .circleCheck,
                                                    color:
                                                        AppColors.successColor,
                                                    size: context.dp(3),
                                                  )
                                                : Icon(
                                                    FontAwesomeIcons.circle,
                                                    color:
                                                        AppColors.successColor,
                                                    size: context.dp(3),
                                                  ),
                                      )),
                                ),
                              ),
                              InkWell(
                                onTap: () => Get.to(
                                    () => const SurveyMultiplePhotoPage()),
                                child: CustomCard(
                                    child: ListTile(
                                        dense: false,
                                        title: Text(
                                            'Fotos (${(_.nuevaRespuesta?.imagenes.length ?? 0)})'),
                                        trailing: _validarCantidadFotos(_)
                                            ? Icon(
                                                FontAwesomeIcons.circleCheck,
                                                color: AppColors.successColor,
                                                size: context.dp(3),
                                              )
                                            : Icon(
                                                FontAwesomeIcons.circle,
                                                color: Colors.grey.shade400,
                                                size: context.dp(3),
                                              ))),
                              ),
                              const Spacer(),
                              CustomIconButton(
                                onPressed: () async {
                                  final isok =
                                      await _verificarExistenciaFoto(_);

                                  if (!isok) {
                                    DialogoSiNo().abrirDialogo("Atención",
                                        "Una o mas imágenes no fueran guardadas correctamente.\nPor favor, revísalas antes de continuar.");
                                    return;
                                  }
                                  _.finalizar();
                                },
                                text: 'Finalizar relevo',
                                isFilled: true,
                                enabled: _.nuevaRespuesta!.detalles.length ==
                                        _.cabeceras.fold(0,
                                            (sum, c) => sum + c.items.length) &&
                                    _validarCantidadFotos(_),
                              )
                            ],
                          ),
                        ),
                      BuscandoProgressWidget(buscando: _.workInProgress)
                    ],
                  ),
                ),
              ),
            ));
  }

  bool _validarCantidadFotos(NewSurveyController _) {
    return _.nuevaRespuesta!.imagenes.isNotEmpty &&
        _.nuevaRespuesta!.imagenes.length >= AppConstants.minFotos &&
        _.nuevaRespuesta!.imagenes.length <= AppConstants.maxFotos;
  }

  Future<bool> _verificarExistenciaFoto(NewSurveyController _) async {
    if (_.nuevaRespuesta!.imagenes.isEmpty) return false;

    bool isOk = true;
    final List<RespuestaImagenModel> copiaImagenes =
        List.from(_.nuevaRespuesta!.imagenes);

    for (var img in copiaImagenes) {
      final file = File(img.pathImagen);
      final exists = file.existsSync();
      if (!exists) {
        log('La imagen no existe, se eliminara de la lista');
        _.nuevaRespuesta!.imagenes.remove(img);
        _.update(['survey-main']);
        isOk = false;
      }
    }

    return isOk;
  }
}
