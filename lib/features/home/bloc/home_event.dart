part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeProductWishlistButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeProductsCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeProductsCartButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeProductWishlistNavigateEvent extends HomeEvent {}

class HomeProductCartNavigateEvent extends HomeEvent {}
