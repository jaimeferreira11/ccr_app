import 'package:ccr_app/app/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/responsive.dart';
import '../theme/colors.dart';

class CustomHomeItemWidget extends StatelessWidget {
  final Icon icon;
  final Color color;
  final String title;
  final String route;
  final bool isVertical;
  final String descripcion;

  const CustomHomeItemWidget(
      {super.key,
      required this.icon,
      this.color = AppColors.textColor,
      this.isVertical = true,
      this.descripcion = "",
      required this.title,
      required this.route});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return _CardBackground(
        route: route,
        child: isVertical ? _column(responsive) : _row(responsive, context));
  }

  Widget _column(Responsive responsive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: responsive.dp(3),
          child: icon,
        ),
        SizedBox(height: responsive.hp(1.5)),
        FittedBox(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: responsive.wp(1.5)),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w500,
                  fontSize: responsive.dp(1.8)),
            ),
          ),
        )
      ],
    );
  }

  Widget _row(Responsive responsive, context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: responsive.hp(5), maxHeight: responsive.hp(6)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: responsive.wp(3)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: responsive.wp(1.5)),
                      child: Text(
                        title,
                        style: TextStyle(
                            color: route.isEmpty ? Colors.black38 : color,
                            fontWeight: FontWeight.w600,
                            fontSize: responsive.dp(1.6)),
                      ),
                    ),
                  ),
                  // SizedBox(height: responsive.hp(.5)),
                  if (descripcion.isNotEmpty)
                    Container(
                        margin: EdgeInsets.only(
                            left: responsive.wp(1.5),
                            right: responsive.wp(1.5),
                            top: responsive.hp(.5)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.info_outline_rounded,
                              color: AppColors.accentColor,
                              size: responsive.dp(1.5),
                            ),
                            SizedBox(
                              width: responsive.wp(1),
                            ),
                            Text(
                              descripcion,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: AppTextStyles.labelSmall
                                  .copyWith(color: AppColors.accentColor),
                            ),
                          ],
                        ))
                ],
              ),
            ),
            SizedBox(width: responsive.wp(2)),
            icon,
          ],
        ),
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;
  final String route;

  const _CardBackground({super.key, required this.route, required this.child});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: route.isEmpty ? null : () => Get.toNamed(route),
        splashColor: AppColors.accentColor.shade100,
        highlightColor: AppColors.accentColor.shade200,
        child: Container(
          margin: EdgeInsets.only(
              left: responsive.wp(3),
              right: responsive.wp(3),
              top: responsive.hp(1),
              bottom: responsive.hp(1)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: route.isEmpty
                ? []
                : const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.2, .9),
                      blurRadius: 6.0,
                    ),
                  ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: responsive.hp(2)),
              decoration: BoxDecoration(
                  color: route.isEmpty ? Colors.black12 : Colors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
