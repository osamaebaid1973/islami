import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Sala extends StatelessWidget {
  const Sala({super.key});

  @override
  Widget build(BuildContext context) {
    option:
    return CarouselSlider(
      options: CarouselOptions(
        //height: 200, // Height of the carousel
        viewportFraction: 0.8, // Controls the width of each slide
        enlargeCenterPage: true, // Enlarges the center slide
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Center(
              child: Container(
                width: 104,
                height: 128,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.cyan,
                    gradient: LinearGradient(
                      colors: [
                        Colors.brown.withOpacity(0.8),
                        Colors.transparent,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
