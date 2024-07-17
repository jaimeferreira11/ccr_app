import 'dart:io';

import 'package:ccr_app/app/global_widgets/buscando_progress_w.dart';
import 'package:ccr_app/app/global_widgets/custom_appbar.dart';
import 'package:ccr_app/app/global_widgets/custom_icon_button.dart';
import 'package:ccr_app/app/global_widgets/full_screen_image_view.dart';
import 'package:ccr_app/app/helpers/extensions.dart';
import 'package:ccr_app/app/helpers/ui_helper.dart';
import 'package:ccr_app/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/yes_no_dialog.dart';
import 'new_survey_controller.dart';

class SurveyPhotoPage extends StatelessWidget {
  const SurveyPhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewSurveyController>(
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
                    titulo: 'Nuevo relevo - Fotografía',
                  ),
                  body: Stack(
                    children: [
                      Padding(
                        padding: UiHelper.marginBody,
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Tomar fotografía',
                                style: context.textTheme.titleLarge,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: context.hp(2),
                            ),
                            Center(
                              child: Text(
                                'Toca el icono de la cámara',
                                style: context.textTheme.titleSmall
                                    ?.copyWith(color: AppColors.accentColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            InkWell(
                              onTap: () => _.capturarImagen(),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: context.hp(2),
                                    horizontal: context.wp(12)),
                                width: double.infinity,
                                height: context.hp(20),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.primaryColor,
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Icon(
                                    Icons.add_a_photo_outlined,
                                    size: context.dp(12),
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            if (_.fotos.isNotEmpty) ...[
                              Center(
                                child: Text(
                                  'Vista previa',
                                  style: context.textTheme.titleSmall
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: context.hp(1),
                              ),
                              Wrap(
                                direction: Axis.horizontal,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.center,
                                children: _.fotos
                                    .map((e) => Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Stack(
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () => Get.to(() =>
                                                        FullScreenImageView(
                                                            imageProvider:
                                                                FileImage(File(
                                                                    e.path)))),
                                                    child: Image.file(
                                                      File(e.path),
                                                      width: double.infinity,
                                                      height: context.hp(25),
                                                    ),
                                                  ),
                                                  Material(
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      onTap: () {
                                                        _.fotos.remove(e);
                                                        _.update();
                                                      },
                                                      child: Container(
                                                        // height: 10,
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                            vertical: 2),
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 20,
                                                                vertical: 5),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                            color: AppColors
                                                                .errorColor),
                                                        // width: double.infinity,
                                                        child: Text(
                                                          'Eliminar',
                                                          style: context
                                                              .textTheme
                                                              .titleMedium
                                                              ?.copyWith(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              // Positioned(
                                              //   right: 100,
                                              //   // left: 100,
                                              //   // top: 0,
                                              //   child: CupertinoButton(
                                              //     color: Colors.black38,
                                              //     padding:
                                              //         const EdgeInsets.all(1),
                                              //     borderRadius:
                                              //         BorderRadius.circular(30),
                                              //     child: Icon(
                                              //       FontAwesomeIcons.xmark,
                                              //       size: context.dp(2.5),
                                              //     ),
                                              //     onPressed: () {
                                              //       _.fotos.remove(e);
                                              //       _.update();
                                              //     },
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ],
                            const Spacer(),
                            CustomIconButton(
                              onPressed: () {
                                _.nextPage1();
                              },
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
              ),
            ));
  }
}