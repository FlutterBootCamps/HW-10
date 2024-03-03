import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(SuccessState(0)) {
    on<NavigationEvent>((event, emit) {
      int currentIndex = 0;
      emit(SuccessState(currentIndex));
    });

    on<ChangeThePageEvent>(ChangePageMethod);
  }
//change the Navigator index when there are event on tabs
  FutureOr<void> ChangePageMethod(
      ChangeThePageEvent event, Emitter<NavigationState> emit) {
         emit(SuccessState(event.currentIndex));
      }
}
