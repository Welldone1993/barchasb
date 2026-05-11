import 'package:fpdart/fpdart.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/ad_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<AdEntity>>> getSellers() async =>
      _repoCall(remoteDataSource.getSellers);

  @override
  Future<Either<Failure, List<AdEntity>>> getEmployers() async =>
      _repoCall(remoteDataSource.getEmployers);

  @override
  Future<Either<Failure, List<AdEntity>>> getJobSeekers() async =>
      _repoCall(remoteDataSource.getJobSeekers);

  // یک تابع کمکی برای کاهش تکرار کد
  Future<Either<Failure, List<AdEntity>>> _repoCall(
    Future<List<AdEntity>> Function() call,
  ) async {
    try {
      final result = await call();
      return right(result);
    } on DioException catch (e) {
      return left(Failure(e.message ?? 'An unknown error occurred.'));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
