import 'package:demo_shopping/routes/bottom_nav.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'IranYekan',
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNav(),
      ),
    );
  }
}
