import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/constants/app_constants.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/services/app_service.dart';
import 'package:hts_plus/presentation/features/categories/data/model/get_all_categories_model.dart';

class GetAllCategoryRepository {
  final ApiService _apiService;

  GetAllCategoryRepository(this._apiService);

  Future<GetAllCategoriesModel> getAllCategory() async {
    try {
      final response = await _apiService.get(AppConstants.getAllCategory);
      final allCategoriesModel = GetAllCategoriesModel.fromJson(response.data);
      debugPrint('${allCategoriesModel.data}');
      return allCategoriesModel;
    } on DioException catch (e) {
      return ExceptionHandler.handleError(e);
    }
  }
}

final getAllCategoryRepositoryProvider = Provider<GetAllCategoryRepository>(
  (ref) => GetAllCategoryRepository(
    ref.read(apiServiceProvider),
  ),
);
