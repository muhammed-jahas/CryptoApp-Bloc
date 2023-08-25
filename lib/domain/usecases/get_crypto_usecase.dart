import 'dart:convert';
import 'dart:io';
import 'package:cryptofy_app/data/repositories/crypto_repo.dart';
import 'package:cryptofy_app/domain/models/coin_data_model.dart';
import 'package:cryptofy_app/presentation/blocs/home_bloc/crypto_state.dart';
import 'package:http/http.dart' as http;

class GetCryptoUseCase {
  Future<CryptoState> getCryptoList() async {
    List<CoinDataModel> coinList=[];
    CryptoState state;
    final http.Response response;
    try {
      response = await CryptoRepo().getCrypto();
      final list = jsonDecode(response.body) as List;
      coinList = list.map((e) => CoinDataModel.fromJson(e)).toList();
      response.statusCode==200 ? state = CryptoFetchSuccessState(coinList: coinList)
      : state = CryptoErrorState();
    }
    on SocketException {
      state = CryptoNetworkErrorState();
    } 
    catch (e){
      state = CryptoErrorState();
    }
    return state;
  }
}