import 'package:crypto_omni_services/logic/fetch_all_crypto_bloc.dart';
import 'package:crypto_omni_services/logic/fetch_all_nft_bloc.dart';
import 'package:crypto_omni_services/screens/home_screen.dart';
import 'package:crypto_omni_services/utills/custom_features.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(
    CryptoOmniApp(),
  );
}

class CryptoOmniApp extends StatelessWidget {
  const CryptoOmniApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      CustomLogs.appSystemUiOverlayStyle(),
    );

    return MaterialApp(
      theme: CustomLogs.appTheme(context),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<FetchAllCryptoBloc>(
            lazy: false,
            create: (cryptoTokenContext) => FetchAllCryptoBloc()
              ..add(
                FetchAllCryptoEvent(),
              ),
          ),
          BlocProvider<FetchAllNftBloc>(
            create: (nftContext) => FetchAllNftBloc()
              ..add(
                FetchAllNftEvent(),
              ),
          ),
        ],
        child: HomeScreen(),
      ),
    );
  }
}
