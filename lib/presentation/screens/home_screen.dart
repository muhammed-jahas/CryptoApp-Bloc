import 'package:cryptofy_app/presentation/blocs/home_bloc/crypto_event.dart';
import 'package:cryptofy_app/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';
import 'package:cryptofy_app/presentation/blocs/watchlist_bloc/watchlist_event.dart';
import 'package:cryptofy_app/presentation/screens/home/sub_screen_coin/coins_screen.dart';
import 'package:cryptofy_app/presentation/screens/home/sub_screen_watchlist/watchlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/home_bloc/crypto_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<CryptoBloc>().add(InitialEvent());
    context.read<WatchlistBloc>().add(WatchListInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: Colors.blueGrey.shade800.withOpacity(.3),
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Cryptofy'),
            ),
            actions: [
              InkWell(
                onTap: () {
                  context.read<CryptoBloc>().add(InitialEvent());
                },
                child: Icon(Icons.restart_alt, size: 30,)),
              SizedBox(
                width: 20,
              ),
              Image(image: AssetImage('assets/images/gains-network-logo.png',), width: 35,),
              SizedBox(
                width: 20,
              ),
            ],
            elevation: 0,
          ),
          body: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                child: TabBar(
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                  tabs: [
                    Tab(
                      child: Text(
                        'Coins',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Watchlist',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    CoinScreen(),
                    WatchListPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
