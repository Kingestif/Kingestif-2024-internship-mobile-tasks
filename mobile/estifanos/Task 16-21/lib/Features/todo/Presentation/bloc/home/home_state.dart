part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class LoadingHomeSate extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadedHomeState extends HomeState{
  final List<ProductEntity> products;
  const LoadedHomeState(this.products);
  @override
  // TODO: implement props
  List<Object?> get props => [products];
}

class LoadHomeFailure extends HomeState {
  final String message;
  const LoadHomeFailure(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}


// ---------------------delete
class ProductDeletingState extends HomeState {
  @override
  List<Object> get props => [];
}

class ProductDeleteSuccess extends HomeState {
  final String productId;

  ProductDeleteSuccess(this.productId);

  @override
  List<Object?> get props => [productId];
}

class ProductDeleteFailure extends HomeState {
  final String message;

  ProductDeleteFailure(this.message);

  @override
  List<Object?> get props => [message];

}


// ---------------------------------add
class ProductAddingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class ProductAddSuccess extends HomeState {
  final ProductEntity product;

  ProductAddSuccess(this.product);

  @override
  List<Object?> get props => [product];
}

class ProductAddFailure extends HomeState {
  final String message;

  ProductAddFailure(this.message);

  @override
  List<Object?> get props => [message];
}


// ------------------------------------update
class ProductUpdatingState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductUpdateSucess extends HomeState{
  final ProductEntity product;

  ProductUpdateSucess(this.product);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductUpdateFailure extends HomeState{
  final String message;

  ProductUpdateFailure(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

