import 'package:get/get.dart';
import 'package:shopping/app/model/productapi.dart';
import 'package:shopping/app/model/productmodel.dart';

class DetailedPageController extends GetxController {
  final products = <Product>[].obs;
  double get totalPrice => products.fold(0, (sum, item) => sum + item.pcost!);

  var argumentData = Get.arguments;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void fetchProducts() async {
    List<Product> pp = [];
    await Future.delayed(Duration(seconds: 1));
    for (int i = 0; i < ProductApi().productResult.length; i++) {
      if (ProductApi().productResult[i].pid.toString() ==
          argumentData['id'].toString()) {
        pp.add(ProductApi().productResult[i]);
        print(products.value.length);
      }
    }
    var productResult = ProductApi().productResult;

    products.value = pp;
  }
}
