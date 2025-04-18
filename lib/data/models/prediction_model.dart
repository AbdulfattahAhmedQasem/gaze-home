import 'package:equatable/equatable.dart';

class PredictionModel extends Equatable {
  const PredictionModel({required this.placeId, required this.description});

  factory PredictionModel.fromMap(Map<String, dynamic> map) {
    return PredictionModel(
      placeId: map['place_id'] as String,
      description: map['description'] as String,
    );
  }

  final String placeId;
  final String description;

  @override
  List<Object> get props => [placeId, description];
}
