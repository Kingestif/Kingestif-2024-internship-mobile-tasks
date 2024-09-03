part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class StarterEvent extends HomeEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// ------------delete
class ProductDeleteEvent extends HomeEvent {
  final String productId;

  const ProductDeleteEvent(this.productId);

  @override
  List<Object> get props => [productId];
}



// --------------------add
class ProductAddEvent extends HomeEvent {
  final ProductEntity product;

  const ProductAddEvent(this.product);

  @override
  List<Object> get props => [product];
}

// ----------------------- update
class ProductUpdateEvent extends HomeEvent {
  final ProductEntity product;

  const ProductUpdateEvent(this.product);

  @override
  List<Object?> get props => [product];
}



// -----------------------search
