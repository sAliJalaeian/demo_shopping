import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_shopping/models/shop_model.dart';
import 'package:demo_shopping/routes/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constant/constant.dart';

final List<String> imgList = [
  "https://dkstatics-public.digikala.com/digikala-adservice-banners/ac6c2b93110fb3a34a77196a0ed4b24bb1d5df5e_1702621005.jpg?x-oss-process=image/quality,q_95/format,webp",
  "https://dkstatics-public.digikala.com/digikala-adservice-banners/88308e8744e209e35e5f7120b85ba825c8aec081_1702466771.jpg?x-oss-process=image/quality,q_95/format,webp",
  "https://dkstatics-public.digikala.com/digikala-adservice-banners/d9460ff09bd071e08007f7157ffdca42a0c0a07e_1702464535.gif?x-oss-process=image?x-oss-process=image/format,webp",
  "https://dkstatics-public.digikala.com/digikala-adservice-banners/35d5ce40c232edb67191f937adf8922f65d4b66e_1702886435.jpg?x-oss-process=image/quality,q_95/format,webp",
];

final List<String> imgListLabels = [
  "https://dkstatics-public.digikala.com/digikala-adservice-banners/0c20d3c67902207de3075c9629ddc88f455d5f2a_1702625150.jpg?x-oss-process=image/quality,q_95/format,webp",
  "https://dkstatics-public.digikala.com/digikala-adservice-banners/24a1080ab31992bbf859b7f91d77859f840b82c1_1702470252.jpg?x-oss-process=image/quality,q_95/format,webp",
];

