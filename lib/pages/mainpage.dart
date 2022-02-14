import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_commerce/constant.dart';
import 'package:e_commerce/pages/widgets/mainpage/bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool searchButton = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello Rocky",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Let's get something?",
                  style: TextStyle(color: softGrey),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: searchButton ? TextField() : Text(""),
      actions: [
        searchButton
            ? IconButton(
                onPressed: () {
                  setState(() {
                    searchButton = false;
                  });
                },
                icon: Icon(
                  Icons.clear,
                  color: h2TextHeaderColor,
                ),
              )
            : IconButton(
                onPressed: () {
                  setState(() {
                    searchButton = true;
                  });
                },
                icon: Icon(
                  Icons.search,
                  color: h2TextHeaderColor,
                  size: 30,
                ),
              ),
      ],
    );
  }

  BottomNavyBar bottomNavigationBar() {
    return BottomNavyBar(
      selectedIndex: index,
      items: [
        bottomNavigationBarItem(icon: Icon(Icons.home), title: "Home"),
        bottomNavigationBarItem(icon: Icon(Icons.favorite), title: "Favorites"),
        bottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: "Cart"),
        bottomNavigationBarItem(icon: Icon(Icons.person), title: "Profile"),
      ],
      onItemSelected: (int index) {
        setState(() {
          this.index = index;
        });
      },
    );
  }
}
