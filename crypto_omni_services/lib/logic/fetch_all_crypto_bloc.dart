import 'package:crypto_omni_services/domain/models/crypto_model.dart';
import 'package:equatable/equatable.dart';
import 'package:crypto_omni_services/repository/api_data_source.dart';
import 'package:crypto_omni_services/utills/custom_features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class FetchAllCryptoBloc extends Bloc<FetchAllCryptoEvent, FetchAllCryptoStates> {
  FetchAllCryptoBloc()
      : super(
          FetchAllCryptoStates(),
        ) {
    on<FetchAllCryptoEvent>(
      (event, emit) async {
        try {
          return emit(
            FetchAllCryptoStates(
              cryptoCurrencies: await ApiDataSource.fetchCryptos(),
            ),
          );
        } catch (e) {
          return CustomLogs.logCustomLogs(
            e.toString(),
            Level.error,
            null,
          );
        }
      },
    );
  }
}

class FetchAllCryptoEvent {}

class FetchAllCryptoStates extends Equatable {
  final List<CryptoCurrency>? cryptoCurrencies;

  FetchAllCryptoStates({
    this.cryptoCurrencies,
  });

  @override
  List<Object?> get props => [
        cryptoCurrencies,
      ];
}
