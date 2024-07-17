// ignore_for_file: unnecessary_this

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ccr_app/app/config/theme/app_text_styles.dart';
import 'package:ccr_app/app/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../helpers/responsive.dart';
import '../theme/colors.dart';
import '../theme/fonts.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;
  final IconData? icon;
  final bool enabled;
  final double? fontSize;
  final double? paddingHorizontal;
  final bool isLoading;
  final String textIsLoading;
  final bool contentCenter;

  const CustomIconButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.color = AppColors.primaryColor,
      this.isFilled = false,
      this.enabled = true,
      this.fontSize,
      this.paddingHorizontal = 30,
      this.isLoading = false,
      this.textIsLoading = "Procesando",
      this.contentCenter = false,
      this.icon});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.wp(2)),
      child: OutlinedButton(
          onPressed: !enabled
              ? null
              : isLoading
                  ? null
                  : () => onPressed(),
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(horizontal: paddingHorizontal!)),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // <-- Radius
            )),
            side: enabled
                ? WidgetStateProperty.all(BorderSide(color: color))
                : WidgetStateProperty.all(
                    const BorderSide(color: Colors.black26)),
            backgroundColor: WidgetStateProperty.all(enabled
                ? isFilled
                    ? color
                    : Colors.white
                : Colors.grey[300]),
            overlayColor: WidgetStateProperty.all(color.withOpacity(0.3)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading
                  ? SpinKitWave(
                      color: isFilled ? Colors.white : Colors.orangeAccent,
                      type: SpinKitWaveType.end,
                      size: 24.0,
                    )
                  : icon == null
                      ? Container()
                      : Icon(
                          icon,
                          color: enabled
                              ? this.isFilled
                                  ? Colors.white
                                  : this.color
                              : Colors.grey[600],
                        ),
              Container(
                margin: contentCenter
                    ? null
                    : const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      isLoading ? textIsLoading : text,
                      textAlign: TextAlign.center,
                      style: AppFonts.secondaryFont.copyWith(
                        fontSize:
                            fontSize ?? AppTextStyles.buttonMedium.fontSize,
                        color: enabled
                            ? this.isFilled
                                ? Colors.white
                                : this.color
                            : Colors.grey[600],
                      ),
                    ),
                    isLoading
                        ? AnimatedTextKit(
                            isRepeatingAnimation: true,
                            repeatForever: true,
                            animatedTexts: [
                                TyperAnimatedText('...',
                                    textStyle: AppFonts.secondaryFont.copyWith(
                                      fontSize: fontSize ?? responsive.dp(2),
                                      color: enabled
                                          ? this.isFilled
                                              ? Colors.white
                                              : this.color
                                          : Colors.grey[600],
                                    ),
                                    speed: const Duration(milliseconds: 200)),
                              ])
                        : Container()
                  ],
                ),
              )
            ],
          )),
    );
  }
}
