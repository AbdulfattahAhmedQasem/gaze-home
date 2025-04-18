import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:gazhome/core/services/env_service.dart';
import 'package:gazhome/core/utilities/app_functions.dart';

import 'package:gazhome/core/utilities/typedefs.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.image,
    required this.password,
    required this.licenseNumber,
    required this.vehicleLicense,
    required this.vehicleNumber,
    required this.status,
    required this.code,
    required this.address,
    required this.fcmToken,
    required this.token,
    required this.userType,
    required this.companyVat,
    required this.companyRegCert,
  });

  factory UserModel.fromMap(DataMap map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String? ?? '',
      firstName: map['first_name'] as String? ?? '',
      lastName: map['last_name'] as String? ?? '',
      email: map['email'] as String? ?? '',
      phoneNumber: (map['phone_number'] as String).substring(4),
      image: map['image'] as String? ?? '',
      password: map['password'] as String? ?? '',
      licenseNumber: map['license_number'] as String? ?? '',
      vehicleLicense: map['vehicle_license'] as String? ?? '',
      vehicleNumber: map['vehicle_number'] as String? ?? '',
      status: map['status'] as String? ?? '',
      code: '${map['code'] ?? 0}',
      address: map['address'] as String? ?? '',
      fcmToken: map['fcm_token'] as String? ?? '',
      token: map['token'] as String? ?? '',
      userType: map['user_type'] as String? ?? '',
      companyVat: map['company_vat'] as String? ?? '',
      companyRegCert: map['company_reg_cert'] as String? ?? '',
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final int id;
  final String name;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String image;
  final String password;
  final String licenseNumber;
  final String vehicleLicense;
  final String vehicleNumber;
  final String status;
  final String code;
  final String address;
  final String fcmToken;
  final String token;
  final String userType;
  final String companyVat;
  final String companyRegCert;

  DataMap toMap() {
    return {
      'id': id,
      'name': name,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': '+966$phoneNumber',
      'image': image,
      'password': password,
      'license_number': licenseNumber,
      'vehicle_license': vehicleLicense,
      'vehicle_number': vehicleNumber,
      'status': status,
      'code': code,
      'address': address,
      'fcm_token': fcmToken,
      'token': token,
      'user_type': userType,
      'company_vat': companyVat,
      'company_reg_cert': companyRegCert,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      email,
      phoneNumber,
      status,
      code,
      fcmToken,
      token,
      userType,
      companyVat,
      companyRegCert,
    ];
  }
}
