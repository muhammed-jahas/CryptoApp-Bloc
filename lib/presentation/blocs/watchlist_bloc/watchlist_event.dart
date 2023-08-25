import 'package:cryptofy_app/domain/models/coin_data_model.dart';

abstract class WatchlistEvent {}

class WatchListInitialEvent extends WatchlistEvent {}

class WatchListAddEvent extends WatchlistEvent {
  List<CoinDataModel> watchList;
  WatchListAddEvent({required this.watchList});
}

class WatchListRemoveEvent extends WatchlistEvent {
  List<CoinDataModel> watchList;
  final CoinDataModel coin;
  WatchListRemoveEvent({required this.watchList,required this.coin});
}