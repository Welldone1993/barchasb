import '../../domain/entities/ads_entity.dart';

class AdsModel extends AdsEntity {
  AdsModel({required super.adId});

  factory AdsModel.fromJson(Map<String, dynamic> json) {
    return AdsModel(adId: json['id']);
  }
}
