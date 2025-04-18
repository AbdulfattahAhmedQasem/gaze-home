part of 'forgot_password_cubit.dart';

class ForgotPasswordData extends BaseData {
  ForgotPasswordData._();

  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final confirmPasswordNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    confirmPasswordNode.dispose();
  }
}
