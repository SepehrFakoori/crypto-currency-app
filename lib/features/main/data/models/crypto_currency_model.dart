import 'package:test_flutter_application/features/main/domain/entities/crypto_currency_entitty.dart';

class CryptoCurrencyModel extends CryptoCurrencyEntity {
  CryptoCurrencyModel({
    required super.fullName,
    required super.name,
    required super.price,
    required super.changePCT24Hour,
    required super.imageUrl,
  });

  factory CryptoCurrencyModel.fromMapJson(Map<String, dynamic> jsonObject) {
    return CryptoCurrencyModel(
      fullName: jsonObject['CoinInfo']['FullName'],
      name: jsonObject['CoinInfo']['Name'],
      price: jsonObject['DISPLAY']['USD']['PRICE'],
      changePCT24Hour: jsonObject['RAW']['USD']['CHANGEPCT24HOUR'],
      imageUrl: jsonObject['CoinInfo']['ImageUrl'],
    );
  }
}
