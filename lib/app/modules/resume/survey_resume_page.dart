import 'dart:io';

import 'package:ccr_app/app/data/models/models.dart';
import 'package:ccr_app/app/global_widgets/buscando_progress_w.dart';
import 'package:ccr_app/app/global_widgets/custom_appbar.dart';
import 'package:ccr_app/app/global_widgets/custom_card.dart';
import 'package:ccr_app/app/global_widgets/full_screen_list_images_view.dart';
import 'package:ccr_app/app/global_widgets/line_separator_widget.dart';
import 'package:ccr_app/app/helpers/extensions.dart';
import 'package:ccr_app/app/modules/resume/survey_resume_controller.dart';
import 'package:ccr_app/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../global_widgets/custom_icon_button.dart';

class SurveyResumePage extends StatelessWidget {
  const SurveyResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SurveyResumeController>(
        id: 'resume-survey',
        builder: (_) => SafeArea(
              child: PopScope(
                onPopInvoked: (didPop) {
                  // if (_.isFromSurvey == false) return;
                  // _.notif.mostrarSnackBar(
                  //     color: NotiKey.info,
                  //     titulo: 'Actualice la lista',
                  //     mensaje: 'Estire la lista de arriba hacia abajo');
                },
                child: Scaffold(
                  appBar: const CustomAppBar(
                    titulo: 'Resumen',
                  ),
                  body: Stack(
                    children: [
                      if (_.respuesta != null)
                        Column(
                          children: [
                            SizedBox(
                              height: context.hp(1),
                            ),
                            CustomCard(
                                child: ListTile(
                              dense: false,
                              leading: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: _.respuesta!.sincronizado == true
                                        ? Colors.transparent
                                        : AppColors.primaryColor,
                                    width: 2,
                                  ),
                                ),
                                child: CircleAvatar(
                                  backgroundColor: _.respuesta!.sincronizado
                                      ? AppColors.successColor
                                      : Colors.white,
                                  child: _.respuesta!.sincronizado
                                      ? Icon(
                                          FontAwesomeIcons.cloudArrowUp,
                                          color: Colors.white,
                                          size: context.dp(2),
                                        )
                                      : Icon(
                                          FontAwesomeIcons.hourglass,
                                          color: AppColors.primaryColor,
                                          size: context.dp(2),
                                        ),
                                ),
                              ),
                              title: Text(
                                  '${_.respuesta?.codBoca} - ${_.respuesta?.descBoca.trim()}'),
                              trailing: Text(
                                '(${_.respuesta?.detalles.length ?? 0})',
                                style: context.textTheme.titleLarge,
                              ),
                            )),
                            SizedBox(
                              height: context.hp(1),
                            ),
                            if (_.respuesta?.imagenes.isNotEmpty ?? false)
                              Container(
                                  width: context.wp(80),
                                  height: context.hp(7),
                                  margin:
                                      EdgeInsets.only(bottom: context.hp(2)),
                                  child: InkWell(
                                    onTap: () => Get.to(() =>
                                        FullScreenListImagesView(
                                            images: _.respuesta!.imagenes
                                                .map((e) => FileImage(
                                                    File(e.pathImagen)))
                                                .toList())),
                                    child: FlutterImageStack.widgets(
                                      showTotalCount: true,
                                      totalCount:
                                          _.respuesta?.imagenes.length ?? 0,
                                      itemRadius: 50,
                                      itemCount: 8,
                                      itemBorderWidth: 1,
                                      children: _.respuesta!.imagenes
                                          .map((e) =>
                                              Image.file(File(e.pathImagen)))
                                          .toList(), // Border width around the images
                                    ),
                                  )),
                            if (_.respuesta?.imagenes.isNotEmpty ?? false)
                              Container(
                                width: context.wp(80),
                                padding: EdgeInsets.only(bottom: context.hp(1)),
                                child: CustomIconButton(
                                    paddingHorizontal: 0,
                                    icon: Icons.upload,
                                    onPressed: () =>
                                        _.subirImagenes(_.respuesta!),
                                    text: 'Volver a subir las imágenes'),
                              ),
                            Expanded(
                                child: ListView.builder(
                                    itemCount: _.keys.length,
                                    itemBuilder: (context, index) {
                                      final key = _.keys[index];
                                      final respuestas = _.data[key]!;
                                      return CustomCard(
                                        color: Colors.grey.shade400,
                                        child: ExpansionTile(
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(key),
                                                Text('(${respuestas.length})'),
                                              ],
                                            ),
                                            collapsedShape:
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              side: const BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              side: const BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            textColor: AppColors.primaryColor,
                                            collapsedBackgroundColor:
                                                Colors.grey.shade400,
                                            backgroundColor: Colors.white,
                                            dense: true,
                                            children: respuestas
                                                .map((r) => Column(
                                                      children: [
                                                        lineSeparator(),
                                                        _ItemWidget(
                                                          item: r,
                                                          controller: _,
                                                        ),
                                                      ],
                                                    ))
                                                .toList()),
                                      );
                                    })),
                            Column(
                              children: [
                                CustomIconButton(
                                  onPressed: () {
                                    _.nav.back();
                                    if (_.isFromSurvey == true) {
                                      _.nav.back();
                                    }
                                  },
                                  text: 'Volver',
                                  isFilled: true,
                                ),
                                SizedBox(
                                  height: context.hp(1),
                                )
                              ],
                            ),
                          ],
                        ),
                      BuscandoProgressWidget(buscando: _.workInProgress)
                    ],
                  ),
                ),
              ),
            ));
  }
}

