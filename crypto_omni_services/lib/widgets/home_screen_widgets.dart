import 'package:crypto_omni_services/domain/models/crypto_model.dart';
import 'package:crypto_omni_services/domain/models/nft_model.dart';
import 'package:crypto_omni_services/logic/fetch_all_crypto_bloc.dart';
import 'package:crypto_omni_services/logic/fetch_all_nft_bloc.dart';
import 'package:crypto_omni_services/utills/custom_features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreenTabViews extends StatelessWidget {
  final TabController? tabController;
  final List<CryptoCurrency>? cryptos;
  const HomeScreenTabViews({
    super.key,
    this.tabController,
    this.cryptos,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: [
          CustomContainer(
            width: double.maxFinite,
            height: double.maxFinite,
            alignment: Alignment.center,
            child: BlocBuilder<FetchAllCryptoBloc, FetchAllCryptoStates>(
              buildWhen: (previous, current) =>
                  previous.cryptoCurrencies?.sublist(0, 5).last !=
                  current.cryptoCurrencies
                      ?.sublist(
                        0,
                        5,
                      )
                      .last,
              builder: (cryptoTokenContext, state) {
                if (state.cryptoCurrencies?.isEmpty == true) {
                  return CircularProgressIndicator();
                } else if (state.cryptoCurrencies?.isNotEmpty == true) {
                  return HomeScreenTokensView(
                    cryptos: state.cryptoCurrencies,
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
          CustomContainer(
            width: double.maxFinite,
            alignment: Alignment.center,
            height: double.maxFinite,
            child: BlocBuilder<FetchAllNftBloc, FetchAllNftState>(
              builder: (nftContext, state) {
                if (state.nfts?.isEmpty == true) {
                  return CircularProgressIndicator();
                } else if (state.nfts?.isNotEmpty == true) {
                  return HomeScreenNftView(
                    nfts: state.nfts!.sublist(0, 10),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreenNftView extends StatelessWidget {
  final List<NftModel>? nfts;
  const HomeScreenNftView({super.key, this.nfts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: nfts?.length,
      itemBuilder: (context, index) => CustomContainer(
        width: CustomLogs.getCustomWidth(context, 40),
        height: CustomLogs.getCustomHeight(context, 8),
        margin: EdgeInsets.symmetric(
          vertical: CustomLogs.getCustomHeight(
            context,
            0.4,
          ),
          horizontal: CustomLogs.getCustomWidth(
            context,
            2,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              nfts![index].imageUrl!,
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreenTokensView extends StatelessWidget {
  final List<CryptoCurrency>? cryptos;
  const HomeScreenTokensView({
    super.key,
    this.cryptos,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: cryptos!
          .sublist(0, 15)
          .map(
            (crypto) => CryptoListTile(
              cryptoTitle: crypto.name,
              cryptoAlias: crypto.symbol,
            ),
          )
          .toList(),
    );
  }
}

class HomeScreenTabs extends StatelessWidget {
  final TabController? tabController;
  const HomeScreenTabs({
    super.key,
    this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.white,
      controller: tabController,
      tabs: [
        Tab(
          child: CustomTextWidget(
            string: "Tokens",
          ),
        ),
        Tab(
          child: CustomTextWidget(
            string: "NFTs",
          ),
        ),
      ],
    );
  }
}

class CryptoListTile extends StatelessWidget {
  final String? cryptoTitle;
  final String? cryptoAlias;

  const CryptoListTile({
    super.key,
    this.cryptoTitle,
    this.cryptoAlias,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomTextWidget(
        string: cryptoTitle ?? "Bitcoin",
        fontSize: 16,
      ),
      subtitle: CustomTextWidget(
        string: cryptoAlias ?? "BTC",
      ),
    );
  }
}

class HomeScreenAppFeatured extends StatelessWidget {
  HomeScreenAppFeatured({super.key});
  final List<Map<String, dynamic>> appFeatures = [
    {
      "feature": "Send",
      "icon": FilledButton(
        onPressed: () {},
        child: Icon(
          Icons.file_upload_outlined,
        ),
      ),
    },
    {
      "feature": "Deposit",
      "icon": FilledButton(
        onPressed: () {},
        child: Icon(
          Icons.file_download_outlined,
        ),
      ),
    },
    {
      "feature": "Swap",
      "icon": FilledButton(
        onPressed: () {},
        child: Icon(
          Icons.drive_file_move_rtl_outlined,
        ),
      ),
    },
    {
      "feature": "Buy",
      "icon": FilledButton(
        onPressed: () {},
        child: Icon(
          Icons.wallet_rounded,
        ),
      ),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: appFeatures
          .map(
            (feature) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: CustomLogs.getCustomWidth(
                  context,
                  2,
                ),
                vertical: CustomLogs.getCustomHeight(
                  context,
                  1.1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  feature["icon"],
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: CustomLogs.getCustomHeight(
                        context,
                        0.2,
                      ),
                      vertical: CustomLogs.getCustomWidth(
                        context,
                        1.8,
                      ),
                    ),
                    child: CustomTextWidget(
                      string: feature["feature"],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class UserWalletDetails extends StatelessWidget {
  const UserWalletDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: double.maxFinite,
      height: CustomLogs.getCustomHeight(
        context,
        40,
      ),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        gradient: LinearGradient(
          colors: [
            HexColor("#FD6AE1"),
            HexColor("007AF4").withOpacity(0.8),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextWidget(
            string: 'MetaMask',
            fontSize: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: CustomLogs.getCustomHeight(
                context,
                0.4,
              ),
            ),
            child: UserWalletBalanceWidget(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: CustomLogs.getCustomHeight(
                context,
                0.3,
              ),
            ),
            child: UserWalletAddressWidget(),
          ),
          HomeScreenAppFeatured(),
        ],
      ),
    );
  }
}

class UserWalletBalanceWidget extends StatelessWidget {
  const UserWalletBalanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextWidget(
      string: "\$856,000",
      letterSpacing: 3,
      fontWeight: FontWeight.w800,
      fontSize: 32,
    );
  }
}

class UserWalletAddressWidget extends StatelessWidget {
  const UserWalletAddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: EdgeInsets.symmetric(
        horizontal: CustomLogs.getCustomWidth(
          context,
          6,
        ),
      ),
      label: CustomTextWidget(
        string: "0x9069...f680",
        textColor: Colors.black,
        fontSize: 10,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }
}
