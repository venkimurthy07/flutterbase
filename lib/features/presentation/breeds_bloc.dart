import 'package:flutter/cupertino.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/usecase/usecase.dart';
import 'package:flutter_app/core/utils/utils.dart';
import 'package:flutter_app/features/domain/usecase/get_breeds_usecase.dart';
import 'package:flutter_app/features/presentation/BreedsEvent.dart';
import 'package:flutter_app/features/presentation/BreedsState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedsBloc extends Bloc<BreedsEvent, BreedsState> {
  final GetBreedsUseCase getBreedsUseCase;

  BreedsBloc({@required GetBreedsUseCase getBreedsUseCase})
      : assert(getBreedsUseCase != null),
        getBreedsUseCase = getBreedsUseCase,
        super(LoginInitial());

  @override
  Stream<BreedsState> mapEventToState(BreedsEvent event) async* {
    if (event is BreedEvent) {
      yield LoadingState();
      final useCase = await getBreedsUseCase.call(NoParams());
      print("in the bloc");
      yield* useCase.fold((failure) async* {
        if (failure is NetworkFailure) {
          yield ErrorState(message: Utils.ERROR_NO_INTERNET);
        } else if (failure is ServerFailure) {
          yield ErrorState(message: failure.message);
        } else {
          yield ErrorState(message: "Error occurred");
        }
      }, (loadedDataEntity) async* {
        print("im in the login bloc ");
        print(loadedDataEntity);
        yield LoadedState(breedsInformationEntity: loadedDataEntity);
      });
    }
  }
}
