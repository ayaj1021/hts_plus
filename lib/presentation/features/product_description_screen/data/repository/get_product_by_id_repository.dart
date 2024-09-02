import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/constants/app_constants.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/services/app_service.dart';
import 'package:hts_plus/presentation/features/product_description_screen/data/model/get_product_by_id_model.dart';

class GetProductsByIdRepository {
  final ApiService _apiService;

  GetProductsByIdRepository(this._apiService);

  Future<GetProductsByIdModel> getProductsById({required String id}) async {
    try {
      final response =
          await _apiService.get(AppConstants.getAllProductsById(id));
      final getProductsByIdModel = GetProductsByIdModel.fromJson(response.data);
      debugPrint('${getProductsByIdModel.data!}');
      return getProductsByIdModel;
    } on DioException catch (e) {
      return ExceptionHandler.handleError(e);
    }
  }
}

final getProductsByIdRepositoryProvider = Provider<GetProductsByIdRepository>(
  (ref) => GetProductsByIdRepository(
    ref.read(apiServiceProvider),
  ),
);
