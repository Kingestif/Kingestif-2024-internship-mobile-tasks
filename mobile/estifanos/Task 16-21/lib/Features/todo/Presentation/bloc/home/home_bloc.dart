import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../Data/models/Product_Model.dart';
import '../../../Domain/entities/Product.dart';
import '../../../Domain/usecase/DeleteProduct.dart';
import '../../../Domain/usecase/GetProductAll.dart';
import '../../../Domain/usecase/InsertProduct.dart';
import '../../../Domain/usecase/UpdateProduct.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProductAllUsecase getProductAllUsecase;
  final DeleteProductUsecase deleteProductUsecase;
  final InsertProductUsecase insertProductUsecase;
  final UpdateProductUsecase updateProductUsecase;

  // Combine all use cases in a single constructor
  HomeBloc({
    required this.getProductAllUsecase,
    required this.deleteProductUsecase,
    required this.insertProductUsecase,
    required this.updateProductUsecase,

  }) : super(LoadingHomeSate()) {
    // Event handlers
    on<StarterEvent>(_onStarterEvent);
    on<ProductDeleteEvent>(_onDeleteProductEvent);
    on<ProductAddEvent>(_onAddProductEvent);
    on<ProductUpdateEvent>(_onUpdateProductEvent);
  }

  // Handler for StarterEvent
  Future<void> _onStarterEvent(
      StarterEvent event, Emitter<HomeState> emit) async {
    print('object hello get Product');
    emit(LoadingHomeSate());

    var result = await getProductAllUsecase.execute();

    result.fold(
          (l) => emit(LoadHomeFailure(l.message)),
          (r) => emit(LoadedHomeState(r)),
    );
  }

  // -------------------------------handler for Delete Event
  Future<void> _onDeleteProductEvent(
      ProductDeleteEvent event, Emitter<HomeState> emit) async {
    print('object hello delete');
    emit(ProductDeletingState());

    var result = await deleteProductUsecase.execute(event.productId);

    result.fold(
          (l) => emit(ProductDeleteFailure(l.message)),
          (r) => emit(ProductDeleteSuccess(event.productId)),
    );
  }

  // ---------------------------------Handler for Add event
  Future<void> _onAddProductEvent(
      ProductAddEvent event, Emitter<HomeState> emit) async {
    print('object hello add');

    emit(ProductAddingState());

    var result = await insertProductUsecase.execute(event.product);

    result.fold(
          (l) => emit(ProductAddFailure(l.message)),
          (r) => emit(ProductAddSuccess(event.product)),
    );
  }

  // --------------------------------Handler for Update event

  Future<void> _onUpdateProductEvent(
      ProductUpdateEvent event, Emitter<HomeState> emit) async {
    print('object hello update');

    emit(ProductUpdatingState());

    var result = await updateProductUsecase.execute(event.product);

    result.fold(
          (l) => emit(ProductUpdateFailure(l.message)),
          (r) => emit(ProductUpdateSucess(event.product)),
    );
  }
  @override
  void onChange(Change<HomeState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change.currentState);
    print(change.nextState);
  }
}
