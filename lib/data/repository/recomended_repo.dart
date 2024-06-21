import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:samman_bazzar/data/api/api_client.dart';
import 'package:samman_bazzar/tools/app_constans.dart';

class RecomendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecomendedProductRepo({required this.apiClient});

  Future<Response> getRecomendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMENDEDPRODUCTURL);
  }
}
