import 'package:dio/dio.dart';
import 'package:test_flutter_application/core/constants/constants.dart';
import 'package:test_flutter_application/core/di/di.dart';
import 'package:test_flutter_application/features/main/data/models/crypto_currency_model.dart';

abstract class ICryptoCurrencyDataSource {
  Future<List<CryptoCurrencyModel>> getCryptoCurrencies();
}

class CryptoCurrencyRemoteDataSource implements ICryptoCurrencyDataSource {
  final Dio _dio = locator.get();

  @override
  Future<List<CryptoCurrencyModel>> getCryptoCurrencies() async {
    try {
      Map<String, dynamic> qParams = {
        'limit': '10',
        'tsym': 'USD',
        'api_key': Constants.apiKey,
      };
      var response = await _dio.get(
        '${Constants.baseUrl}/data/top/totalvolfull',
        queryParameters: qParams,
      );
      var result = response.data;
      return result['Data']
          .map<CryptoCurrencyModel>(
            (jsonObject) => CryptoCurrencyModel.fromMapJson(jsonObject),
      )
          .toList();
    } on DioException catch (ex) {
      throw Exception(ex);
    } catch (er) {
      throw Exception(er);
    }
  }
}
