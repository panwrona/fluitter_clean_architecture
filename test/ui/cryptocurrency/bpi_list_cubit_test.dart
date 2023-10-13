import 'dart:async';

import 'package:alfred_interview/domain/common/interval_emitter.dart';
import 'package:alfred_interview/domain/cryptocurrency/get_bitcoin_price_index_usecase.dart';
import 'package:alfred_interview/ui/cryptocurrency/list/bpi_list_cubit.dart';
import 'package:alfred_interview/ui/cryptocurrency/list/bpi_list_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../common/test_data.dart';
import '../../common/test_mocks.dart';

final usdCurrencyRateChange = CurrencyRateChange(current: usd.toDomain());
final eurCurrencyRateChange = CurrencyRateChange(current: eur.toDomain());
final gbpCurrencyRateChange = CurrencyRateChange(current: gbp.toDomain());
final successState = BPIListState(
  isLoading: false,
  usd: usdCurrencyRateChange,
  eur: eurCurrencyRateChange,
  gbp: gbpCurrencyRateChange,
);
const failedState = BPIListState(
  isLoading: false,
  errorMessage: failedMessage,
);

void main() {
  setUp(() async {
    await registerMocks();
  });

  final streamController = StreamController.broadcast();

  group('BPIListCubit', () {
    blocTest(
      'Emits successful state when useCase executes successfully ',
      setUp: () async {
        when(GetIt.I<GetBitcoinPriceIndexUseCase>().execute())
            .thenAnswer((_) async => successfulResponse);
        when(GetIt.I<IntervalEmitter>().stream(const Duration(seconds: 5)))
            .thenAnswer((realInvocation) => streamController.stream);
      },
      act: (bloc) => streamController.add(dynamic),
      build: () => BPIListCubit(),
      expect: () => [successState],
    );

    blocTest(
      'Emits error message when useCase returns Failure ',
      setUp: () async {
        await registerMocks();
        when(GetIt.I<GetBitcoinPriceIndexUseCase>().execute())
            .thenAnswer((_) async => failure);
        when(GetIt.I<IntervalEmitter>().stream(const Duration(seconds: 5)))
            .thenAnswer((realInvocation) => streamController.stream);
      },
      act: (bloc) => streamController.add(dynamic),
      build: () => BPIListCubit(),
      expect: () => [failedState],
    );

    blocTest(
      'Emits current and previous rates when stream emits another portion of data',
      setUp: () async {
        when(GetIt.I<GetBitcoinPriceIndexUseCase>().execute())
            .thenAnswer((_) async => successfulResponse);
        when(GetIt.I<IntervalEmitter>().stream(const Duration(seconds: 5)))
            .thenAnswer((realInvocation) => streamController.stream);
      },
      act: (bloc) => streamController
        ..add(dynamic)
        ..add(dynamic),
      build: () => BPIListCubit(),
      expect: () => [
        successState,
        successState.copyWith(
          usd: usdCurrencyRateChange.copyWith(
            previous: usd.toDomain(),
          ),
          eur: eurCurrencyRateChange.copyWith(
            previous: eur.toDomain(),
          ),
          gbp: gbpCurrencyRateChange.copyWith(
            previous: gbp.toDomain(),
          ),
        ),
      ],
    );
  });
}
