import 'package:ccr_app/app/data/models/sync_model.dart';
import 'package:ccr_app/app/helpers/extensions.dart';
import 'package:ccr_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../data/providers/local/cache.dart';
import '../../../global_widgets/custom_home_item_widget.dart';
import '../../../helpers/responsive.dart';
import '../../../theme/colors.dart';
import '../home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.find<HomeController>();

    return StreamBuilder<SyncModel>(
        stream: controller.stream,
        builder: (context, snapshot) {
          final syncData = snapshot.data;
          return Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                  padding: EdgeInsets.symmetric(
                      horizontal: context.wp(3), vertical: context.hp(2)),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        radius: responsive.dp(3),
                        child: Icon(
                          FontAwesomeIcons.user,
                          color: Colors.white,
                          size: context.dp(2),
                        ),
                      ),
                      SizedBox(
                        width: context.wp(1.5),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Cache.instance.loginData.usuario.usuario,
                            style: textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: context.hp(.2),
                          ),
                          SizedBox(
                            width: context.wp(25),
                            child: FittedBox(
                              child: Text(
                                Cache.instance.loginData.usuario.nombreApellido,
                                style: textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        width: context.wp(30),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset('assets/images/bdp.png')
                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   children: [
                            //     Text(
                            //       'Estudio',
                            //       textAlign: TextAlign.center,
                            //       style: textTheme.bodySmall!
                            //           .copyWith(fontWeight: FontWeight.bold),
                            //     ),
                            //     FilledButton.icon(
                            //         onPressed: () {},
                            //         label: Text('Bebidas del Paraguay',
                            //             textAlign: TextAlign.center,
                            //             maxLines: 2,
                            //             overflow: TextOverflow.ellipsis,
                            //             style: textTheme.labelSmall!
                            //                 .copyWith(color: Colors.white)))
                            //   ],
                            // ),
                            ),
                      )
                    ],
                  )),
              SizedBox(
                height: responsive.hp(2),
              ),
              Table(
                children: [
                  TableRow(
                    children: [
                      CustomHomeItemWidget(
                        isVertical: false,
                        icon: Icon(
                          FontAwesomeIcons.download,
                          size: responsive.dp(3),
                          color: AppColors.primaryColor,
                        ),
                        route: AppRoutes.download,
                        title: 'Descargar datos',
                        descripcion: syncData == null
                            ? ''
                            : 'Ultima actualización ${syncData.download}',
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      CustomHomeItemWidget(
                        isVertical: false,
                        icon: Icon(
                          FontAwesomeIcons.plus,
                          size: responsive.dp(3),
                          color: syncData == null
                              ? Colors.black45
                              : AppColors.primaryColor,
                        ),
                        route: syncData == null ? '' : AppRoutes.bocas,
                        title: 'Nuevo relevo',
                        descripcion: '',
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      CustomHomeItemWidget(
                        isVertical: false,
                        icon: Icon(
                          FontAwesomeIcons.upload,
                          size: responsive.dp(3),
                          color: syncData == null
                              ? Colors.black45
                              : AppColors.primaryColor,
                        ),
                        route: syncData == null ? '' : AppRoutes.history,
                        title: 'Histórico - Subir datos',
                        descripcion: (syncData != null &&
                                syncData.cantidadPendientes != null &&
                                syncData.cantidadPendientes! > 0)
                            ? 'Tenes ${syncData.cantidadPendientes} relevo(s) para subir'
                            : '',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        });
  }
}
