import 'package:cryptofy_app/presentation/blocs/home_bloc/crypto_bloc.dart';
import 'package:cryptofy_app/presentation/blocs/home_bloc/crypto_state.dart';
import 'package:cryptofy_app/presentation/widgets/coin_main_card.dart';
import 'package:cryptofy_app/presentation/widgets/coin_sub_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CoinScreen extends StatelessWidget {
  const CoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,##0.00', 'en_US');
    return BlocBuilder<CryptoBloc, CryptoState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CryptoFetchSuccessState) {
          final coinItems = state.coinList;
          final leadingCoin = coinItems[0];
          final modifiedList = coinItems.sublist(1);
          return ListView(
            shrinkWrap: true,
            
            children: [
              CoinMainCard(
                  rank: leadingCoin.marketCapRank.toString(),
                  logoUrl: leadingCoin.image,
                  coinName: leadingCoin.name,
                  coinSymbol: leadingCoin.symbol,
                  coinPrice: numberFormat.format(leadingCoin.currentPrice),
                  coinVariation: leadingCoin.priceChangePercentage24h,
                  coinHighestPrice: numberFormat.format(leadingCoin.high24h),
                  coinLowestPrice: numberFormat.format(leadingCoin.low24h),
                  coin: leadingCoin),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: coinItems.length,
                
                itemBuilder: (context, index) {
                    final coin = modifiedList[index];
                    return CoinSubCard(
                      rank: modifiedList[index].marketCapRank.toString(),
                      logoUrl: modifiedList[index].image,
                      coinSymbol: modifiedList[index].symbol.toUpperCase(),
                      coinName: modifiedList[index].name,
                      coinPrice: numberFormat.format(modifiedList[index]
                          .currentPrice), // Apply number formatting here
                      coinVariation: modifiedList[index].priceChangePercentage24h,
                      coin: coin,
                    );
                  
                },
              ),
            ],
          );
        } else if (state is CryptoErrorState) {
          return Center(
            child: Text('Something Went wrong'),
          );
        } else if(state is CryptoNetworkErrorState){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wifi_off_outlined,size: 50,),
                SizedBox(
                  height: 20,
                ),
                Text('No internet Connection', style: TextStyle(fontSize: 18,),)
              ],
            ),
          );
        }
        else {
          return Container(
            height: 200,
            color: Colors.amber,
          );
        }
      },
    );
  }
}
