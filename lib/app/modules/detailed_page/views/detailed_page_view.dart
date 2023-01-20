import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopping/app/model/productapi.dart';
import 'package:shopping/app/modules/cart_page/controllers/cart_page_controller.dart';

import '../controllers/detailed_page_controller.dart';
import 'localwidegt/boottum_bar.dart';

class DetailedPageView extends GetView<DetailedPageController> {
  CartPageController cartPageController = Get.put(CartPageController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Obx(() => controller.products.length == 0
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        height: 340,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage(controller.products[0].image!))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => Get.back(),
                            child: Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Color(0xFF00A368),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.4,
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFF00A368),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.products.first.pname
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Obx(() => Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundColor: Colors.white,
                                              child: IconButton(
                                                  onPressed: () {
                                                    cartPageController
                                                        .removeItems();

                                                    if (controller
                                                            .products.length !=
                                                        1) {
                                                      controller.products
                                                          .remove(controller
                                                              .products.last);
                                                    }
                                                  },
                                                  icon: Icon(
                                                    Icons.remove,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                cartPageController.items.value
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundColor: Colors.white,
                                              child: Center(
                                                child: IconButton(
                                                    onPressed: () {
                                                      cartPageController
                                                          .addItems();

                                                      controller.products.add(
                                                          controller
                                                              .products.first);
                                                    },
                                                    icon: Icon(
                                                      Icons.add,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 30,
                                    ),
                                    Text(
                                      "4.8(230)",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Description :",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  controller.products.first.description ?? "",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delivary Time :",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.clock,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        "20 minutes",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ))),
            bottomNavigationBar: BottumBar()));
  }
}
