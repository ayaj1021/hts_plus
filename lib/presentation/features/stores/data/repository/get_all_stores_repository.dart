
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/constants/app_constants.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/services/app_service.dart';
import 'package:hts_plus/presentation/features/stores/data/model/get_all_stores_model.dart';

class GetAllStoresRepository {
  final ApiService _apiService;

  // AllPostsModel allPostsModel = AllPostsModel();
  GetAllStoresRepository(this._apiService);

  Future<GetAllStoresModel> getAllStores() async {
    try {
      final response = await _apiService.get(AppConstants.getPartnerStores);
      final allStoresModel = GetAllStoresModel.fromJson(response.data);
      debugPrint('${allStoresModel.data!.first}');
      return allStoresModel;
    } on DioException catch (e) {
      return ExceptionHandler.handleError(e);
    }
  }
}

final getAllStoresRepositoryProvider = Provider<GetAllStoresRepository>(
  (ref) => GetAllStoresRepository(
    ref.read(apiServiceProvider),
  ),
);
