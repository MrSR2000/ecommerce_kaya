// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kaya/config/theme/app_themes.dart';
import 'package:kaya/models/image_model/slider_model.dart';

import '../screen_size.dart';
import 'network_image_widget.dart';

class ImageSlider extends StatefulWidget {
  final List<SliderData>? images;
  final List<String>? imageStringList;
  final BoxFit boxFit;
  const ImageSlider({
    Key? key,
    this.images,
    this.imageStringList,
    this.boxFit = BoxFit.cover,
  }) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  CarouselController controller = CarouselController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getDeviceSize(context: context).deviceHeight / 4,
      width: double.maxFinite,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: widget.imageStringList != null
                      ? widget.imageStringList!.length
                      : widget.images!.length,
                  itemBuilder: (context, index, realIndex) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => OpenSingleImage(
                        //         imageUrl: widget.images[index].filePath!,
                        //       ),
                        //     ));
                      },
                      child: networkImageWidget(
                        imageUrl: widget.imageStringList != null
                            ? widget.imageStringList![index]
                            : widget.images![index].image!,
                        imageLoadingType: ImageLoadingType.circularLoading,
                        boxFit: widget.boxFit,
                      ),
                    );
                  },
                  carouselController: controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 17 / 9,
                      enlargeFactor: 0,
                      viewportFraction: 1.1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          pageIndex = index;
                        });
                      }),
                ),
                //indicator
                Positioned(
                  bottom: 20,
                  right: 1,
                  left: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.imageStringList != null
                        ? widget.imageStringList!.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => controller.animateToPage(entry.key),
                              child: Container(
                                width: 8.0,
                                height: 8.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : primaryColor)
                                      .withOpacity(
                                    pageIndex == entry.key ? 0.9 : 0.4,
                                  ),
                                ),
                              ),
                            );
                          }).toList()
                        : widget.images!.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => controller.animateToPage(entry.key),
                              child: Container(
                                width: 8.0,
                                height: 8.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : primaryColor)
                                      .withOpacity(
                                    pageIndex == entry.key ? 0.9 : 0.4,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
        ],
      ),
    );
  }
}
