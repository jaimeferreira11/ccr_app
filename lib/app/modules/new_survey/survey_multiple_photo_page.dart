import 'dart:io';

import 'package:ccr_app/app/config/constants.dart';
import 'package:ccr_app/app/data/models/respuesta_imagen_model.dart';
import 'package:ccr_app/app/global_widgets/buscando_progress_w.dart';
import 'package:ccr_app/app/global_widgets/custom_appbar.dart';
import 'package:ccr_app/app/global_widgets/custom_icon_button.dart';
import 'package:ccr_app/app/global_widgets/full_screen_image_view.dart';
import 'package:ccr_app/app/helpers/extensions.dart';
import 'package:ccr_app/app/helpers/ui_helper.dart';
import 'package:ccr_app/app/theme/colors.dart';
import 'package:ccr_app/flavors/build_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../helpers/file_helper.dart';
import 'new_survey_controller.dart';

class SurveyMultiplePhotoPage extends StatelessWidget {
  const SurveyMultiplePhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewSurveyController>(
        builder: (_) => SafeArea(
              child: Scaffold(
                appBar: const CustomAppBar(
                  titulo: 'Nuevo relevo - Fotografías',
                ),
                body: Stack(
                  children: [
                    Padding(
                      padding: UiHelper.marginBody,
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'Tomar fotografías',
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
                            onTap: _.nuevaRespuesta!.imagenes.length >=
                                    AppConstants.maxFotos
                                ? null
                                : () async => _onTap(_),
                            child: _cameraIcon(context, _),
                          ),
                          if (_.nuevaRespuesta!.imagenes.isNotEmpty) ...[
                            Center(
                              child: Text(
                                'Vista previa',
                                style: context.textTheme.titleSmall
                                    ?.copyWith(fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: context.hp(2),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    alignment: WrapAlignment.spaceAround,
                                    children: _.nuevaRespuesta!.imagenes
                                        .map((e) => _imagenItem(context, e, _))
                                        .toList(),
                                  ),
                                ),
                              ),
                            ),
                          ] else
                            const Spacer(),
                          SizedBox(
                            width: context.wp(90),
                            child: CustomIconButton(
                              onPressed: () {
                                _.update(['survey-main']);
                                // guardar en memoria y volver
                                _.nav.back();
                              },
                              text: 'Volver',
                              isFilled: false,
                            ),
                          ),
                          SizedBox(
                            height: context.hp(1),
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

  Widget _cameraIcon(BuildContext context, NewSurveyController _) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: context.hp(2), horizontal: context.wp(12)),
      width: double.infinity,
      height: context.hp(20),
      decoration: BoxDecoration(
          border: Border.all(
            color: _.nuevaRespuesta!.imagenes.length >= AppConstants.maxFotos
                ? Colors.grey
                : AppColors.primaryColor,
          ),
          color: _.nuevaRespuesta!.imagenes.length >= AppConstants.maxFotos
              ? Colors.grey.shade200
              : Colors.white,
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: _.nuevaRespuesta!.imagenes.length >= AppConstants.maxFotos
            ? Icon(
                FontAwesomeIcons.ban,
                size: context.dp(12),
                color: Colors.grey,
              )
            : Icon(
                Icons.add_a_photo_outlined,
                size: context.dp(12),
                color: AppColors.primaryColor,
              ),
      ),
    );
  }

  Widget _imagenItem(
      BuildContext context, RespuestaImagenModel e, NewSurveyController _) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 10),
      width: context.wp(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => Get.to(() => FullScreenImageView(
                imageProvider: FileImage(File(e.pathImagen)))),
            child: Image.file(
              File(e.pathImagen),
              width: double.infinity,
              height: context.hp(10),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async {
                // elimnar el file
                FileHelper.deleteImage(e.pathImagen);
                // eliminar de la lista
                _.nuevaRespuesta!.imagenes.remove(e);

                // renombar los files
                if (_.nuevaRespuesta!.imagenes.isNotEmpty) {
                  for (int index = 0;
                      index < _.nuevaRespuesta!.imagenes.length;
                      index++) {
                    var img = _.nuevaRespuesta!.imagenes[index];
                    String newPath = await FileHelper.renameFile(
                      oldPath: img.pathImagen,
                      newPath: _.armarNombreFoto(index + 1),
                    );

                    _.nuevaRespuesta!.imagenes[index].pathImagen = newPath;
                  }
                }
                _.update();
              },
              child: Container(
                // height: 10,
                margin: const EdgeInsets.symmetric(vertical: 2),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.errorColor),
                // width: double.infinity,
                child: Text(
                  'Eliminar',
                  style: context.textTheme.labelSmall
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _onTap(NewSurveyController _) async {
    final file = await _.capturarImagen();

    if (file == null) return;

    final fileName = _.armarNombreFoto(_.nuevaRespuesta!.imagenes.length + 1);
    final path = await FileHelper.saveImageToDirectory(file,
        folderName: BuildConfig.instance.config.imagesFolder,
        fileName: fileName);
    final res = RespuestaImagenModel(pathImagen: path ?? '');

    _.nuevaRespuesta!.imagenes = [
      ..._.nuevaRespuesta!.imagenes,
      res,
    ];
    _.update();
  }
}
