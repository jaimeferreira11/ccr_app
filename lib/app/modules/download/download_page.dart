import 'package:animate_do/animate_do.dart';
import 'package:ccr_app/app/global_widgets/buscando_progress_w.dart';
import 'package:ccr_app/app/global_widgets/custom_appbar.dart';
import 'package:ccr_app/app/global_widgets/custom_icon_button.dart';
import 'package:ccr_app/app/helpers/extensions.dart';
import 'package:ccr_app/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'download_controller.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DownloadController>(
        builder: (_) => SafeArea(
              child: PopScope(
                canPop: _.status != FormzSubmissionStatus.inProgress,
                child: Scaffold(
                  appBar: const CustomAppBar(
                    titulo: 'Descargar datos',
                    showLogOutButton: false,
                  ),
                  body: Stack(
                    children: [
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _.status == FormzSubmissionStatus.initial
                              ? _initialPage(context, _)
                              : _.status == FormzSubmissionStatus.inProgress
                                  ? _loadingPage(context, _)
                                  : _loadedPage(context, _),
                        ),
                      ),
                      BuscandoProgressWidget(buscando: _.workInProgress)
                    ],
                  ),
                ),
              ),
            ));
  }

  List<Widget> _initialPage(
      BuildContext context, DownloadController downloadController) {
    final textTheme = Theme.of(context).textTheme;
    return [
      const Spacer(
        flex: 1,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
        child: Text(
          'Para descargar datos, asegurate de tener buena conexión a intenet.',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
      const Spacer(
        flex: 1,
      ),
      Icon(
        FontAwesomeIcons.fileArrowDown,
        size: context.dp(15),
        color: AppColors.primaryColor,
      ),
      const Spacer(
        flex: 2,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
        child: CustomIconButton(
          onPressed: () => downloadController.descargar(),
          text: "Descargar datos",
          isFilled: true,
        ),
      ),
      const Spacer(),
    ];
  }

  List<Widget> _loadingPage(
      BuildContext context, DownloadController downloadController) {
    final textTheme = Theme.of(context).textTheme;
    return [
      const Spacer(
        flex: 2,
      ),
      Icon(
        FontAwesomeIcons.fileArrowDown,
        size: context.dp(15),
        color: AppColors.primaryColor,
      ),
      const Spacer(
        flex: 1,
      ),
      const CircularProgressIndicator(
        strokeWidth: 2,
      ),
      // const Spacer(),
      SizedBox(
        height: context.hp(4),
      ),

      Obx(() => RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: '',
              children: downloadController.logs
                  .map((l) => WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Text(
                          l,
                          style: textTheme.titleSmall?.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                      ))
                  .toList()))),

      const Spacer(
        flex: 3,
      ),
      // Padding(
      //   padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
      //   child: CustomIconButton(
      //     onPressed: () {},
      //     text: 'Cancelar',
      //     color: AppColors.errorColor,
      //     isFilled: true,
      //   ),
      // ),
      // const Spacer(),
    ];
  }

  List<Widget> _loadedPage(
      BuildContext context, DownloadController controller) {
    final textTheme = Theme.of(context).textTheme;
    return [
      const Spacer(
        flex: 2,
      ),
      if (controller.status == FormzSubmissionStatus.success)
        FadeIn(
          child: Icon(
            FontAwesomeIcons.check,
            size: context.dp(15),
            color: AppColors.successColor,
          ),
        )
      else
        FadeIn(
          child: Icon(
            FontAwesomeIcons.xmark,
            size: context.dp(15),
            color: AppColors.errorColor,
          ),
        ),

      // const Spacer(),
      SizedBox(
        height: context.hp(4),
      ),
      Obx(
        () => FadeIn(
          child: Column(
            children: controller.logs
                .map((l) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: Text(
                        l,
                        textAlign: TextAlign.center,
                        style: textTheme.titleSmall?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
      const Spacer(
        flex: 2,
      ),

      if (controller.status == FormzSubmissionStatus.success)
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
          child: CustomIconButton(
            onPressed: () => controller.nav.back(),
            text: 'Volver al inicio',
            color: AppColors.primaryColor,
            isFilled: true,
          ),
        )
      else
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.wp(5)),
          child: CustomIconButton(
            onPressed: () => controller.nav.back(),
            text: 'Reintentar',
            color: AppColors.primaryColor,
            isFilled: false,
          ),
        ),
      const Spacer(),
    ];
  }
}
