import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class InfiniteImageSlider extends StatelessWidget {
  final List<String> images;

  const InfiniteImageSlider({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (context, index, realIdx) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 400,
            height: 400,
            margin: EdgeInsets.symmetric(horizontal: 5),
            color: Colors.grey[200],
            child: Image.network(
              images[index],
              fit: BoxFit.cover,
              width: 400,
              height: 400,
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 400,
        aspectRatio: 1,
        viewportFraction: 0.2,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(milliseconds: 1000),
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
        disableCenter: true,
        pauseAutoPlayOnTouch: false,
      ),
    );
  }
}
