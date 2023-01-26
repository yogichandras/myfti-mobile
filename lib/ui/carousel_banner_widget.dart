import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CarouselBannerWidget extends StatelessWidget {
  final List<String> images;

  const CarouselBannerWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) return const Center(child: CircularProgressIndicator());

    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 200,
        viewportFraction: 1,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        enlargeFactor: 0.5,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: images.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
              decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        image: DecorationImage(
          image: NetworkImage(images[itemIndex]),
          fit: BoxFit.cover,
        ),
      )),
    );
  }
}

class SkeletonCarouselWidget extends StatelessWidget {
  const SkeletonCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 200,
        viewportFraction: 1,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        enlargeFactor: 0.5,
      ),
      itemCount: 1,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Shimmer.fromColors(
        direction: ShimmerDirection.ttb,
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.grey[300],
          ),
        ),
      ),
    );
  }
}
