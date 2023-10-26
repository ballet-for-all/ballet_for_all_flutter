import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({
    required this.height,
    required this.images,
    this.width = double.infinity,
    this.fit = BoxFit.fitWidth,
    super.key,
  });

  final double width;
  final double height;
  final List<String> images;
  final BoxFit fit;

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late final CarouselController _carouselController;

  int _imageIndex = 0;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
  }

  @override
  Widget build(BuildContext context) => widget.images.isEmpty
      ? Container(
          width: widget.width,
          height: widget.height,
          color: Colors.grey[300],
          child: const Center(
            child: Icon(
              Icons.image,
              color: Colors.grey,
              size: 48,
            ),
          ),
        )
      : Stack(
          children: [
            CarouselSlider.builder(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: widget.height,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, _) =>
                    setState(() => _imageIndex = index),
              ),
              itemCount: widget.images.length,
              itemBuilder: (context, index, _) => SizedBox(
                width: widget.width,
                child: Image.network(
                  widget.images[index],
                  fit: widget.fit,
                ),
              ),
            ),
            Positioned.fill(
              bottom: 20,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: DotsIndicator(
                  dotsCount: widget.images.length,
                  position: _imageIndex,
                  decorator: DotsDecorator(
                    color: Colors.white.withOpacity(0.7),
                    activeColor: const Color(0xFF222222),
                  ),
                ),
              ),
            ),
          ],
        );
}