class _ItemWidget extends StatelessWidget {
  final RespuestaDetModel item;
  final SurveyResumeController controller;
  const _ItemWidget({required this.item, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: context.hp(.5), horizontal: context.wp(2)),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            SizedBox(
              width: context.wp(45),
              child: Text(
                item.descItem,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.labelSmall
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                const Spacer(
                  flex: 2,
                ),
                if ((item.comentario != null && item.comentario!.isNotEmpty) ||
                    (item.precio != null && item.precio!.isNotEmpty))
                  IconButton(
                      onPressed: () {
                        _showModal(
                            context: context,
                            pregunta: '',
                            precio: item.precio,
                            respuesta: item.comentario!);
                      },
                      icon: Icon(
                        FontAwesomeIcons.message,
                        size: context.dp(2.5),
                      )),
                const Spacer(
                  flex: 2,
                ),
                Radio(
                    value: 'SI',
                    groupValue: item.valor,
                    visualDensity: VisualDensity.compact,
                    onChanged: (value) {}),
                Text(
                  'SI',
                  style: context.textTheme.bodySmall,
                ),
                Radio(
                    value: 'NO',
                    groupValue: item.valor,
                    visualDensity: VisualDensity.compact,
                    onChanged: (value) {}),
                Text(
                  'NO',
                  style: context.textTheme.bodySmall,
                ),
              ],
            ))
          ],
        ));
  }

  Future<String> _showModal(
      {required context,
      required String pregunta,
      String? precio,
      required String respuesta}) async {
    String result = respuesta;
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        // backgroundColor: Colors.grey,
        isDismissible: true,
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
              padding: EdgeInsets.only(
                  top: 5,
                  right: 20,
                  left: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(Icons.close)),
                    ),
                  ),

                  // Text(
                  //   pregunta,
                  //   style: context.textTheme.titleMedium,
                  //   maxLines: 3,
                  // ),

                  if (precio != null) ...[
                    SizedBox(height: context.hp(.5)),
                    TextFormField(
                      initialValue: precio,
                      decoration: const InputDecoration(
                          hintText: '', label: Text('Precio')),
                      autofocus: true,
                      onFieldSubmitted: (value) {
                        controller.nav.back();
                      },
                      enabled: false,
                      onChanged: (value) => result = value,
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ],
                  SizedBox(height: context.hp(.5)),
                  TextFormField(
                    initialValue: result,
                    decoration: const InputDecoration(
                        hintText: '', label: Text('Comentario')),
                    autofocus: true,
                    onFieldSubmitted: (value) {
                      controller.nav.back();
                    },
                    enabled: false,
                    onChanged: (value) => result = value,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ],
              ),
            ));

    return result;
  }
}
