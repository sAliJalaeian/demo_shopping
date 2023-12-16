import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  "https://nirweb.ir/wp-content/uploads/2023/04/slider-panel.jpg",
  "https://nirweb.ir/wp-content/uploads/2023/04/slider-hamrah.jpg",
];

// images to widget
final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        // margin: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: Image.network(
            item,
            fit: BoxFit.fill,
            width: 1000.0,
          ),
        ),
      ),
    )
    .toList();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              height: 240,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              pageViewKey: const PageStorageKey<String>('carousel_slider'),
            ),
            items: imageSliders,
          );
        }
        else if (index == 1) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://dkstatics-public.digikala.com/digikala-bellatrix/d0dc31c892be8cf1408e4e14580b3f479da66bd1_1648897133.png",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("دیجیکالا جت"),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://dkstatics-public.digikala.com/digikala-bellatrix/625d8883f37944f3f0c4af5fe39435600931ab22_1664309850.png",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("حراج استایل"),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("assets/images/digipay.png"),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("خرید اقساطی"),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://dkstatics-public.digikala.com/digikala-bellatrix/78ccd40cbf305fb067de78ddab5be84f69589c8d_1648897009.png",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("دیجی پلاس"),
                ],
              ),
            ],
          );
          /*return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "https://dkstatics-public.digikala.com/digikala-bellatrix/d0dc31c892be8cf1408e4e14580b3f479da66bd1_1648897133.png",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("دیجیکالا جت"),
                      ],
                    );
                  } else if (index == 1) {
                    Column(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "https://dkstatics-public.digikala.com/digikala-bellatrix/625d8883f37944f3f0c4af5fe39435600931ab22_1664309850.png",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("حراج استایل"),
                      ],
                    );
                  } else if (index == 2) {
                    Column(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset("assets/images/digipay.png"),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("خرید اقساطی"),
                      ],
                    );
                  } else if (index == 3) {
                    Column(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "https://dkstatics-public.digikala.com/digikala-bellatrix/78ccd40cbf305fb067de78ddab5be84f69589c8d_1648897009.png",
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("دیجی پلاس"),
                      ],
                    );
                  }
                },
              ),
            ],
          );*/
        }

        /************* offers horizontal listview *************/
        else if (index == 2) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              height: 250,
              width: 1500,
              color: const Color(0xffEF3F3E),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        color: const Color(0xffEF3F3E),
                        // color: Colors.white,
                        width: 70,
                        height: 75,
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10 ,horizontal: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: const SizedBox(
                          height: 200,
                          width: 170,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          );
        }
        else {
          return Container();
        }
      },
      itemCount: 10,
    );
  }
}
