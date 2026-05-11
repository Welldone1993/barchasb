import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/datasources/home_remote_datasource.dart'; // مسیر را در صورت نیاز اصلاح کنید
// ایمپورت Provider مربوط به Repository
import '../../data/repositories/home_repository_impl.dart'; // مسیر را در صورت نیاز اصلاح کنید
// ایمپورت‌های مربوط به لایه Domain
import '../../domain/entities/ad_entity.dart';
import '../../domain/repositories/home_repository.dart';


//==============> Providers <==============
// این Providerها باید در یک فایل جداگانه مثلاً providers.dart یا service_locator.dart باشند
// اما برای سادگی اینجا قرار داده شده‌اند.

final dioProvider = Provider((ref) => Dio()); // فرض می‌کنیم Dio Provider وجود دارد

final homeRemoteDataSourceProvider = Provider<HomeRemoteDataSource>(
        (ref) => HomeRemoteDataSourceImpl(ref.watch(dioProvider)));

final homeRepositoryProvider = Provider<HomeRepository>(
        (ref) => HomeRepositoryImpl(ref.watch(homeRemoteDataSourceProvider)));
//<============== End of Providers ==============>


// نکته: در معماری Clean، لایه Presentation (یعنی اینجا) باید با Entity کار کند نه Model.
// بنابراین State را برای کار با AdEntity تغییر می‌دهیم.
class HomeState {
  final AsyncValue<List<AdEntity>> sellers;
  final AsyncValue<List<AdEntity>> employers;
  final AsyncValue<List<AdEntity>> jobSeekers;

  HomeState({
    this.sellers = const AsyncValue.loading(),
    this.employers = const AsyncValue.loading(),
    this.jobSeekers = const AsyncValue.loading(),
  });

  HomeState copyWith({
    AsyncValue<List<AdEntity>>? sellers,
    AsyncValue<List<AdEntity>>? employers,
    AsyncValue<List<AdEntity>>? jobSeekers,
  }) {
    return HomeState(
      sellers: sellers ?? this.sellers,
      employers: employers ?? this.employers,
      jobSeekers: jobSeekers ?? this.jobSeekers,
    );
  }
}

class HomeNotifier extends StateNotifier<HomeState> {
  final HomeRepository _homeRepository;

  HomeNotifier(this._homeRepository) : super(HomeState()) {
    // در زمان ساخت Notifier، همه داده‌ها را فراخوانی می‌کنیم
    fetchAll();
  }

  Future<void> fetchAll() async {
    // هر سه لیست را به صورت همزمان فراخوانی می‌کنیم تا سرعت لود اولیه بالا برود
    await Future.wait([
      fetchSellers(),
      fetchEmployers(),
      fetchJobSeekers(),
    ]);
  }

  Future<void> fetchSellers() async {
    state = state.copyWith(sellers: const AsyncValue.loading());
    final result = await _homeRepository.getSellers();

    // متد .fold از پکیج fpdart/dartz به ما اجازه می‌دهد دو حالت موفقیت (Right) و خطا (Left) را مدیریت کنیم
    result.fold(
          (failure) => state =
          state.copyWith(sellers: AsyncValue.error(failure.message, StackTrace.current)),
          (data) => state = state.copyWith(sellers: AsyncValue.data(data)),
    );
  }

  Future<void> fetchEmployers() async {
    state = state.copyWith(employers: const AsyncValue.loading());

    // برای تست حالت خطا، یک خطای تصادفی شبیه‌سازی می‌کنیم
    if (Random().nextBool()) {
      await Future.delayed(const Duration(seconds: 1));
      state = state.copyWith(employers: AsyncValue.error("خطای تستی در دریافت کارفرمایان!", StackTrace.current));
      return;
    }

    final result = await _homeRepository.getEmployers();
    result.fold(
          (failure) => state =
          state.copyWith(employers: AsyncValue.error(failure.message, StackTrace.current)),
          (data) => state = state.copyWith(employers: AsyncValue.data(data)),
    );
  }

  Future<void> fetchJobSeekers() async {
    state = state.copyWith(jobSeekers: const AsyncValue.loading());
    final result = await _homeRepository.getJobSeekers();
    result.fold(
          (failure) => state =
          state.copyWith(jobSeekers: AsyncValue.error(failure.message, StackTrace.current)),
          (data) => state = state.copyWith(jobSeekers: AsyncValue.data(data)),
    );
  }
}


final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  // اینجا ما Repository را به Notifier خود تزریق می‌کنیم
  final homeRepository = ref.watch(homeRepositoryProvider);
  return HomeNotifier(homeRepository);
});
