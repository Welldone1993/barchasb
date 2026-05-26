import '../../domain/entities/employer_ad_entity.dart';

class EmployerAdModel extends EmployerAdEntity {
  const EmployerAdModel({
    required super.id,
    required super.title,
    super.description,
    super.category,
    super.imageUrl,
    super.price,
    super.isVerified,
  });

  factory EmployerAdModel.fromJson(Map<String, dynamic> json) {
    String? extractedImageUrl;
    if (json['images'] != null && (json['images'] as List).isNotEmpty) {
      final mainImage = (json['images'] as List).firstWhere(
        (img) => img['isMain'] == true,
        orElse: () => json['images'][0],
      );
      extractedImageUrl = mainImage['url'];
    }

    return EmployerAdModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? json['name'] ?? '',
      description:
          json['description'] ??
          (json['jobDetails'] != null && (json['jobDetails'] as List).isNotEmpty
              ? json['jobDetails'][0]['description']
              : null),
      category: json['category'] is String ? json['category'] : null,
      imageUrl: extractedImageUrl,
      price: json['price']?.toString(),
      isVerified: json['isVerified'] ?? false,
    );
  }
}
