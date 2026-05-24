import 'package:dio/dio.dart';

import '../models/ads_model.dart';

abstract class WorkSpaceRemoteDataSource {
  Future<List<AdsModel>> fetchAds();
}

class WorkSpaceRemoteDataSourceImpl implements WorkSpaceRemoteDataSource {
  final Dio _dio;

  WorkSpaceRemoteDataSourceImpl(this._dio);

  @override
  Future<List<AdsModel>> fetchAds() async {
    // final response = await _dio.get(ApiEndpoints.getAds);
    // TODO: add api and fetch true data
    return [AdsModel(adId: '1'), AdsModel(adId: '2'), AdsModel(adId: '3')];
  }
}
