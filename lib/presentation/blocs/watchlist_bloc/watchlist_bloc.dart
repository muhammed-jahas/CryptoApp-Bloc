import 'dart:async';
import 'package:cryptofy_app/data/datasources/home_watchlist.dart';
import 'package:cryptofy_app/presentation/blocs/watchlist_bloc/watchlist_event.dart';
import 'package:cryptofy_app/presentation/blocs/watchlist_bloc/watchlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc() : super(WatchlistInitialState()) {
    on<WatchListInitialEvent>(watchlistInitialState);
    on<WatchListAddEvent>(watchListAddEvent);
    on<WatchListRemoveEvent>(watchListRemoveEvent);
  }

  FutureOr<void> watchlistInitialState(
      WatchlistEvent event, Emitter<WatchlistState> emit) {
    emit(WatchlistSuccessState(watchList: watchList));
  }

  FutureOr<void> watchListAddEvent(
      WatchListAddEvent event, Emitter<WatchlistState> emit) {
    emit(WatchlistSuccessState(watchList: event.watchList));
  }

  FutureOr<void> watchListRemoveEvent(
      WatchListRemoveEvent event, Emitter<WatchlistState> emit) {
    event.watchList.remove(event.coin);
    emit(WatchlistSuccessState(watchList: event.watchList));
  }
}