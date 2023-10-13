import 'dart:async';

import 'package:alfred_interview/domain/common/interval_emitter.dart';
import 'package:alfred_interview/domain/cryptocurrency/get_bitcoin_price_index_usecase.dart';
import 'package:alfred_interview/ui/cryptocurrency/list/bpi_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class BPIListCubit extends Cubit<BPIListState> {
  final GetBitcoinPriceIndexUseCase useCase =
      GetIt.I<GetBitcoinPriceIndexUseCase>();
  final IntervalEmitter intervalEmitter = GetIt.I<IntervalEmitter>();

  late final StreamSubscription _intervalBPISubscription;

  BPIListCubit() : super(const BPIListState()) {
    _intervalBPISubscription = intervalEmitter
        .stream(const Duration(seconds: 5))
        .asyncMap((_) async => await getData())
        .listen((_) {},
            onError: (err, stacktrace) => emit(
                  state.copyWith(
                    errorMessage: 'An error occurred while fetching data',
                    isLoading: false,
                  ),
                ));
  }

  Future<void> getData() async {
    try {
      final response = await useCase.execute();
      response.fold(
        (failure) => emit(state.copyWith(
          errorMessage: failure.message,
          isLoading: false,
        )),
        (bpi) => emit(state.fromBPI(bpi).copyWith(
              isLoading: false,
              errorMessage: null,
            )),
      );
    } on Error catch (_) {
      emit(state.copyWith(errorMessage: 'Couldn\'t fetch the data'));
    }
  }

  @override
  Future<void> close() async {
    await _intervalBPISubscription.cancel();
    return super.close();
  }
}
