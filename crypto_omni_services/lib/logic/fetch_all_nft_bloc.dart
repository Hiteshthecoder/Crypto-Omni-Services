import 'package:crypto_omni_services/domain/models/nft_model.dart';
import 'package:equatable/equatable.dart';
import 'package:crypto_omni_services/repository/api_data_source.dart';
import 'package:crypto_omni_services/utills/custom_features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class FetchAllNftBloc extends Bloc<FetchAllNftEvent, FetchAllNftState> {
  FetchAllNftBloc()
      : super(
          FetchAllNftState(),
        ) {
    on<FetchAllNftEvent>(
      (event, emit) async {
        try {
          emit(
            FetchAllNftState(
              nfts: await ApiDataSource.fetchNFTs(limit: 10),
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

class FetchAllNftEvent {}

class FetchAllNftState extends Equatable {
  final List<NftModel>? nfts;
  FetchAllNftState({
    this.nfts,
  });

  @override
  List<Object?> get props => [
        nfts,
      ];
}
