import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:new_app/Features/todo/Domain/entities/Product.dart';
import 'package:new_app/Features/todo/Domain/usecase/GetProductAll.dart';
import '../../helpers/test_helper.mocks.dart';

// run this command ASAP whenever you create test for new Usecase
// dart run build_runner build
void main(){
  GetProductAllUsecase getall = GetProductAllUsecase(MockProductRepository());
  MockProductRepository mockProductRepository = MockProductRepository();

  setUp(() {
    mockProductRepository = MockProductRepository();
    getall = GetProductAllUsecase(mockProductRepository);
  });

  const testProductDetail = [
    ProductEntity(
        id: '1',
        name: 'nike',
        description: 'air Jordan',
        price: 200,
        imageUrl: 'imageUrl'
    ),
    ProductEntity(
        id: '2',
        name: 'adidas',
        description: 'yeezy',
        price: 300,
        imageUrl: 'imageUrl'
    ),
  ];

  test(
    'should get list of products from the repository',
      () async {
        //arrange
        when(
          mockProductRepository.getProductALL()
        ).thenAnswer((_) async => const Right(testProductDetail));

        //act
        final result = await getall.execute();

        //assert
        expect(result, const Right(testProductDetail));
        verify(mockProductRepository.getProductALL());   //should match exact parameter as when call
        verifyNoMoreInteractions(mockProductRepository);

      }
  );


}


