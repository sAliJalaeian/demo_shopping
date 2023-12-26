import 'package:demo_shopping/routes/account_page.dart';
import 'package:demo_shopping/routes/cart_page.dart';
import 'package:demo_shopping/routes/fields_page.dart';
import 'package:demo_shopping/routes/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> pages = [
    const HomePage(),
    const FieldsPage(),
    const CartPage(),
    const AccountPage(),
  ];
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /************* navigation bar bottom *************/
      appBar: AppBar(
        title: const SizedBox(
          height: 32.0,
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              "Digikala",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffEF3F3E),
      ),

      /************* pages selected with selectedIndex *************/
      body: pages.elementAt(selectedIndex),

      /************* navigation bar bottom *************/
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        iconSize: 20,
        elevation: 10,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        selectedIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.house,
            ),
            label: "خانه ",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_tree_outlined,
            ),
            label: "دسته بندی ها",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.cartShopping,
            ),
            label: "سبد خرید",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.userGroup,
            ),
            label: "حساب کاربری",
          ),
        ],
      ),
    );
  }
}
