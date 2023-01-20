import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shopping/infastructure/app.images.dart';

class SliderScreen extends StatelessWidget {
  SliderScreen({super.key});
  final ValueNotifier<int> postionNotifier = ValueNotifier(0);

  List imageList = [
    {"id": 1, "image_path": AppImages.offer1},
    {"id": 2, "image_path": AppImages.offer2},
    {"id": 3, "image_path": AppImages.offer3}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            print(currentIndex);
          },
          child: CarouselSlider(
            items: imageList
                .map(
                  (item) => Image.asset(
                    item['image_path'],
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                )
                .toList(),
            carouselController: carouselController,
            options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: true,
              aspectRatio: 2,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                postionNotifier.value = index;
              },
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom: 20),
                child: ValueListenableBuilder(
                  valueListenable: postionNotifier,
                  builder: (context, position, child) {
                    return DotsIndicator(
                        dotsCount: 3,
                        position: position.toDouble(),
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        reversed: false,
                        decorator: DotsDecorator(
                            activeSize: const Size(18.0, 9.8),
                            size: const Size.square(9),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))));
                  },
                ))),
      ],
    );
  }
}
