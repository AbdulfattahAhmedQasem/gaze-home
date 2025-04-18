import 'package:gazhome/core/injections/di_imports.dart';
import 'package:gazhome/data/usecases/app_use_cases.dart';

class ApiConstants {
  const ApiConstants._();

  static const placesBaseUrl = 'https://maps.googleapis.com/maps/api/place/';
  static const placeApiAutoComplete = 'autocomplete/json';
  static const userLogin = '/api/user/login';
  static const driverLogin = '/api/driver/login';
  static const register = '/api/user/register';
  static const userSendCode = '/api/user/send-code';
  static const driverSendCode = '/api/driver/send-code';
  static const userVeryfyCode = '/api/user/verify-code';
  static const driverVeryfyCode = '/api/driver/verify-code';
  static const confirmedCode = '/api/user/confirmed-code';
  static const userResetPassword = '/api/user/reset-password';
  static const driverResetPassword = '/api/driver/reset-password';
  static const userLogout = '/api/user/logout';
  static const driverLogout = '/api/driver/logout';
  static const userDeleteAccount = '/api/user/delete-account';
  static const driverDeleteAccount = '/api/driver/delete-account';
  static const categories = '/api/user/categories';
  static const products = '/api/user/products';
  static const banners = '/api/user/banners';
  static const cart = '/api/user/cart';
  static const addToCart = '/api/user/add-to-cart';
  static const deleteFromCart = '/api/user/remove-from-cart';
  static const increaceProductquntaty =
      '/api/user/increece-quntaty-for-product';
  static const decreaseProductquntaty =
      '/api/user/decrease-quntaty-for-product';
  static const sendComplaint = '/api/technical';
  static const createUserOrder = '/api/user/create-order';
  static const completeUserOrder = '/api/user/complete-order-web';
  static const userOrders = '/api/user/all-orders';
  static const cancelUserOrder = '/api/user/cancel-order';
  static const addresses = '/api/user/address';
  static const addAddress = '/api/user/store-address';
  static const deleteAddress = '/api/user/delete-address';
  static const favorite = '/api/wishlist';
  static const notifications = '/api/notifications';
  static const deleteNotification = '/api/delete-notification';
  static const updateAccount = '/api/user/update';
  static const changePhone = '/api/user/change-phone';
  static const verifyPhone = '/api/user/verify-phone';
  static const paymentUrl = '/myfatoorah/index';
  static const regions = '/api/driver/all-regions';
  static const regionOrders = '/api/driver/orders';
  static const driverOrders = '/api/driver/driver-orders';
  static const driverOrdersInProfile = '/api/driver/all-orders';
  static const getDriverOrder = '/api/driver/get-order';
  static const cancelDriverOrder = '/api/driver/cancel-order';
  static const updatePaymentToPaid = '/api/driver/update-payment';
  static const rejectDriverOrder = '/api/driver/reject-order';

  static Map<String, String> authorization(String token) => {
        'Authorization': 'Bearer $token',
      };

  static Map<String, String> headers({
    Map<String, String>? additionalHeaders,
    String? tempToken,
  }) {
    final languageCode = sl<GetLanguageCodeUseCase>()();
    final token = tempToken ?? sl<GetTokenUseCase>()();

    return {
      ...{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Accept-Language': languageCode,
        'Authorization': 'Bearer $token',
      },
      ...?additionalHeaders,
    };
  }
}
