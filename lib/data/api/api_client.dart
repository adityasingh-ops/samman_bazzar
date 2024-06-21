import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:samman_bazzar/tools/app_constans.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;
  // ignore: unused_field
  late Map<String, String> _mainheader;
  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainheader = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };

  }
  Future<Response> getData(String uri) async {
    try{
      Response response = await get(uri,);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

}