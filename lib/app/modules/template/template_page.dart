import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'template_controller.dart';

class TemplatePage extends StatelessWidget {
  const TemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TemplateController>(
        builder: (_) => const SafeArea(
              child: Scaffold(
                body: Placeholder(),
              ),
            ));
  }
}
