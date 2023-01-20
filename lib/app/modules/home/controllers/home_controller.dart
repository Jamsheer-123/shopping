import 'package:get/get.dart';
import 'package:shopping/app/model/productapi.dart';
import 'package:shopping/app/model/productmodel.dart';
import 'package:shopping/infastructure/app.images.dart';

class HomeController extends GetxController {
  final products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = ProductApi().productResult;

    products.value = productResult;
  }
}
