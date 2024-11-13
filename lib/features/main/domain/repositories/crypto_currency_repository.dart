import 'package:test_flutter_application/features/main/domain/entities/crypto_currency_entitty.dart';

abstract class ICryptoCurrencyRepository {
  Future<List<CryptoCurrencyEntity>> getCryptoCurrencies();
}
