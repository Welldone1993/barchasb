 import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../models/ads_model.dart';
import '../models/weekly_stats_model.dart';

abstract class WorkSpaceRemoteDataSource {
  Future<List<AdsModel>> fetchAds();

  Future<List<WeeklyStatsModel>> fetchWeeklyStats();
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

  @override
  Future<List<WeeklyStatsModel>> fetchWeeklyStats() async {
    final response = await _dio.get(ApiEndpoints.weeklyStats);

    return response.data
        .map((json) => WeeklyStatsModel.fromJson(json))
        .toList();
  }
}
