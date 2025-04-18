part of 'make_order_cubit.dart';

class MakeOrderData extends BaseData {
  MakeOrderData._();

  final dateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    dateController.dispose();
  }
}
