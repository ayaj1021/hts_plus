import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/constants/app_constants.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/database/database.dart';
import 'package:hts_plus/core/services/app_service.dart';
import 'package:hts_plus/domain/model/app_response_model.dart';
import 'package:hts_plus/presentation/features/checkout/data/model/get_cart_total_model.dart';

class ApplyCouponRepository {
  ApplyCouponRepository(this._apiService);
//  final RestClient _restClient;
  final ApiService _apiService;
  GetCartTotalData getCartTotalData = GetCartTotalData();
  Future<AppResponseModel> applyCoupon(
      {required String productId,
      required String quantity,
      required String couponCode}) async {
    final storage = await SecureStorage();
    final id = await storage.getUserId();
    try {
      final response =
          await _apiService.post(path: AppConstants.applyCoupon, data: {
        "customerId": id,
        "regionId": 1,
        "orderItems": [
          {
            "productId": productId,
            "quantity": quantity,
          },
        ],
        "couponeCode": couponCode
      });
      final data = AppResponseModel.fromJson(response.data);

      
      getCartTotalData = GetCartTotalData.fromJson(response.data);

      return data;
    } on DioException catch (e) {
      return ExceptionHandler.handleError(e);
    }
  }
}

final applyCouponRepositoryProvider = Provider<ApplyCouponRepository>(
  (ref) => ApplyCouponRepository(
    ref.read(apiServiceProvider),
  ),
);
