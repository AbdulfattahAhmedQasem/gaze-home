part of 'register_cubit.dart';

class RegisterData extends BaseData {
  RegisterData._();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final taxNumberController = TextEditingController();
  final commercialRegisterController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final lastNameNode = FocusNode();
  final phoneNumberNode = FocusNode();
  final taxNumberNode = FocusNode();
  final commercialRegisterNode = FocusNode();
  final passwordNode = FocusNode();
  final confirmPasswordNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  void resetData() {
    firstNameController.clear();
    lastNameController.clear();
    phoneNumberController.clear();
    taxNumberController.clear();
    commercialRegisterController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    taxNumberController.dispose();
    commercialRegisterController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    lastNameNode.dispose();
    phoneNumberNode.dispose();
    taxNumberNode.dispose();
    commercialRegisterNode.dispose();
    passwordNode.dispose();
    confirmPasswordNode.dispose();
  }
}
