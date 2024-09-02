import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hts_plus/core/config/constants/app_constants.dart';
import 'package:hts_plus/core/config/exception/exception_handler.dart';
import 'package:hts_plus/core/database/database.dart';
import 'package:hts_plus/core/services/app_service.dart';
import 'package:hts_plus/presentation/features/dashboard/wishlist/data/model/wishlist_model.dart';

class GetWishListRepository {
  final ApiService _apiService;

  GetWishListRepository(this._apiService);

  Future<WishListModel> getWishList() async {
    final storage = await SecureStorage();
    final id = await storage.getUserId();
    try {
      final response = await _apiService.get(AppConstants.getWishList('$id'));

      final getWishListModel = WishListModel.fromJson(response.data);
      //debugPrint('${allProductsModel.data!.first}');
      return getWishListModel;
    } on DioException catch (e) {
      return ExceptionHandler.handleError(e);
    }
  }
}

final getWishListRepositoryProvider = Provider<GetWishListRepository>(
  (ref) => GetWishListRepository(
    ref.read(apiServiceProvider),
  ),
);
