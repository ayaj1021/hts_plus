import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/constants/app_constants.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/services/app_service.dart';
import 'package:hts_plus/presentation/features/store_products/data/model/get_all_store_products_model.dart';

class GetAllStoreProductsRepository {
  final ApiService _apiService;

  GetAllStoreProductsRepository(this._apiService);

  Future<GetAllStoreProductsModel> getAllStoreProducts(
      {required String storeId}) async {
    try {
      final response =
          await _apiService.get(AppConstants.getAllStoresProducts(storeId));
      final allStoreProductsModel =
          GetAllStoreProductsModel.fromJson(response.data);
      debugPrint('${allStoreProductsModel.data!.first}');
      return allStoreProductsModel;
    } on DioException catch (e) {
      return ExceptionHandler.handleError(e);
    }
  }
}

final getAllStoreProductsRepositoryProvider =
    Provider<GetAllStoreProductsRepository>(
  (ref) => GetAllStoreProductsRepository(
    ref.read(apiServiceProvider),
  ),
);
