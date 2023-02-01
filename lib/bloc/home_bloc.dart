import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<AddToCartEvent>(_onAddToCartEvent);
    on<ShowLoadingEvent>(_onShowLoadingEvent);
  }

  FutureOr<void> _onAddToCartEvent(
      AddToCartEvent event, Emitter<HomeState> emit) {
    emit(AddToCartState(event.image));
  }

  FutureOr<void> _onShowLoadingEvent(
      ShowLoadingEvent event, Emitter<HomeState> emit) {
    emit(ShowLoadingState(event.image));
  }
}
