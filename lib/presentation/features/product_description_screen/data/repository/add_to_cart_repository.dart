import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/constants/app_constants.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/database/database.dart';
import 'package:hts_plus/core/services/app_service.dart';
import 'package:hts_plus/domain/model/app_response_model.dart';

class AddToCartRepository {
  final ApiService _apiService;

  AddToCartRepository(this._apiService);

  Future<AppResponseModel> addToCart(
      {required int productId, required int quantity}) async {
    final storage = await SecureStorage();
    final id = await storage.getUserId();
    try {
      final response = await _apiService.post(
        path: AppConstants.addToCart,
        data: {
          "productId": productId,
          "userId": id,
          "quantity": quantity,
        },
      );
      final data = AppResponseModel.fromJson(response.data);
      return data;
    } on DioException catch (e) {
      return ExceptionHandler.handleError(e);
    }
  }
}


final addToCartRepositoryProvider = Provider<AddToCartRepository>(
  (ref) => AddToCartRepository(
    ref.read(apiServiceProvider),
  ),
);