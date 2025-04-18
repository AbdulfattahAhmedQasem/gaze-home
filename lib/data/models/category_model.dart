import 'package:equatable/equatable.dart';
import 'package:gazhome/core/utilities/typedefs.dart';

class CategoryModel extends Equatable {
  const CategoryModel({required this.id, required this.name});

  factory CategoryModel.fromMap(DataMap map) {
    return CategoryModel(id: map['id'] as int, name: map['name'] as String);
  }

  final int id;
  final String name;

  @override
  List<Object> get props => [id, name];
}