// images to widget
final List<Widget> imageSliders = imgList
  .map(
    (item) => Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: CachedNetworkImage(
          imageUrl: item,
          fit: BoxFit.fill,
          width: 1000,
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
  // initial list for ignore error
  List<Product> products = List.generate(
    20,
    (index) => Product(
      id: index,
      title: "---",
      price: 0,
      description: "---",
      category:"---",
      image:"https://static.vecteezy.com/system/resources/thumbnails/011/299/153/small/simple-loading-or-buffering-icon-design-png.png",
      rating: <String, dynamic>{
        'rate': 0,
        'count': 0,
      },
    ),
  );

  Future _fetchPosts() async {
    final response = await http.get(Uri.parse(aPI));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        products = data.map((e) => Product.fromJson(e)).toList();
      });
    } else {
      throw Exception("Failed to load the data :)");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchPosts();
    Future.delayed(
      const Duration(milliseconds: 1000),
          () => 100,
    );
    // _getImage();
  }

  Widget returnOfferRow(Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 250,
        width: 1500,
        color: color,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  color: color,
                  width: 70,
                  height: 75,
                ),
              );
            } else {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: SizedBox(
                    height: 200,
                    width: 170,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            /************* blue buttom for add to cart *************/
                            GestureDetector(
                              // TODO: fix on tap
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CartPage(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 2),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blueAccent,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            /************* show image of products *************/
                            Padding(
                              padding: const EdgeInsets.only(top: 10, right: 10, bottom: 15),
                              child: SizedBox(
                                width: 90,
                                height: 75,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: products[index - 1].image,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        /************* show title of products *************/
                        SizedBox(
                          width: 140,
                          height: 60,
                          child: Text(
                            textDirection: TextDirection.ltr, //for english title
                            textAlign: TextAlign.center, //center the text
                            maxLines: 2,
                            products[index - 1].title,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 20,
                                width: 35,
                                margin: const EdgeInsets.only(left: 5, right: 5),
                                decoration: const BoxDecoration(
                                  color: Color(0xffEF3F3E),
                                  borderRadius: BorderRadius.all(Radius.elliptical(100, 100)),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 2),
                                  child: Text(
                                    '7%',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'IranYekan',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  "\$ ${products[index - 1].price}",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
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
        } else if (index == 1) {
          /************* row under slider *************/
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
                      child: CachedNetworkImage(
                        imageUrl: "https://dkstatics-public.digikala.com/digikala-bellatrix/d0dc31c892be8cf1408e4e14580b3f479da66bd1_1648897133.png",
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
                      child: CachedNetworkImage(
                        imageUrl: "https://dkstatics-public.digikala.com/digikala-bellatrix/625d8883f37944f3f0c4af5fe39435600931ab22_1664309850.png",
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
                      child: CachedNetworkImage(
                        imageUrl: "https://dkstatics-public.digikala.com/digikala-bellatrix/78ccd40cbf305fb067de78ddab5be84f69589c8d_1648897009.png",
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
        }
        /************* offers horizontal listview *************/
        else if (index == 2) {
          return returnOfferRow(const Color(0xffEF3F3E));
        } else if (index == 3) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 10,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: imgListLabels[0],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 10,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: imgListLabels[1],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ]),
          );
        } else if (index == 4) {
          return Container(
            width: MediaQuery.of(context).size.width - 10,
            height: 485,
            color: Colors.white,
            child: Column(
              children: [
                /************* text for buying *************/
                const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "خرید بر اساس دسته‌بندی",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /************* each section for buy in category *************/
                      SizedBox(
                        width: sizeOfColumns,
                        height: sizeOfColumns,
                        child: Column(
                          children: [
                            SizedBox(
                              width: sizeOfPicture,
                              height: sizeOfPicture,
                              child: CachedNetworkImage(
                                  imageUrl: "https://dkstatics-public.digikala.com/digikala-categories/510816e9ec4cbfad2edbff2763e2059a504e571b_1701193038.png"),
                            ),
                            const Text("موبایل"),
                          ],
                        ),
                      ),
                      /************* each section for buy in category *************/
                      SizedBox(
                        width: sizeOfColumns,
                        height: sizeOfColumns,
                        child: Column(
                          children: [
                            SizedBox(
                              width: sizeOfPicture,
                              height: sizeOfPicture,
                              child: CachedNetworkImage(
                                  imageUrl: "https://dkstatics-public.digikala.com/digikala-categories/ba175c709e3cc22e3fd7c65c7c6a21854d1c3765_1701193047.png"),
                            ),
                            const Text("کالای دیجیتال"),
                          ],
                        ),
                      ),
                      /************* each section for buy in category *************/
                      SizedBox(
                        width: sizeOfColumns,
                        height: sizeOfColumns,
                        child: Column(
                          children: [
                            SizedBox(
                              width: sizeOfPicture,
                              height: sizeOfPicture,
                              child: CachedNetworkImage(
                                  imageUrl: "https://dkstatics-public.digikala.com/digikala-categories/3e3ec550569f974bc7e9d78c30b48612e5b1c606_1701193057.png"),
                            ),
                            const Text("خانه و آشپزخانه"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /************* each section for buy in category *************/
                      SizedBox(
                        width: sizeOfColumns,
                        height: sizeOfColumns,
                        child: Column(
                          children: [
                            SizedBox(
                              width: sizeOfPicture,
                              height: sizeOfPicture,
                              child: CachedNetworkImage(
                                  imageUrl: "https://dkstatics-public.digikala.com/digikala-categories/1fad42c6177e71db1a368e258c5bc004d6073a3a_1701193064.png"),
                            ),
                            const Text("مد و پوشاک"),
                          ],
                        ),
                      ),
                      /************* each section for buy in category *************/
                      SizedBox(
                        width: sizeOfColumns,
                        height: sizeOfColumns,
                        child: Column(
                          children: [
                            SizedBox(
                              width: sizeOfPicture,
                              height: sizeOfPicture,
                              child: CachedNetworkImage(
                                  imageUrl: "https://dkstatics-public.digikala.com/digikala-categories/5f3aa7bb8bde7c7433d31025d508ee3afd367773_1701193071.png"),
                            ),
                            const Text("کالاهای سوپرمارکتی"),
                          ],
                        ),
                      ),
                      /************* each section for buy in category *************/
                      SizedBox(
                        width: sizeOfColumns,
                        height: sizeOfColumns,
                        child: Column(
                          children: [
                            SizedBox(
                              width: sizeOfPicture,
                              height: sizeOfPicture,
                              child: CachedNetworkImage(
                                  imageUrl: "https://dkstatics-public.digikala.com/digikala-categories/f1ff29c0399fdbeef7cef44bf6ec897f31287449_1701193077.png"),
                            ),
                            const Text("کتاب، لوازم تحریر و هنر"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /************* each section for buy in category *************/
                      SizedBox(
                        width: sizeOfColumns,
                        height: sizeOfColumns,
                        child: Column(
                          children: [
                            SizedBox(
                              width: sizeOfPicture,
                              height: sizeOfPicture,
                              child: CachedNetworkImage(
                                  imageUrl: "https://dkstatics-public.digikala.com/digikala-categories/dee082825fa27bf216cc8cf2153745062c29e62d_1701193085.png"),
                            ),
                            const Text("اسباب بازی، کودک و نوزاد"),
                          ],
                        ),
                      ),
                      /************* each section for buy in category *************/
                      SizedBox(
                        width: sizeOfColumns,
                        height: sizeOfColumns,
                        child: Column(
                          children: [
                            SizedBox(
                              width: sizeOfPicture,
                              height: sizeOfPicture,
                              child: CachedNetworkImage(
                                  imageUrl: "https://dkstatics-public.digikala.com/digikala-categories/c2957abd1f437415eceb6428c7dce93ef3ee7495_1701193097.png"),
                            ),
                            const Text("زیبایی و سلامت"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (index == 5) {
          return returnOfferRow(const Color(0xff39ae00));
        } else if (index == 6) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8, right: 10),
                child: Text(
                  "پرفروش ترین ها",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  "محصولات پر فروش ماه",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  height: 250,
                  width: 1500,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: SizedBox(
                            height: 200,
                            width: 170,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    /************* blue buttom for add to cart *************/
                                    GestureDetector(
                                      // TODO: fix on tap
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const CartPage(),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 2),
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.blueAccent,
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    /************* show image of products *************/
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10, right: 10, bottom: 15),
                                      child: SizedBox(
                                        width: 90,
                                        height: 75,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            imageUrl: products[index].image,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                /************* show title of products *************/
                                SizedBox(
                                  width: 140,
                                  height: 60,
                                  child: Text(
                                    textDirection: TextDirection.ltr, //for english title
                                    textAlign: TextAlign.center, //center the text
                                    maxLines: 2,
                                    products[index].title,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 35,
                                        margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                                        decoration: const BoxDecoration(
                                          color: Color(0xffEF3F3E),
                                          borderRadius: BorderRadius.all(Radius.elliptical(100, 100)),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.only(top: 2),
                                          child: Text(
                                            '7%',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          "\$ ${products[index].price}",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        } else if (index == 7) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 170,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: "https://dkstatics-public.digikala.com/digikala-adservice-banners/8856efbb626ac47de8246cac983fc88c25412b7d_1703501848.jpg?x-oss-process=image/quality,q_95/format,webp",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              height: 700,
            ),
          );
        }
      },
    );
  }
}
