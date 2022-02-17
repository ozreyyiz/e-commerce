import 'package:e_commerce/constant.dart';
import 'package:flutter/material.dart';

class SlideCard extends StatelessWidget {
  const SlideCard({
    Key? key,
    required this.size,
    required this.backgroundColor,
  }) : super(key: key);

  final Size size;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(12, 20, 0, 20),
          height: size.height / 5,
          width: size.width / 1.4,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width / 2.3,
                    child: Text(
                      "30% OFF DURİNG COVİD-19",
                      style: TextStyle(
                          color: Color.fromARGB(255, 252, 252, 252),
                          fontSize: 18,
                          fontFamily: fontfamily,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                 const SizedBox(height: 5),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )),
                    onPressed: () {},
                    child: Text(
                      "Get Now",
                      style: TextStyle(color: backgroundColor),
                    ),
                  ),
                ],
              ),
              Container(
                height: size.height / 7,
                width: size.width / 4.2,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/shopping.png"),
                 fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
