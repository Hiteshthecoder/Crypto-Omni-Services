import 'package:crypto_omni_services/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {}

class CryptoOmniApp extends StatelessWidget {
  const CryptoOmniApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
