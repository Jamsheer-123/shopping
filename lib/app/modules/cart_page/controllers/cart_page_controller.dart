import 'package:get/get.dart';
import 'package:shopping/app/model/productmodel.dart';

class CartPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  var cartItems = <Product>[].obs;
  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.pcost!);

  addToCart(Product product) {
    cartItems.add(product);
  }

  var items = 1.obs;
  void addItems() async {
    items = items + 1;
    update();
  }

  void removeItems() async {
    if (items > 1) {
      items = items - 1;
    }
    update();
  }
}
