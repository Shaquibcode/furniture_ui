import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

import '../widget/cat_product_card.dart';

class CategoryScreen extends StatelessWidget {
  String category;
  CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xffF3F6FD),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    Neumorphic(
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12),
                        ),
                        color: const Color(0xffF3F6FD),
                        intensity: 1,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(CupertinoIcons.cart_fill),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(20),
                      ),
                      color: const Color(0xffF3F6FD),
                      intensity: 1,
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                      child: Row(
                        children: [
                          Icon(Icons.sort),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Sort",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(20),
                      ),
                      color: const Color(0xffF3F6FD),
                      intensity: 1,
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                      child: Row(
                        children: [
                          Icon(Icons.filter_list),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Filter",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              GridView.builder(
                itemCount: 4,
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 50,
                  left: 5,
                  right: 5,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  childAspectRatio:
                  (MediaQuery.of(context).size.width - 15 - 10) / (2 * 250),
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (index % 2 == 0) {
                    return CatProductCard(index);
                  }
                  return OverflowBox(
                    maxHeight: 250 + 70,
                    child: Container(
                      margin: const EdgeInsets.only(top: 70),
                      child: CatProductCard(index),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
