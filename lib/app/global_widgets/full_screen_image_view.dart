import 'package:ccr_app/app/helpers/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import '../helpers/responsive.dart';

class FullScreenImageView extends StatelessWidget {
  final ImageProvider imageProvider;
  final String? text;

  const FullScreenImageView(
      {super.key, required this.imageProvider, this.text});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return PopScope(
      onPopInvoked: (didPop) {
        // Get.back();
      },
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: responsive.hp(90),
            child: Center(
              child: PhotoView(
                  imageProvider: imageProvider,
                  loadingBuilder: (context, event) {
                    if (event == null) {
                      return Center(
                        child: Image.asset('assets/images/loader.gif'),
                      );
                    }
                    return Container();
                  }),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: SafeArea(
              child: CupertinoButton(
                color: Colors.white70,
                padding: const EdgeInsets.all(10),
                borderRadius: BorderRadius.circular(30),
                child: const Icon(
                  FontAwesomeIcons.xmark,
                  color: Colors.black87,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
          if (text != null)
            Positioned(
              right: 0,
              left: 0,
              bottom: 30,
              child: Material(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.black38),
                  child: Text(
                    text!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: context.dp(1.8),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
