import 'package:get/get.dart';
import 'package:magic_villa/ui/screens/get_villa_by_id_screen.dart';

import 'ui/screens/villa_screen.dart';

class RouteNames {
  static String villaScreen = "/villaScreen";
  static String getVillaByIdScreen = "/getVillaByIdScreen";
}

class AppRoute {
  static final route = [
    GetPage(
      name: RouteNames.villaScreen,
      page: () => VillaScreen(),
    ),
    GetPage(
      name: RouteNames.getVillaByIdScreen,
      page: () => GetVillaByIdScreen(),
    ),
  ];
}
