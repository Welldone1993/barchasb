// lib/features/home/domain/entities/ad_entity.dart
import 'package:equatable/equatable.dart';

class AdEntity extends Equatable {
  final String id; // تغییر از int به String
  final String title;
  final String? description;
  final String? category;
  final String? imageUrl;
  final String? price;
  final bool isVerified;

  const AdEntity({
    required this.id,
    required this.title,
    this.description,
    this.category,
    this.imageUrl,
    this.price,
    this.isVerified = false,
  });

  @override
  List<Object?> get props => [id, title, description, category, imageUrl, price, isVerified];
}
