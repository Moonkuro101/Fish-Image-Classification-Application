import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() {
    return _CarouselWidgetState();
  }
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final List<String> imgList = [
    'assets/images/carousel/c1.jpg',
    'assets/images/carousel/c2.jpg',
    'assets/images/carousel/c3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: imgList.length,
          itemBuilder: (context, index, realIndex) => ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            child: Image.asset(
              imgList[index],
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          options: CarouselOptions(
            viewportFraction: 1,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            height: 200.0,
            autoPlay: true,
          ),
        ),
      ],
    );
  }
}
