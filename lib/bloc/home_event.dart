part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class AddToCartEvent extends HomeEvent {
  final String image;
  const AddToCartEvent(this.image);
}

class ShowLoadingEvent extends HomeEvent {
  final String image;
  const ShowLoadingEvent(this.image);
}
