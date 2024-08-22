import 'package:carousel_slider/carousel_slider.dart';
import 'package:fish_finder/material/font_and_color.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() {
    return _CarouselWidgetState();
  }
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _current = 0;
  final List<String> imgList = [
    'assets/images/carousel/c1.jpg',
    'assets/images/carousel/c2.jpg',
    'assets/images/carousel/c3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imgList
              .map(
                (item) => ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            viewportFraction: 1.0,
            enlargeCenterPage: true,
            height: 200.0,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.map((url) {
            int index = imgList.indexOf(url);
            return Container(
              width: 10.0,
              height: 10.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? colorBlue
                    : const Color.fromARGB(255, 107, 107, 107),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
