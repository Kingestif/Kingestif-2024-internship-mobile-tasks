// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:new_app/Features/todo/Domain/entities/Product.dart';
// import 'package:new_app/Features/todo/Domain/usecase/InsertProduct.dart';
// import '../helpers/test_helper.mocks.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:new_app/Features/todo/Domain/entities/Product.dart';
import 'package:new_app/Features/todo/Domain/usecase/UpdateProduct.dart';

import '../../helpers/test_helper.mocks.dart';

void main(){
  // 1 create instance for your usecase
  UpdateProductUsecase update = UpdateProductUsecase(MockProductRepository_());
  MockProductRepository_ mockProductRepository = MockProductRepository_();

  // now instantiate the objects
  setUp((){
    mockProductRepository = MockProductRepository_();
    update = UpdateProductUsecase(mockProductRepository);
  });

  const testProductDetail = ProductEntity(
      id: '3',
      name: 'vans updated',
      description: 'classic vans updated',
      price: '300',
      imageUrl: 'imageUrl'
  );

  test(
      'should update product in the repository',
          () async {
        //arrange
        when(
            mockProductRepository.updateProduct(testProductDetail)
        ).thenAnswer((_) async => const Right(testProductDetail));

        //act
        final result = await update.execute(testProductDetail);

        //assert
        expect(result, const Right(testProductDetail));
        verify(mockProductRepository.updateProduct(testProductDetail));
        verifyNoMoreInteractions(mockProductRepository);
      }
  );
}