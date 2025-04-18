part of 'support_cubit.dart';

class SupportData extends BaseData {
  SupportData._();

  final messageController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    messageController.dispose();
  }
}
