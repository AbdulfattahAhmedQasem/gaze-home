import 'package:equatable/equatable.dart';

import 'package:gazhome/core/utilities/typedefs.dart';

class AddressModel extends Equatable {
  const AddressModel({
    required this.id,
    required this.userId,
    required this.streetName,
    required this.buildingNumber,
    required this.city,
    required this.state,
    required this.status,
    required this.latitude,
    required this.longitude,
  });

  factory AddressModel.create({
    required String city,
    required String state,
    required String streetName,
    required String buildingNumber,
    required double latitude,
    required double longitude,
    String status = 'home',
  }) {
    return AddressModel(
      id: 0,
      userId: 0,
      streetName: streetName,
      buildingNumber: buildingNumber,
      city: city,
      state: state,
      status: status,
      latitude: latitude,
      longitude: longitude,
    );
  }

  factory AddressModel.fromMap(DataMap map) {
    return AddressModel(
      id: map['id'] as int,
      userId: map['user_id'] as int,
      streetName: map['street_name'] as String? ?? '',
      buildingNumber: map['building_number'] as String? ?? '',
      city: map['city'] as String? ?? '',
      state: map['area'] as String? ?? map['state'] as String? ?? '',
      status: map['status'] as String? ?? '',
      latitude: double.parse('${map['latitude']}'),
      longitude: double.parse('${map['longitude']}'),
    );
  }

  final int id;
  final int userId;
  final String streetName;
  final String buildingNumber;
  final String city;
  final String state;
  final String status;
  final double latitude;
  final double longitude;

  AddressModel copyWith({
    int? id,
    int? userId,
    String? streetName,
    String? buildingNumber,
    String? city,
    String? state,
    String? status,
    double? latitude,
    double? longitude,
  }) {
    return AddressModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      streetName: streetName ?? this.streetName,
      buildingNumber: buildingNumber ?? this.buildingNumber,
      city: city ?? this.city,
      state: state ?? this.state,
      status: status ?? this.status,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  DataMap toMap() {
    return {
      'city': city,
      'state': state,
      'street_name': streetName,
      'building_number': buildingNumber.isEmpty ? null : buildingNumber,
      'status': status,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  List<Object> get props {
    return [
      id,
      userId,
      streetName,
      buildingNumber,
      city,
      state,
      status,
      latitude,
      longitude,
    ];
  }
}
