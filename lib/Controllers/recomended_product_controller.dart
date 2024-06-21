import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:samman_bazzar/data/repository/recomended_repo.dart';
import 'package:samman_bazzar/models/popular_product_model.dart';

class RecomendedProductController extends GetxController{
  final RecomendedProductRepo recomendedProductRepo;
  RecomendedProductController({required this.recomendedProductRepo});
  List<dynamic> _recomendedProductList = [];
  List<dynamic> get recomendedProductList => _recomendedProductList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  Future<void> getRecomendedProductList() async {
    Response response = await recomendedProductRepo.getRecomendedProductList();
    if(response.statusCode == 200){
      print("got data");
      _recomendedProductList = [];
      _recomendedProductList.addAll(Product.fromJson(response.body).products as Iterable);
      _isLoading = true;
      update();
    }else{
      print('Error');
    }
  }
}