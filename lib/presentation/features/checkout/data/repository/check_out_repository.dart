import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/constants/app_constants.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/database/database.dart';
import 'package:hts_plus/core/services/app_service.dart';
import 'package:hts_plus/domain/model/app_response_model.dart';
import 'package:hts_plus/presentation/features/checkout/data/model/get_cart_total_model.dart';

class CheckOutRepository {
  CheckOutRepository(this._apiService);
//  final RestClient _restClient;
  final ApiService _apiService;
  GetCartTotalData getCartTotalData = GetCartTotalData();
  Future<AppResponseModel> applyCoupon({
    required String productId,
    required String quantity,
    required String couponCode,
    required String reference,
    required String orderNote,
    required String paymentType,
    //required String orderType,
  }) async {
    final storage = await SecureStorage();
    final id = await storage.getUserId();

    //   "reference": "PS_152526285",
    // "orderNote": "orderNote",
    // "paymentType": "Card",
    // "orderType": "In-app",
    try {
      final response =
          await _apiService.post(path: AppConstants.checkOut, data: {
        "customerId": id,
        "reference": reference,
        "orderNote": orderNote,
        "paymentType": paymentType,
        "orderType": "In-app",
        "orderItems": [
          {
            "productId": productId,
            "quantity": quantity,
          },
        ],
        "isNewCustomer": false,
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

final applyCouponRepositoryProvider = Provider<CheckOutRepository>(
  (ref) => CheckOutRepository(
    ref.read(apiServiceProvider),
  ),
);
