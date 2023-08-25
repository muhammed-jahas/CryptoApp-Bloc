import 'package:cryptofy_app/domain/models/coin_data_model.dart';

abstract class WatchlistState {}

final class WatchlistInitialState extends WatchlistState {}

final class WatchlistSuccessState extends WatchlistState {
  List<CoinDataModel> watchList;
  WatchlistSuccessState({required this.watchList});
}