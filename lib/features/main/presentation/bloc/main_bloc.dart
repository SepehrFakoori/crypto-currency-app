import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_application/features/main/domain/usecases/crypto_currency_usecase.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final GetCryptoCurrenciesUseCase getCryptoCurrenciesUseCase;

  MainBloc(this.getCryptoCurrenciesUseCase) : super(MainInitState()) {
    on<MainInitializeEvent>((event, emit) async {
      emit(MainLoadingState());
      final result = await getCryptoCurrenciesUseCase();
      result.fold(
        (failure) => emit(MainResponseState(const Left('Error fetching data'))),
        (cryptoCurrencies) => emit(MainResponseState(Right(cryptoCurrencies))),
      );
    });
  }
}
