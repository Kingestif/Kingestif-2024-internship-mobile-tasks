// inorder to test usecase which have no implementation of the repositories we use "mockito" package in dev dependencies
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:new_app/Features/todo/Domain/entities/Product.dart';
import 'package:new_app/Features/todo/Domain/usecase/GetProductById.dart';
import '../../helpers/test_helper.mocks.dart';

void main(){
  // 1 create instance for your usecase
  GetProductByIdUsecase getbyid = GetProductByIdUsecase(MockProductRepository_());
  MockProductRepository_ mockProductRepository = MockProductRepository_();

  // now instantiate the objects
  setUp((){
    mockProductRepository = MockProductRepository_();
    getbyid = GetProductByIdUsecase(mockProductRepository);
  });

  const testProductDetail = ProductEntity(
      id: '1',
      name: 'nike',
      description: 'air Jordan',
      price: 200,
      imageUrl: 'imageUrl'
  );
  const testId = '1';

  test(
      'should get product from the repository',
      () async {
        //arrange
        when(
          mockProductRepository.getProductID(testId)
        ).thenAnswer((_) async => const Right(testProductDetail));

        //act
        final result = await getbyid.execute(testId);

        //assert
        expect(result, const Right(testProductDetail));
        verify(mockProductRepository.getProductID(testId));   //should match exact parameter as when call
        verifyNoMoreInteractions(mockProductRepository);
      }
  );
}