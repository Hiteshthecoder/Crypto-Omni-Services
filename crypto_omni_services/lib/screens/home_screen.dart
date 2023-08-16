import 'package:crypto_omni_services/logic/bottom_navbar_cubit.dart';
import 'package:crypto_omni_services/logic/fetch_all_crypto_bloc.dart';
import 'package:crypto_omni_services/utills/custom_features.dart';
import 'package:crypto_omni_services/widgets/home_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: CustomLogs.customAppBar(
        context,
      ),
      bottomNavigationBar: BlocProvider<BottomNavbarCubit>(
        lazy: false,
        create: (bottomNavbarContext) => BottomNavbarCubit(),
        child: CustomBottomNavbar(),
      ),
      body: CustomContainer(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              HexColor("#007AF4").withOpacity(0.4),
              HexColor("#E8F5FF").withOpacity(0.2),
            ],
            begin: Alignment.center,
            end: Alignment.bottomRight,
          ),
        ),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: [
            UserWalletDetails(),
            HomeScreenTabs(
              tabController: tabController,
            ),
            HomeScreenTabViews(
              cryptos: BlocProvider.of<FetchAllCryptoBloc>(context).state.cryptoCurrencies,
              tabController: tabController,
            ),
          ],
        ),
      ),
    );
  }
}
