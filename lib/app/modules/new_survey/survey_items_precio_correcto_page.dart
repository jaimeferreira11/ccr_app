import 'package:ccr_app/app/data/models/models.dart';
import 'package:ccr_app/app/global_widgets/buscando_progress_w.dart';
import 'package:ccr_app/app/global_widgets/custom_appbar.dart';
import 'package:ccr_app/app/global_widgets/custom_icon_button.dart';
import 'package:ccr_app/app/global_widgets/line_separator_widget.dart';
import 'package:ccr_app/app/helpers/extensions.dart';
import 'package:ccr_app/app/helpers/ui_helper.dart';
import 'package:ccr_app/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'new_survey_controller.dart';

class SurveyItemsPrecioCorrectoPage extends StatelessWidget {
  const SurveyItemsPrecioCorrectoPage({super.key});

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
                    titulo: 'Nuevo relevo - Precio Correcto',
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
                          // lineSeparator(marginVertical: 0),
                          // CheckboxListTile(
                          //   value: _.nuevaRespuesta!.detalles
                          //           .where((d) =>
                          //               d.cabecera ==
                          //                   _.cabeceraSelected!.codigo &&
                          //               d.valor == 'NO')
                          //           .length ==
                          //       _.cabeceraSelected!.items.length,
                          //   onChanged: (bool? value) {
                          //     if (value != null && value) {
                          //       _.reponderTodos(_.cabeceraSelected!);
                          //       return;
                          //     }
                          //     _.borrarRespuestas(_.cabeceraSelected!);
                          //     _.update(['survey-items']);
                          //   },
                          //   title: Text(
                          //     'Responder todo con "NO"',
                          //     style: context.textTheme.labelMedium,
                          //   ),
                          //   dense: true,
                          //   controlAffinity: ListTileControlAffinity.leading,
                          // ),
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
              width: item.pregunta == null ? context.wp(55) : context.wp(45),
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
                if (_.nuevaRespuesta!.detalles
                        .firstWhereOrNull((d) => d.idItem == item.id)
                        ?.valor !=
                    null)
                  IconButton(
                      onPressed: () async {
                        final respuesta = _.nuevaRespuesta!.detalles
                            .firstWhereOrNull((d) => d.idItem == item.id)!;
                        final isEnabled = respuesta.valor == 'NO' &&
                            respuesta.comentario! == 'NO DISPONIBLE';
                        final Map<String, dynamic>? resp = await _showModal(
                            context: context,
                            precio: respuesta.precio ?? '',
                            isEnabled: isEnabled,
                            valor: respuesta.valor,
                            comentario: respuesta.comentario ?? '',
                            controller: _);
                        if (resp == null) {
                          return;
                        }

                        _.responder(
                            item: item,
                            valor: respuesta.valor,
                            comentario: (resp['noDisponible'] as bool) == true
                                ? 'NO DISPONIBLE'
                                : '',
                            precio: resp['precio']);
                        _.update(['survey-items']);
                      },
                      icon: Icon(
                        FontAwesomeIcons.message,
                        size: context.dp(2.5),
                        color: AppColors.primaryColor,
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
                    onChanged: (value) async {
                      final Map<String, dynamic>? resp = await _showModal(
                          context: context,
                          precio: item.leyenda?.extractOnlyNumbers() ?? '',
                          valor: 'SI',
                          isEnabled: false,
                          comentario: _.nuevaRespuesta!.detalles
                                  .firstWhereOrNull((d) => d.idItem == item.id)
                                  ?.comentario ??
                              ''
                                  '',
                          controller: _);

                      if (resp == null) {
                        return;
                      }
                      _.responder(
                          item: item,
                          valor: value!,
                          comentario: (resp['noDisponible'] as bool) == true
                              ? 'NO DISPONIBLE'
                              : '',
                          precio: resp['precio']);
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
                      final Map<String, dynamic>? resp = await _showModal(
                          context: context,
                          precio: '',
                          isEnabled: true,
                          comentario: _.nuevaRespuesta!.detalles
                                  .firstWhereOrNull((d) => d.idItem == item.id)
                                  ?.comentario ??
                              '',
                          valor: 'NO',
                          controller: _);

                      if (resp == null) {
                        return;
                      }

                      _.responder(
                          item: item,
                          valor: value!,
                          comentario: (resp['noDisponible'] as bool) == true
                              ? 'NO DISPONIBLE'
                              : '',
                          precio: resp['precio']);
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

  Future<Map<String, dynamic>?> _showModal(
      {required context,
      required String precio,
      required String valor,
      required bool isEnabled,
      required String comentario,
      required NewSurveyController controller}) async {
    bool noDisponible = comentario.toUpperCase() == 'NO DISPONIBLE';
    FocusNode textFieldFocusNode = FocusNode();
    final formkey = GlobalKey<FormState>();
    final textController = TextEditingController();

    textController.text = precio;
    // if (valor == 'SI') {
    //   textController.text = precio;
    // } else {
    //   textController.text = '';
    // }

    final resp = await Get.dialog(
        Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          child: Padding(
            padding: EdgeInsets.only(
                top: 20,
                right: 20,
                left: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 25),
            child: StatefulBuilder(
              builder: (context, setState) {
                return Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CheckboxListTile(
                        title: const Text('No disponible'),
                        value: noDisponible,
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (value) {
                          setState(() {
                            noDisponible = value!;
                            formkey.currentState!.reset();
                            if (!noDisponible) {
                              Future.delayed(const Duration(milliseconds: 100),
                                  () {
                                textFieldFocusNode.requestFocus();
                              });
                            } else {
                              textFieldFocusNode.unfocus();
                            }
                            if (isEnabled && value == true) {
                              textController.text = 'NO DISPONIBLE';
                            } else if (valor.toUpperCase() == 'NO') {
                              textController.text = '';
                              textFieldFocusNode.requestFocus();
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        focusNode: textFieldFocusNode,
                        controller: textController,
                        style: const TextStyle(color: Colors.black87),
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade300,
                            filled: (!isEnabled) || (isEnabled && noDisponible),
                            hintText: 'Introduzca el precio',
                            label: const Text('Precio')),
                        enabled: isEnabled && !noDisponible,
                        keyboardType: TextInputType.number,
                        textCapitalization: TextCapitalization.sentences,
                        autofocus: isEnabled,
                        validator: (value) {
                          if (valor == 'NO' && noDisponible == false) {
                            if (value == null || value.isEmpty) {
                              return 'Completa el precio';
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: CustomIconButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                Get.back(result: {
                                  'noDisponible': noDisponible,
                                  'precio':
                                      (valor == 'NO' && noDisponible == true)
                                          ? ''
                                          : textController.text
                                });
                              }
                            },
                            paddingHorizontal: 0,
                            text: 'Aceptar',
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        barrierDismissible: false);

    print(resp);

    return resp;
  }
}
