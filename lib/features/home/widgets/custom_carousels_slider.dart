import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List sliderData;
  const CustomCarouselSlider({super.key, required this.sliderData,});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: sliderData.length,
      itemBuilder: (context, index, realIndex) {
        final url = sliderData[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: NetworkImage(sliderData[index]), fit: BoxFit.cover)
          ),
          
        );

      },
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
      ),
    );
  }
}