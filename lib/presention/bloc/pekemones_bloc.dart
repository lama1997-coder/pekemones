
import 'package:bloc/bloc.dart';
import 'package:peko_application/domin/usecacess/get_pekemons.dart';
import 'package:peko_application/presention/bloc/pekemones_event.dart';

import 'pekemons_state.dart';

class PekemonesBloc extends Bloc<PekemonesEvent, PekemonesState> {
  final GetPekemoens _getPekemones;

  PekemonesBloc(this._getPekemones) : super(PekemonesEmpty()) {
    on<OnReloadChanged>((event, emit) async {

      emit(PekemonesLoading());

      final result = await _getPekemones.homePageData();
      result.fold(
        (failure) {
          emit(PekemonesError(failure.message));
        },
        (data) {
          emit(PekemonesHasData(data));
        },
      );
    });
  }
}