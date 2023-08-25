import 'package:cryptofy_app/data/datasources/home_watchlist.dart';
import 'package:cryptofy_app/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';
import 'package:cryptofy_app/presentation/blocs/watchlist_bloc/watchlist_state.dart';
import 'package:cryptofy_app/presentation/widgets/coin_watchlist_subcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class WatchListPage extends StatelessWidget {
  const WatchListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,##0.00', 'en_US');
    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, state) {
        if (state is WatchlistSuccessState) {
          final coinItems = state.watchList;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            itemBuilder: (context, index) {
              final coin = coinItems[index];
              return CoinWatchListSubCard(
                rank: coinItems[index].marketCapRank.toString(),
                logoUrl: coinItems[index].image,
                coinSymbol: coinItems[index].symbol.toUpperCase(),
                coinName: coinItems[index].name,
                coinPrice: numberFormat.format(coinItems[index]
                    .currentPrice), // Apply number formatting here
                coinVariation: coinItems[index].priceChangePercentage24h,
                coin: coin,
              );
            },
            
            itemCount: watchList.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
