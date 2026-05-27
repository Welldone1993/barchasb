import 'package:equatable/equatable.dart';

class DigitalAdEntity extends Equatable {
  final String id;
  final String title;
  final String? description;
  final String? imageUrl;
  final DateTime createdAt;
  final bool isBookmarked;

  const DigitalAdEntity({
    required this.id,
    required this.title,
    this.description,
    this.imageUrl,
    required this.createdAt,
    this.isBookmarked = false,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    imageUrl,
    createdAt,
    isBookmarked,
  ];
}
