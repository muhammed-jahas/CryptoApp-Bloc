
import 'package:cryptofy_app/data/datasources/home_watchlist.dart';
import 'package:cryptofy_app/domain/models/coin_data_model.dart';
import 'package:cryptofy_app/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';
import 'package:cryptofy_app/presentation/blocs/watchlist_bloc/watchlist_event.dart';
import 'package:cryptofy_app/presentation/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CoinSubCard extends StatelessWidget {
  String rank;
  String logoUrl;
  String coinName;
  String coinSymbol;
  String coinPrice;
  double coinVariation;
  final CoinDataModel coin;

  CoinSubCard({
    required this.rank,
    required this.logoUrl,
    required this.coinName,
    required this.coinSymbol,
    required this.coinPrice,
    required this.coinVariation,
    required this.coin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    bool isVariationNegative = coinVariation < 0;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.withOpacity(0.2),Colors.grey.withOpacity(0.0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.white.withOpacity(0.1),width: 1)
         
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            '#${rank}',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          Text(
                            'Rank',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image(
                        image: NetworkImage(
                            logoUrl),
                        height: 35,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            coinName,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          Text(
                            coinSymbol,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          if(!watchList.contains(coin)){
                        watchList.add(coin);
                         context
                        .read<WatchlistBloc>()
                        .add(WatchListAddEvent(watchList: watchList));
                        await  showSnackbar(context, 'Coin has been added to Watchlist');
                    }else{
                     
                      await  showSnackbar(context, 'Already added to Watchlist');
                    }
                        },
                        child: Icon(
                          Icons.star_border_rounded,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                      '₹ ${coinPrice}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last 24H',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            isVariationNegative
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            size: 25,
                            color: isVariationNegative
                                ? Colors.red.shade500
                                : Colors.green.shade500,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${coinVariation.toStringAsFixed(2).replaceAll('-', '')}%',
                            style: TextStyle(
                              fontSize: 16,
                              color: isVariationNegative
                                  ? Colors.red.shade500
                                  : Colors.green.shade500,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
             
              
              
            ],
          ),
        ),
      ),
    );
  }
}