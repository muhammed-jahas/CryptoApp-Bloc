import 'package:cryptofy_app/domain/models/coin_data_model.dart';

abstract class CryptoState {}

class CryptoInitialState extends CryptoState {}

class LoadingState extends CryptoState {}

class CryptoFetchSuccessState extends CryptoState {
  final List<CoinDataModel> coinList;
  CryptoFetchSuccessState({required this.coinList});
}

class CryptoErrorState extends CryptoState {}

class CryptoNetworkErrorState extends CryptoState {
  
}
