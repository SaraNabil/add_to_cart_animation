part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [identityHashCode(this)];
}

class HomeInitial extends HomeState {}

class AddToCartState extends HomeState {
  final String image;
  const AddToCartState(this.image);
}

class ShowLoadingState extends HomeState {
  final String image;
  const ShowLoadingState(this.image);
}
