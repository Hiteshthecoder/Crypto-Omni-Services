import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavbarCubit extends Cubit<BottomNavbarStates> {
  BottomNavbarCubit()
      : super(
          BottomNavbarStates(
            currIndex: 0,
          ),
        );

  void changeCurrIndex(int currIndex) {
    return emit(
      BottomNavbarStates(
        currIndex: currIndex,
      ),
    );
  }
}

class BottomNavbarStates extends Equatable {
  final int? currIndex;
  BottomNavbarStates({
    this.currIndex = 0,
  });

  @override
  List<Object?> get props => [
        currIndex,
      ];
}
