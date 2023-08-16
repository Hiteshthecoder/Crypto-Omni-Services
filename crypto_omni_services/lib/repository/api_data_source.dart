import 'package:crypto_omni_services/domain/models/crypto_model.dart';
import 'package:crypto_omni_services/domain/models/nft_model.dart';
import 'package:crypto_omni_services/utills/custom_features.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiDataSource {
  static Future<List<CryptoCurrency>>? fetchCryptos() async {
    try {
      String? apiResponse = await http.get(
        Uri.parse(
          "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest",
        ),
        headers: {
          "X-CMC_PRO_API_KEY": "f5e2bf8e-3e9f-4416-84ad-3fdebc9b9450",
        },
      ).then(
        (cryptos) => cryptos.body,
      );
      return CryptoModel.fromJson(apiResponse!).data!;
    } catch (e) {
      return CustomLogs.logCustomLogs(
        e.toString(),
        Level.error,
        null,
      );
    }
  }

  static Future<List<NftModel>> fetchNFTs({required int limit}) async {
    try {
      String? apiResponse = await http.get(
        Uri.parse(
          "https://api.opensea.io/v2/collection/${CustomLogs.getNftCollections()[CustomLogs.getNftRandom()]}/nfts?limit=$limit",
        ),
        headers: {
          "X-API-KEY": "2d4d66b1d6cf424e893d91558dec229c",
        },
      ).then(
        (value) => value.body,
      );
      return NftListModel.fromJson(apiResponse ?? "").nfts!;
    } catch (e) {
      return CustomLogs.logCustomLogs(
        e.toString(),
        Level.error,
        null,
      );
    }
  }
}
