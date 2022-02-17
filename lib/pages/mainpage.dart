import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_commerce/constant.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/product_list.dart';
import 'package:e_commerce/service/category_service.dart';
import 'package:e_commerce/widgets/icons_svg_icons.dart';
import 'package:e_commerce/widgets/mainpage/bottom_navigation_bar_item.dart';
import 'package:e_commerce/widgets/mainpage/slide_card.dart';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var productList = products;

  bool searchButton = false;
  int index = 0;
int itemCount=0;
  int categoryNo = 0;

  bn() {
    itemCount = CategoryService.categoryIdService(categoryNo);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  nameArea(),
                ],
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SlideCard(
                    size: size,
                    backgroundColor: Colors.orange,
                  ),
                  SlideCard(
                    size: size,
                    backgroundColor: Colors.blue,
                  ),
                  SlideCard(
                    size: size,
                    backgroundColor: Colors.purple,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Categories",
                      style: TextStyle(
                        fontFamily: fontfamily,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "SEE ALL",
                        style: TextStyle(
                          fontFamily: fontfamily,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (() {
                        categoryNo = 1;
                        bn();
                        

                      }),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: containerBackground,
                        ),
                        child: Icon(
                          Icons.watch,
                          color: hardGrey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: (() {
                        categoryNo = 2;
                        bn();
                       
                      }),
                      child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: containerBackground,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Icon(
                              IconsSvg.bag_svgrepo_com,
                              color: hardGrey,
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 1,
                ),
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) {
                  Product product = productList[index];
                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: size.width / 2,
                          decoration: BoxDecoration(
                            color: containerBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 5,
                                      top: 5,
                                    ),
                                    child: Icon(Icons.favorite),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Image.network(
                                  product.photoUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(product.name),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 10),
                          Text(
                            "\$${product.price.toString()}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "\$${product.oldPrice.toString()}",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Column nameArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello Rocky",
          style: TextStyle(
            fontFamily: fontfamily,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Let's get something?",
          style: TextStyle(color: softGrey),
        )
      ],
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
