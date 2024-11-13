import 'package:dartz/dartz.dart';
import 'package:test_flutter_application/features/main/domain/entities/crypto_currency_entitty.dart';

abstract class MainState {}

class MainInitState extends MainState {}

class MainLoadingState extends MainState {}

class MainResponseState extends MainState {
  final Either<String, List<CryptoCurrencyEntity>> cryptoCurrenciesResponse;

  MainResponseState(
    this.cryptoCurrenciesResponse,
  );
}
