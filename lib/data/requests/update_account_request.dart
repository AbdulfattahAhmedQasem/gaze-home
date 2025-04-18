import 'package:gazhome/core/utilities/typedefs.dart';

class UpdateAccountRequest {
  UpdateAccountRequest({required this.firstName, required this.lastName});

  final String firstName;
  final String lastName;

  DataMap toMap() {
    return {'first_name': firstName, 'last_name': lastName};
  }
}
