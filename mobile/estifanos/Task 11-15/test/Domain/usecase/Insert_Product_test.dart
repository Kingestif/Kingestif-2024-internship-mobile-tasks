import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:new_app/Features/todo/Domain/entities/Product.dart';
import 'package:new_app/Features/todo/Domain/usecase/InsertProduct.dart';
import '../../helpers/test_helper.mocks.dart';


void main(){
  // 1 create instance for your usecase
  InsertProductUsecase insert = InsertProductUsecase(MockProductRepository());
  MockProductRepository mockProductRepository = MockProductRepository();

  // now instantiate the objects
  setUp((){
    mockProductRepository = MockProductRepository();
    insert = InsertProductUsecase(mockProductRepository);
  });

  const testProductDetail = ProductEntity(
      id: '',
      name: 'vans',
      description: 'classic vans',
      price: 300,
      imageUrl: 'imageUrl'
  );

  const testId = '';
  const testName = 'vans';
  const testDescription = 'classic vans';
  const testPrice = '300';
  const testImageUrl = 'imageUrl';

  test(
      'should insert product to the repository',
          () async {
        //arrange
        when(
            mockProductRepository.insertProduct(testProductDetail)
        ).thenAnswer((_) async => const Right(testProductDetail));

        //act
        final result = await insert.execute(testProductDetail);

        //assert
        expect(result, const Right(testProductDetail));
        verify(mockProductRepository.insertProduct(testProductDetail));   //should match exact parameter as when call
        verifyNoMoreInteractions(mockProductRepository);
      }
  );
}