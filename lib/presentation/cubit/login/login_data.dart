part of 'login_cubit.dart';

class LoginData extends BaseData {
  LoginData._();

  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    passwordNode.dispose();
  }
}
