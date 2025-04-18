import 'package:equatable/equatable.dart';
import 'package:gazhome/core/utilities/typedefs.dart';

class RegionModel extends Equatable {
  const RegionModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.radius,
  });

  factory RegionModel.fromMap(DataMap map) {
    return RegionModel(
      id: map['id'] as int,
      name: map['name'] as String,
      latitude:
          map['latitude'] != null
              ? double.parse(map['latitude'].toString())
              : 24.625542784999062,
      longitude:
          map['longitude'] != null
              ? double.parse(map['longitude'].toString())
              : 46.48315429687501,
      radius:
          map['longitude'] != null
              ? double.parse(map['longitude'].toString())
              : 0.0,
    );
  }

  final int id;
  final String name;
  final double latitude;
  final double radius;
  final double longitude;

  @override
  List<Object> get props {
    return [id, name, latitude, longitude, radius];
  }
}
