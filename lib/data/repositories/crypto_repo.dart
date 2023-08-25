import 'package:cryptofy_app/data/datasources/crypto_api.dart';
import 'package:http/http.dart' as http;

class CryptoRepo {
  Future<http.Response> getCrypto () async {
    return await CryptoApi().getCryptocurrency();

  }
}