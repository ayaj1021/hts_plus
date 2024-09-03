import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/constants/app_constants.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/services/app_service.dart';
import 'package:hts_plus/domain/model/app_response_model.dart';
import 'package:hts_plus/presentation/features/checkout/data/model/get_cart_total_model.dart';

import '../model/check_out_request.dart';

class CheckOutRepository {
  CheckOutRepository(this._apiService);

//  final RestClient _restClient;
  final ApiService _apiService;
  GetCartTotalData getCartTotalData = GetCartTotalData();

  Future<AppResponseModel> checkOut({
    required int customerId,
    required String reference,
    required String orderNote,
    required String orderType,
    required String paymentType,
    required bool isNewCustomer,
    required List<OrderItem> orderItems,
    required String couponCode,
  }) async {
    try {
      final response =
          await _apiService.post(path: AppConstants.checkOut, data: {
        "customerId": customerId,
        "reference": reference,
        "orderNote": orderNote,
        "paymentType": paymentType,
        "orderType": orderType,
        "orderItems": orderItems,
        "isNewCustomer": isNewCustomer,
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

final checkOutRepositoryProvider = Provider<CheckOutRepository>(
  (ref) => CheckOutRepository(
    ref.read(apiServiceProvider),
  ),
);
