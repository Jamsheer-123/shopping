import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/app/modules/cart_page/controllers/cart_page_controller.dart';
import 'package:shopping/app/modules/cart_page/views/cart_page_view.dart';
import 'package:shopping/app/routes/app_pages.dart';
import 'package:shopping/infastructure/app.images.dart';
import '../controllers/home_controller.dart';
import 'local.widget/index.dart';
import 'local.widget/product_list.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      drawer: Container(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130), child: CustomAppbar()),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Column(
                children: [
                  SliderScreen(),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "CateGeory",
                            style: TextStyle(
                                color: Color(0xFF00A368),
                                fontSize: 17,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            "See All",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w900),
                          )
                        ],
                      )),
                  CategoryWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 24,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                  ),
                  ProductList()
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(Routes.CART_PAGE);
        },
        backgroundColor: Colors.amber,
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
        label: GetX<CartPageController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: TextStyle(color: Colors.black, fontSize: 24),
          );
        }),
      ),
    );
  }
}
