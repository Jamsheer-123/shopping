import 'package:get/get.dart';

import 'package:shopping/app/modules/cart_page/bindings/cart_page_binding.dart';
import 'package:shopping/app/modules/cart_page/views/cart_page_view.dart';
import 'package:shopping/app/modules/detailed_page/bindings/detailed_page_binding.dart';
import 'package:shopping/app/modules/detailed_page/views/detailed_page_view.dart';
import 'package:shopping/app/modules/home/bindings/home_binding.dart';
import 'package:shopping/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAILED_PAGE,
      page: () => DetailedPageView(),
      binding: DetailedPageBinding(),
    ),
    GetPage(
      name: _Paths.CART_PAGE,
      page: () => CartPageView(),
      binding: CartPageBinding(),
    ),
  ];
}
