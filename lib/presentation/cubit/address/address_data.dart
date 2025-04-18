part of 'address_cubit.dart';

class AddressData extends BaseData {
  AddressData._();

  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final streetController = TextEditingController();
  final buildingNumberController = TextEditingController();

  final stateNode = FocusNode();
  final streetNode = FocusNode();
  final buildingNumberNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    cityController.dispose();
    stateController.dispose();
    streetController.dispose();
    buildingNumberController.dispose();
    stateNode.dispose();
    streetNode.dispose();
    buildingNumberNode.dispose();
  }
}
