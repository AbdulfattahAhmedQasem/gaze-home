import 'package:flutter/widgets.dart';
import 'package:gazhome/core/enums/enums.dart';
import 'package:gazhome/core/utilities/typedefs.dart';

class SharedData {
  String token = '';
  void clearToken() => token = '';

  bool isUserAuthenticated = false;
  String routeName = '';
  DataMap notificationMessage = <String, dynamic>{};

  UserType userType = UserType.individual;
  bool isChangePassword = false;

  void setUserType(String? type) {
    if (type == null || type == 'user') {
      userType = UserType.individual;
    } else if (type == 'company') {
      userType = UserType.business;
    } else {
      userType = UserType.driver;
    }
  }

  Map<int, BuildContext> cartContextMap = <int, BuildContext>{};
}
