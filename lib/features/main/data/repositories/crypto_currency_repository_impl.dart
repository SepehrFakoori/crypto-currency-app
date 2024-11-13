import 'package:test_flutter_application/features/main/data/datasources/crypto_currency_data_source.dart';
import 'package:test_flutter_application/features/main/data/models/crypto_currency_model.dart';
import 'package:test_flutter_application/features/main/domain/repositories/crypto_currency_repository.dart';

class CryptoCurrencyRepositoryImpl implements ICryptoCurrencyRepository {
  final ICryptoCurrencyDataSource remoteDataSource;

  CryptoCurrencyRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CryptoCurrencyModel>> getCryptoCurrencies() async {
    return await remoteDataSource.getCryptoCurrencies();
  }
}
