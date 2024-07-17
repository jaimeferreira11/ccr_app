import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors.dart';

class BuscandoProgressWidget extends StatelessWidget {
  final RxBool buscando;

  const BuscandoProgressWidget({super.key, required this.buscando});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (buscando.value) {
          return Container(
            height: double.infinity,
            color: Colors.black26,
            child: const Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            )),
          );
        }
        return Container();
      },
    );
  }
}
