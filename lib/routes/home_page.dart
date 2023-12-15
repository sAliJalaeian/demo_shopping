import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  "https://nirweb.ir/wp-content/uploads/2023/04/slider-panel.jpg",
  "https://nirweb.ir/wp-content/uploads/2023/04/slider-hamrah.jpg",
];

// images to widget
final List<Widget> imageSliders = imgList.map(
  (item) => Container(
    margin: const EdgeInsets.all(5.0),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: Image.network(
        item,
        fit: BoxFit.fill,
        width: 1000.0,
      ),
    ),
  ),
).toList();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      if (index == 0) {
        return CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            pageViewKey: const PageStorageKey<String>('carousel_slider'),
          ),
          items: imageSliders,
        );
      } else {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          color: Colors.blueAccent,
          height: 200,
          child: const Center(
            child: Text('other content'),
          ),
        );
      }
    });
  }
}
