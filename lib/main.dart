import 'package:cryptofy_app/presentation/blocs/home_bloc/crypto_bloc.dart';
import 'package:cryptofy_app/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';
import 'package:cryptofy_app/presentation/constants/color_styles/colors.dart';
import 'package:cryptofy_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(CryptofyApp());
}

class CryptofyApp extends StatelessWidget {
  const CryptofyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CryptoBloc(),
          ),
          BlocProvider(create: (context) => WatchlistBloc()),
        ],
        child: const HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        progressIndicatorTheme: ProgressIndicatorThemeData(
            color: CustomColors.primaryColor.shade100,
            circularTrackColor: CustomColors.primaryColor),
        brightness: Brightness.dark, // Use the dark theme
        fontFamily: 'outfit', // Set your custom font here
        primaryColor: CustomColors.primaryColor,
        primaryColorDark: CustomColors.primaryColor,
        primaryColorLight: CustomColors.primaryColor,
        hintColor: CustomColors.primaryColor,
        scaffoldBackgroundColor: bgPrimary,
      ),
    );
  }
}
