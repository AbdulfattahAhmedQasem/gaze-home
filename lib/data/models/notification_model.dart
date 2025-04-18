import 'package:equatable/equatable.dart';
import 'package:gazhome/core/utilities/app_converter.dart';
import 'package:gazhome/core/utilities/typedefs.dart';

class NotificationModel extends Equatable {
  const NotificationModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.read,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationModel.fromMap(DataMap map) {
    return NotificationModel(
      id: map['id'] as int,
      userId: map['user_id'] as int,
      title: map['title'] as String? ?? '',
      description: map['description'] as String? ?? '',
      read: bool.tryParse(map['read'] as String) ?? false,
      status: map['status'] as String? ?? '',
      createdAt: AppConverter.parseApiDate(map['created_at'] as String? ?? ''),
      updatedAt: AppConverter.parseApiDate(map['updated_at'] as String? ?? ''),
    );
  }

  final int id;
  final int userId;
  final String title;
  final String description;
  final bool read;
  final String status;
  final String createdAt;
  final String updatedAt;

  @override
  List<Object> get props {
    return [id, userId, title, description, read, status, createdAt, updatedAt];
  }
}
