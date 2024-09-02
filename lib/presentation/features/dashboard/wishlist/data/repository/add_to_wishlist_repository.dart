import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/constants/app_constants.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/database/database.dart';
import 'package:hts_plus/core/services/app_service.dart';
import 'package:hts_plus/domain/model/app_response_model.dart';

class AddToWishListRepository {
  final ApiService _apiService;

  AddToWishListRepository(this._apiService);

  Future<AppResponseModel> addToWishList(
      {required int productId, required int quantity}) async {
    final storage = await SecureStorage();
    final id = await storage.getUserId();
    try {
      final response = await _apiService.post(
        path: AppConstants.addToWishList,
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


final addToWishListRepositoryProvider = Provider<AddToWishListRepository>(
  (ref) => AddToWishListRepository(
    ref.read(apiServiceProvider),
  ),
);