import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/app/modules/cart_page/controllers/cart_page_controller.dart';
import 'package:shopping/app/modules/home/controllers/home_controller.dart';
import 'package:shopping/app/routes/app_pages.dart';
import 'package:shopping/infastructure/app.images.dart';

class ProductList extends GetView<HomeController> {
  ProductList({
    Key? key,
  }) : super(key: key);
  CartPageController cartPageController = Get.put(CartPageController());
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          shrinkWrap: true,
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.toNamed(Routes.DETAILED_PAGE,
                    arguments: {"id": controller.products[index].pid!});
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 19),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7)
                    ]),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Image.asset(
                        controller.products[index].image!,
                        fit: BoxFit.contain,
                        width: 110,
                        height: 100,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 9),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          controller.products[index].pname!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 9),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          controller.products[index].pavailability == 0
                              ? "Not Available"
                              : "Available",
                          style: TextStyle(
                              color:
                                  controller.products[index].pavailability == 0
                                      ? Colors.red
                                      : Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$ " "${controller.products[index].pcost!}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00A368)),
                          ),
                          InkWell(
                            onTap: () {
                              cartPageController
                                  .addToCart(controller.products[index]);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Color(0xFF00A368),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(Icons.shopping_cart),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 1; i < 4; i++)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 6)
                  ]),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(
                      AppImages.banana,
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Text(
                    "Cateogry",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
