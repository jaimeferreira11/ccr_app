import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../helpers/responsive.dart';

class FullScreenListImagesView extends StatefulWidget {
  //final ImageProvider imageProvider;
  final List<ImageProvider> images;

  const FullScreenListImagesView({
    super.key,
    required this.images,
  });

  @override
  State<FullScreenListImagesView> createState() =>
      _FullScreenListImagesViewState();
}

PageController controller = PageController();

class _FullScreenListImagesViewState extends State<FullScreenListImagesView> {
  var page = 1;
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: responsive.hp(90),
          child: Center(
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              pageController: controller,
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: widget.images[index],
                  initialScale: PhotoViewComputedScale.contained * 0.8,
                  heroAttributes:
                      PhotoViewHeroAttributes(tag: widget.images[index]),
                );
              },

              itemCount: widget.images.length,
              loadingBuilder: (context, event) => Center(
                child: SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded /
                            event.expectedTotalBytes!,
                  ),
                ),
              ),

              // backgroundDecoration: BoxDecoration(color: Colors.black26),
              onPageChanged: (int p) {
                print(p);
                print(widget.images[p].toString());
                setState(() {
                  page = p + 1;
                });
              },
            ),
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
                Icons.close,
                color: Colors.black87,
              ),
              onPressed: () {
                Get.back(result: widget.images);
              },
            ),
          ),
        ),
      ],
    );
  }
}
