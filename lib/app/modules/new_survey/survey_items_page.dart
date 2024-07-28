import 'dart:developer';

import 'package:ccr_app/app/data/models/models.dart';
import 'package:ccr_app/app/global_widgets/buscando_progress_w.dart';
import 'package:ccr_app/app/global_widgets/custom_appbar.dart';
import 'package:ccr_app/app/global_widgets/custom_icon_button.dart';
import 'package:ccr_app/app/global_widgets/full_screen_image_view.dart';
import 'package:ccr_app/app/global_widgets/line_separator_widget.dart';
import 'package:ccr_app/app/global_widgets/yes_no_dialog.dart';
import 'package:ccr_app/app/helpers/extensions.dart';
import 'package:ccr_app/app/helpers/file_helper.dart';
import 'package:ccr_app/app/helpers/ui_helper.dart';
import 'package:ccr_app/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'new_survey_controller.dart';

class SurveyItemsPage extends StatelessWidget {
  const SurveyItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewSurveyController>(
        id: 'survey-items',
        builder: (_) => PopScope(
              onPopInvoked: (didPop) {
                _.update(['survey-main']);
              },
              child: SafeArea(
                child: Scaffold(
                  appBar: const CustomAppBar(
                    titulo: 'Nuevo relevo - Items',
                  ),
                  body: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.hp(2),
                                vertical: context.hp(1)),
                            decoration: BoxDecoration(
                                color: AppColors.accentColor.shade100
                                    .withOpacity(.5)),
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _.cabeceraSelected?.titulo ?? '',
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  _.cabeceraSelected?.descripcion ?? '',
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: Colors.black54,
                                  ),
                                )
                              ],
                            ),
                          ),
                          if (_.cabeceraSelected != null)
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: context.hp(1)),
                              child: RichText(
                                  text: TextSpan(
                                      style: context.textTheme.titleMedium,
                                      children: [
                                    TextSpan(
                                        text: 'Cantidad de respuestas: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                _.getCountRespuestasByCabecera(_
                                                            .cabeceraSelected!
                                                            .codigo) ==
                                                        _.cabeceraSelected!
                                                            .items.length
                                                    ? AppColors.successColor
                                                    : null)),
                                    TextSpan(
                                        text:
                                            '${_.getCountRespuestasByCabecera(_.cabeceraSelected!.codigo)} de ${_.cabeceraSelected!.items.length}',
                                        style: TextStyle(
                                            color:
                                                _.getCountRespuestasByCabecera(_
                                                            .cabeceraSelected!
                                                            .codigo) ==
                                                        _.cabeceraSelected!
                                                            .items.length
                                                    ? AppColors.successColor
                                                    : null)),
                                  ])),
                            ),
                          lineSeparator(marginVertical: 0),
                          CheckboxListTile(
                            value: _.nuevaRespuesta!.detalles
                                    .where((d) =>
                                        d.cabecera ==
                                            _.cabeceraSelected!.codigo &&
                                        d.valor == 'NO')
                                    .length ==
                                _.cabeceraSelected!.items.length,
                            onChanged: (bool? value) {
                              if (value != null && value) {
                                _.reponderTodos(_.cabeceraSelected!);
                                return;
                              }
                              _.borrarRespuestas(_.cabeceraSelected!);
                              _.update(['survey-items']);
                            },
                            title: Text(
                              'Responder todo con "NO"',
                              style: context.textTheme.labelMedium,
                            ),
                            dense: true,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          lineSeparator(marginVertical: 0),
                          if (_.cabeceraSelected != null)
                            Expanded(
                              child: Padding(
                                padding: UiHelper.marginBody
                                    .copyWith(top: context.hp(1)),
                                child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        lineSeparator(),
                                    itemCount: _.cabeceraSelected!.items.length,
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (__, index) => _ItemWidget(
                                        item:
                                            _.cabeceraSelected!.items[index])),
                              ),
                            ),
                          CustomIconButton(
                            onPressed: () {
                              _.update(['survey-main']);
                              // guardar en memoria y volver
                              _.nav.back();
                            },
                            text: 'Volver',
                            isFilled: false,
                          ),
                          SizedBox(
                            height: context.hp(1),
                          )
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
  final ItemModel item;
  const _ItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    final _ = Get.find<NewSurveyController>();
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: context.hp(.5), horizontal: context.wp(2)),
        decoration: BoxDecoration(
            color: _.nuevaRespuesta!.detalles
                        .firstWhereOrNull((d) => d.idItem == item.id)
                        ?.valor !=
                    null
                ? AppColors.successColor.withOpacity(.1)
                : Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            SizedBox(
              width: context.wp(10),
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: item.imgBase64String == null
                    ? const CircleAvatar(
                        child: Icon(Icons.image_not_supported_outlined),
                      )
                    : InkWell(
                        onTap: () => Get.to(() => FullScreenImageView(
                            text: item.descripcion,
                            imageProvider: MemoryImage(
                                FileHelper.convertBase64ToImage(
                                    item.imgBase64String!)))),
                        child: Image.memory(FileHelper.convertBase64ToImage(
                            item.imgBase64String!)),
                      ),
              ),
            ),
            SizedBox(
              width: item.pregunta == null ? context.wp(45) : context.wp(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.descripcion,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.labelSmall?.copyWith(
                        fontWeight: item.leyenda == null
                            ? FontWeight.w500
                            : FontWeight.w600),
                  ),
                  if (item.leyenda != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        item.leyenda!.capitalizeFirst ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.labelSmall?.copyWith(
                            color: Colors.black54, fontWeight: FontWeight.w500),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: [
                const Spacer(
                  flex: 2,
                ),
                if (item.pregunta != null && item.pregunta!.isNotEmpty)
                  IconButton(
                      onPressed: _.nuevaRespuesta!.detalles
                                  .firstWhereOrNull((d) => d.idItem == item.id)
                                  ?.valor ==
                              'SI'
                          ? () async {
                              final res = await _showModal(
                                  context: context,
                                  controller: _,
                                  pregunta: item.pregunta!,
                                  respuesta: _.nuevaRespuesta!.detalles
                                          .firstWhere(
                                              (d) => d.idItem == item.id)
                                          .comentario ??
                                      '');

                              log(res);

                              _.responder(
                                  item: item, valor: 'SI', comentario: res);
                              _.update(['survey-items']);
                            }
                          : null,
                      icon: _.nuevaRespuesta!.detalles
                                      .firstWhereOrNull(
                                          (d) => d.idItem == item.id)
                                      ?.valor ==
                                  'SI' ||
                              (_.nuevaRespuesta!.detalles.firstWhereOrNull(
                                          (d) => d.idItem == item.id) !=
                                      null &&
                                  (_.nuevaRespuesta!.detalles
                                              .firstWhereOrNull(
                                                  (d) => d.idItem == item.id)
                                              ?.comentario !=
                                          null &&
                                      _.nuevaRespuesta!.detalles
                                          .firstWhereOrNull(
                                              (d) => d.idItem == item.id)!
                                          .comentario!
                                          .isNotEmpty))
                          ? Icon(
                              FontAwesomeIcons.penToSquare,
                              size: context.dp(2.5),
                              color: _.nuevaRespuesta!.detalles
                                              .firstWhereOrNull(
                                                  (d) => d.idItem == item.id)
                                              ?.comentario ==
                                          null ||
                                      _.nuevaRespuesta!.detalles
                                          .firstWhereOrNull(
                                              (d) => d.idItem == item.id)!
                                          .comentario!
                                          .isEmpty
                                  ? Colors.black87
                                  : AppColors.primaryColor,
                            )
                          : Icon(
                              FontAwesomeIcons.penToSquare,
                              size: context.dp(2.5),
                              color: Colors.black38,
                            )),
                const Spacer(
                  flex: 2,
                ),
                Radio(
                    value: 'SI',
                    groupValue: _.nuevaRespuesta!.detalles
                                .firstWhereOrNull((d) => d.idItem == item.id) ==
                            null
                        ? null
                        : _.nuevaRespuesta!.detalles
                            .firstWhere((d) => d.idItem == item.id)
                            .valor,
                    visualDensity: VisualDensity.compact,
                    onChanged: (value) {
                      String comentario = '';
                      if (item.codCabecera == 'PRECIO_CORRECTO') {
                        comentario = item.leyenda?.extractOnlyNumbers() ?? '';
                      }

                      _.responder(
                          item: item, valor: value!, comentario: comentario);
                      _.update(['survey-items']);
                    }),
                Text(
                  'SI',
                  style: context.textTheme.bodySmall,
                ),
                Radio(
                    value: 'NO',
                    groupValue: _.nuevaRespuesta!.detalles
                                .firstWhereOrNull((d) => d.idItem == item.id) ==
                            null
                        ? null
                        : _.nuevaRespuesta!.detalles
                            .firstWhere((d) => d.idItem == item.id)
                            .valor,
                    visualDensity: VisualDensity.compact,
                    onChanged: (value) async {
                      // levntar un modal de

                      String comentario = '';

                      if (_.cabeceraSelected!.codigo == 'PRECIO_CORRECTO') {
                        final dial = await DialogoSiNo().abrirDialogoSiNo(
                          '¿Marcar como no disponible?',
                          '',
                          negativeText: 'NO',
                          positiveText: 'SI',
                        );

                        if (dial == 0) {
                          comentario = '';
                        } else {
                          comentario = 'No disponible';
                        }
                      }

                      _.responder(
                          item: item, valor: value!, comentario: comentario);
                      _.update(['survey-items']);
                    }),
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
      required NewSurveyController controller,
      String respuesta = ''}) async {
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
                  top: 20,
                  right: 20,
                  left: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    pregunta,
                    style: context.textTheme.titleMedium,
                    maxLines: 3,
                  ),
                  SizedBox(height: context.hp(1.5)),
                  TextFormField(
                    initialValue: result,
                    decoration: const InputDecoration(hintText: ''),
                    autofocus: true,
                    onFieldSubmitted: (value) {
                      controller.nav.back();
                    },
                    onChanged: (value) => result = value,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ],
              ),
            ));

    return result;
  }
}
