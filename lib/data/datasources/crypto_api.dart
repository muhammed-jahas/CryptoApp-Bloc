import 'package:cryptofy_app/data/datasources/crypto_api_endpoints.dart';
import 'package:http/http.dart' as http;

class CryptoApi {
  Future<http.Response> getCryptocurrency() async {
    final response = await http.get(Uri.parse(ApiEndPoints.coinMarket));
    return response;
  }
}
