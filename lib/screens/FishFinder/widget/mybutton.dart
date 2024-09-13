import 'package:fish_finder/material/font_and_color.dart';
import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  const Mybutton({super.key, required this.imageFrom, required this.camera});
  final void Function() imageFrom;
  final bool camera;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey[400],
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        onPressed: () {
          imageFrom();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                camera ? Icons.camera_alt : Icons.image,
                size: 30,
                color: const Color(0xffFE7A36),
              ),
              Text(
                camera ? 'Camera' : 'Gallery',
                // 'Camera': "Gallery",
                style: fontEnglish.copyWith(
                    fontSize: 13,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
