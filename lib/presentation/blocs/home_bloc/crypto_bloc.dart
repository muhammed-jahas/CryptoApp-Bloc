import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cryptofy_app/domain/usecases/get_crypto_usecase.dart';
import 'package:cryptofy_app/presentation/blocs/home_bloc/crypto_event.dart';
import 'package:cryptofy_app/presentation/blocs/home_bloc/crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc() : super(CryptoInitialState()) {
    on<InitialEvent>(loadingEvent);
  }

  FutureOr<void> loadingEvent(
      InitialEvent event, Emitter<CryptoState> emit) async {
    emit(LoadingState());
    final status = await GetCryptoUseCase().getCryptoList();
    if (status is CryptoFetchSuccessState) {
      emit(CryptoFetchSuccessState(coinList: status.coinList));
    } else if (status is CryptoErrorState) {
      emit(CryptoErrorState());
    } else if(status is CryptoNetworkErrorState){
      emit(CryptoNetworkErrorState());
    }
  }
}
