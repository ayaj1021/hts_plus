import 'package:hts_plus/core/utils/enums.dart';
import 'package:hts_plus/presentation/features/stores/data/model/get_all_stores_model.dart';

class GetAllStoresState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? error;
  final String? message;
  final LoadState loadState;
  final List<GetAllStoresData> getAllStoresData;

  GetAllStoresState({
    required this.isLoading,
    required this.isAuthenticated,
    this.error,
    this.message,
    required this.loadState,
    required this.getAllStoresData,
  });

  factory GetAllStoresState.initial() {
    return GetAllStoresState(
      isLoading: false,
      isAuthenticated: false,
      error: null,
      message: '',
      loadState: LoadState.loading,
      getAllStoresData: [],
    );
  }

  GetAllStoresState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    String? error,
    String? message,
    LoadState? loadState,
    List<GetAllStoresData>? getAllStoresData,
  }) {
    return GetAllStoresState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      error: message,
      loadState: loadState ?? this.loadState,
      getAllStoresData: getAllStoresData ?? this.getAllStoresData,
    );
  }
}
