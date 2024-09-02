import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/constants/app_constants.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/database/database.dart';
import 'package:hts_plus/core/services/app_service.dart';
import 'package:hts_plus/presentation/features/cart/data/model/get_cart_model.dart';

class GetAllCartRepository {
  final ApiService _apiService;

  GetAllCartRepository(this._apiService);

  Future<GetCartModel> getCart() async {
    final storage = await SecureStorage();
    final id = await storage.getUserId();
    try {
      final response = await _apiService.get(AppConstants.getCart('$id'));
      final getCartModel = GetCartModel.fromJson(response.data);
      //debugPrint('${allProductsModel.data!.first}');
      return getCartModel;
    } on DioException catch (e) {
      return ExceptionHandler.handleError(e);
    }
  }
}

final getCartRepositoryProvider = Provider<GetAllCartRepository>(
  (ref) => GetAllCartRepository(
    ref.read(apiServiceProvider),
  ),
);
