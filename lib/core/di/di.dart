import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_flutter_application/features/main/data/datasources/crypto_currency_data_source.dart';
import 'package:test_flutter_application/features/main/data/repositories/crypto_currency_repository_impl.dart';
import 'package:test_flutter_application/features/main/domain/repositories/crypto_currency_repository.dart';
import 'package:test_flutter_application/features/main/domain/usecases/crypto_currency_usecase.dart';
import 'package:test_flutter_application/features/main/presentation/bloc/main_bloc.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton<ICryptoCurrencyDataSource>(
      () => CryptoCurrencyRemoteDataSource());
  locator.registerLazySingleton<ICryptoCurrencyRepository>(
      () => CryptoCurrencyRepositoryImpl(locator()));
  locator.registerLazySingleton(() => GetCryptoCurrenciesUseCase(locator()));
  locator.registerFactory(() => MainBloc(locator()));
}
