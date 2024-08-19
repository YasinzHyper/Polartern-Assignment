import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class CarouselSlider extends StatelessWidget {
  CarouselSlider({super.key});

  final List<String> imgList = [
    'assets/images/bg-image-1.jpg',
    'assets/images/bg-image-2.jpg',
    'assets/images/bg-image-3.jpg',
    'assets/images/bg-image-4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: CarouselOptions(
        height: 350.0,
        showIndicator: true,
        slideIndicator: CircularSlideIndicator(),
        enableInfiniteScroll: true,
        keepPage: true,
        viewportFraction: 1.1,
      ),
      items: imgList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(color: Colors.amber),
                child: Image.asset(i, fit: BoxFit.cover));
          },
        );
      }).toList(),
    );
  }
}
