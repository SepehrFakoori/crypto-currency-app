import 'package:dartz/dartz.dart';
import 'package:test_flutter_application/core/errors/failurs.dart';
import 'package:test_flutter_application/features/main/domain/entities/crypto_currency_entitty.dart';
import 'package:test_flutter_application/features/main/domain/repositories/crypto_currency_repository.dart';

class GetCryptoCurrenciesUseCase {
  final ICryptoCurrencyRepository repository;

  GetCryptoCurrenciesUseCase(this.repository);

  Future<Either<Failure, List<CryptoCurrencyEntity>>> call() async {
    try {
      return Right(await repository.getCryptoCurrencies());
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}
