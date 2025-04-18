part of 'account_cubit.dart';

class AccountData extends BaseData {
  AccountData._() {
    final isNotDriver = !sl<SharedData>().userType.isDriver();
    if (isNotDriver) {
      firstNameController = TextEditingController();
      lastNameController = TextEditingController();
      phoneNumberController = TextEditingController();
      lastNameNode = FocusNode();
      phoneNumberNode = FocusNode();
    }
  }

  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? phoneNumberController;
  FocusNode? lastNameNode;
  FocusNode? phoneNumberNode;

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController?.dispose();
    lastNameController?.dispose();
    phoneNumberController?.dispose();
    lastNameNode?.dispose();
    phoneNumberNode?.dispose();
  }
}
