class AppConstants {
  static const baseUrl = 'https://hts-backend-main.onrender.com/v1';
  static const getPartnerStores = '$baseUrl/admin/partner-store';
  static const getAllProducts = '$baseUrl/admin/product';
  static const getAllCategory = '$baseUrl/admin/category';
  static const applyCoupon = '$baseUrl/admin/apply-coupon';
  static const login = '$baseUrl/auth/login';
  static const forgotPassword = '$baseUrl/auth/forgot-password';
  static  resetPassword(String token) => '$baseUrl/auth/reset-password?token=$token';
  static getAllProductsById(String id) => '$baseUrl/admin/product/$id';
  static getCart(String id) => '$baseUrl/carts/$id';
  static getWishList(String id) => '$baseUrl/wish/view/$id';
  static const addToCart = '$baseUrl/carts/add';
  static const checkOut = '$baseUrl/checkout';
  static const addToWishList = '$baseUrl/wish/add';
  static const deleteCart = '$baseUrl/carts/remove';
  static getAllStoresProducts(String id) =>
      '$baseUrl/admin/product?partnerStoreId=$id';
}
