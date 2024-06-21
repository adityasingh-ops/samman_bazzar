import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samman_bazzar/Controllers/popuplar_prodet_controller.dart';
import 'package:samman_bazzar/Controllers/recomended_product_controller.dart';
import 'package:samman_bazzar/routes/routeshelper/route_helper.dart';
import 'helper/dependencies.dart' as dep;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// This is the main entry point of the Samman Bazzar application.

    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecomendedProductController>().getRecomendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Samman_Bazzar',
      initialRoute: RouteHelper.getIntial(),
      getPages: RouteHelper.route,

    );
  }
}
