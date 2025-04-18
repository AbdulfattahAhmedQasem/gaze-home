import 'package:gazhome/core/utilities/typedefs.dart';

class LoginRequest {
  LoginRequest({
    required this.phoneNumber,
    required this.password,
    required this.fcmToken,
  });

  final String phoneNumber;
  final String password;
  final String fcmToken;

  DataMap toMap() {
    return {
      'phone_number': '+966${phoneNumber.trim()}',
      'password': '+966$password',
      'fcm_token': fcmToken,
    };
  }
}
