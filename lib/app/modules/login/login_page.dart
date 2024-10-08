import 'package:animate_do/animate_do.dart';
import 'package:ccr_app/app/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/responsive.dart';
import '../../theme/fonts.dart';
import 'login_controller.dart';
import 'widgets_locales/bg_login.dart';
import 'widgets_locales/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return GetBuilder<LoginController>(
        builder: (_) => SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.grey[200],
                body: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const BackgroundLogin4(),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Hero(
                                tag: 'login',
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: responsive.hp(5),
                                      bottom: responsive.hp(.5)),
                                  child: Image.asset(
                                    'assets/images/logo_ccr.png',
                                    height: context.hp(15),
                                  ),
                                ),
                              ),
                              FadeInDown(
                                  child: Center(
                                child: Text(
                                  'Zoomin',
                                  style: AppFonts.primaryFont.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: responsive.dp(4)),
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                      const Positioned.fill(
                          child: Align(
                              alignment: Alignment.center, child: LoginForm())),
                      Positioned.fill(
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  margin:
                                      EdgeInsets.only(bottom: responsive.hp(1)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Creado por',
                                        style: context.textTheme.bodySmall!
                                            .copyWith(
                                                color: Colors.grey.shade600,
                                                fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'Jaime Ferreira © 2024',
                                        style: context.textTheme.bodySmall!
                                            .copyWith(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ))
                              // Image.asset(
                              //   'assets/images/logo_MB.png',
                              //   height: responsive.hp(10),
                              //   width: double.infinity,
                              // ),
                              ))
                    ],
                  ),
                ),
              ),
            ));
  }
}
