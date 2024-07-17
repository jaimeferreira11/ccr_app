import 'package:ccr_app/app/global_widgets/custom_appbar.dart';
import 'package:ccr_app/app/global_widgets/custom_input.dart';
import 'package:ccr_app/app/global_widgets/custom_input_select_widget.dart';
import 'package:ccr_app/app/global_widgets/line_separator_widget.dart';
import 'package:ccr_app/app/helpers/extensions.dart';
import 'package:ccr_app/app/helpers/ui_helper.dart';
import 'package:ccr_app/app/theme/colors.dart';
import 'package:easy_infinite_pagination/easy_infinite_pagination.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../global_widgets/buscando_progress_w.dart';
import 'bocas_controller.dart';
import 'local_widgets/boca_item_widget.dart';

class BocasPage extends StatelessWidget {
  const BocasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetBuilder<BocasController>(
        builder: (_) => SafeArea(
              child: Scaffold(
                  appBar: const CustomAppBar(
                    titulo: 'Listado de bocas',
                  ),
                  body: Stack(
                    children: [
                      Padding(
                        padding: UiHelper.marginBody,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: CustomInput(
                                        value: _.term,
                                        label: 'Buscar por codigo o nombre',
                                        textInputAction: TextInputAction.done,
                                        onFieldSubmitted: (text) {
                                          _.filter();
                                        },
                                        onChanged: (value) {
                                          _.term = value;
                                        })),
                                SizedBox(
                                  width: context.wp(2),
                                ),
                                SizedBox(
                                    width: context.wp(15),
                                    child: IconButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          padding: EdgeInsets.symmetric(
                                              vertical: context.hp(1.5)),
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          foregroundColor: Colors.white,
                                        ),
                                        onPressed: () {
                                          _.filter();
                                        },
                                        icon: const Icon(
                                            FontAwesomeIcons.magnifyingGlass))),
                                SizedBox(
                                  width: context.wp(1),
                                ),
                                SizedBox(
                                    width: context.wp(15),
                                    child: IconButton(
                                        style: IconButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          padding: EdgeInsets.symmetric(
                                              vertical: context.hp(1.5)),
                                          backgroundColor:
                                              AppColors.accentColor,
                                          foregroundColor: Colors.white,
                                        ),
                                        onPressed: () async {
                                          _.workInProgress.value = true;
                                          _.clearForm();

                                          await _.getBocas();
                                          _.update();
                                          await _.scrollController.animateTo(0,
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              curve: Curves.easeIn);
                                          _.workInProgress.value = false;
                                        },
                                        icon: const Icon(
                                            FontAwesomeIcons.arrowsRotate))),
                              ],
                            ),
                            SizedBox(
                              height: context.hp(1),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: context.wp(35),
                                  child: Text(
                                    'Filtrar por ciudad',
                                    style: textTheme.titleSmall
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  width: context.wp(2),
                                ),
                                Expanded(
                                    child: CustomInputSelectWidget(
                                        onChanged: (String? value) {
                                          _.ciudadSeleccionada =
                                              value ?? 'Todas';

                                          _.filter();
                                        },
                                        value: _.ciudadSeleccionada,
                                        options: _.ciudades)),
                              ],
                            ),
                            lineSeparator(
                                marginVertical: context.hp(1.5), height: 2),
                            if (!_.isInitial)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: AppColors.accentColor),
                                child: Text(
                                  'Cantidad de resultado de la busqueda: ${_.bocas.length}',
                                  style: context.textTheme.labelSmall?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ),
                            SizedBox(
                              height: context.hp(1),
                            ),
                            Expanded(
                                child: RefreshIndicator(
                              onRefresh: () async {
                                _.clearForm();
                                await _.getBocas(offset: _.page);
                                _.update();
                              },
                              child: _.isSerched
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: _.bocas.length,
                                      itemBuilder: (__, index) =>
                                          BocaItemWidget(boca: _.bocas[index]))
                                  : InfiniteListView(
                                      controller: _.scrollController,
                                      shrinkWrap: true,
                                      delegate: PaginationDelegate(
                                        firstPageLoadingBuilder: (context) =>
                                            const CircularProgressIndicator(),
                                        firstPageNoItemsBuilder: (context) =>
                                            Container(),
                                        itemCount: _.bocas.length,
                                        itemBuilder: (__, index) =>
                                            BocaItemWidget(
                                                boca: _.bocas[index]),
                                        isLoading: _.isLoaging,
                                        onFetchData: () async {
                                          await _.getBocas(offset: _.page);
                                          _.page++;
                                        },
                                      ),
                                    ),
                            ))
                          ],
                        ),
                      ),
                      BuscandoProgressWidget(buscando: _.workInProgress)
                    ],
                  )),
            ));
  }
}
