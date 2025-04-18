import 'package:equatable/equatable.dart';

class OnboardingModel extends Equatable {
  const OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  List<Object> get props => [image, title, description];
}
