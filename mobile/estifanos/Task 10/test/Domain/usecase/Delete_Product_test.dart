import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:new_app/Features/todo/Domain/usecase/DeleteProduct.dart';
import '../../helpers/test_helper.mocks.dart';

void main(){
  // 1 create instance for your usecase
  DeleteProductUsecase deletebyid = DeleteProductUsecase(MockProductRepository_());
  MockProductRepository_ mockProductRepository = MockProductRepository_();

  // now instantiate the objects
  setUp((){
    mockProductRepository = MockProductRepository_();
    deletebyid = DeleteProductUsecase(mockProductRepository);
  });

  const testId = '1';

  test(
      'should delete product from the repository',
          () async {
        //arrange
        when(
            mockProductRepository.deleteProduct(testId)
        ).thenAnswer((_) async => const Right(null)); //since delete doesn't return a value

        //act
        final result = await deletebyid.execute(testId);

        //assert
        expect(result, const Right(null));
        verify(mockProductRepository.deleteProduct(testId));   //should match exact parameter as when call
        verifyNoMoreInteractions(mockProductRepository);
      }
  );
}