
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/constants/app_constants.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/services/app_service.dart';
import 'package:hts_plus/presentation/features/all_products/data/model/get_all_products_model.dart';

class GetAllProductsRepository {
  final ApiService _apiService;

  
  GetAllProductsRepository(this._apiService);

  Future<GetAllProductsModel> getAllProducts() async {
    try {
      final response = await _apiService.get(AppConstants.getAllProducts);
      final allProductsModel = GetAllProductsModel.fromJson(response.data);
      //debugPrint('${allProductsModel.data!.first}');
      return allProductsModel;
    } on DioException catch (e) {
      return ExceptionHandler.handleError(e);
    }
  }
}



final getAllProductsRepositoryProvider = Provider<GetAllProductsRepository>(
  (ref) => GetAllProductsRepository(
    ref.read(apiServiceProvider),
  ),
);
