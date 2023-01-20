import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/app/modules/cart_page/controllers/cart_page_controller.dart';
import 'package:shopping/app/modules/detailed_page/controllers/detailed_page_controller.dart';
import 'package:shopping/infastructure/snackbar.dart';

class BottumBar extends StatelessWidget {
  BottumBar({super.key});
  DetailedPageController detailedPageController =
      Get.put(DetailedPageController());
  CartPageController cartPageController = Get.put(CartPageController());
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => Text(
                  "₹ ${detailedPageController.totalPrice}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00A368),
                  ),
                )),
            InkWell(
              onTap: () {
                cartPageController
                    .addToCart(detailedPageController.products.first);
                Utils().showSnackBar(
                    context: context, content: "You product Added");
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                decoration: BoxDecoration(
                    color: Color(0xFF00A368),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      "Add to Cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
