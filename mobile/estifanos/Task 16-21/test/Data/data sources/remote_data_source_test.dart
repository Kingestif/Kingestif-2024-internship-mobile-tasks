import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:new_app/Core/constants/constants.dart';
import 'package:new_app/Core/error/exception.dart';
import 'package:new_app/Features/todo/Data/data%20sources/remote_data_source.dart';
import 'package:new_app/Features/todo/Data/models/Product_Model.dart';
import '../../helpers/dummy_data/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

// implement, request to server
void main() {
  late MockHttpClient mockHttpClient;
  late ProductRemoteDataSourceImpl productRemoteDataSourceImpl;

  // initialize the above instances
  setUp(() {
    mockHttpClient = MockHttpClient();
    productRemoteDataSourceImpl = ProductRemoteDataSourceImpl(client: mockHttpClient);
  });
  const String id = '6672752cbd218790438efdb0';

  group('get current Product', () {   //run related tests
    // return A. valid data if Successful OR B. server exception if getting data is Failed

      test('should return product model with response code 200', () async {
        //arrange
        // stubbing or returning fake data
        when(
          mockHttpClient.get(     // Mocks an HTTP GET request made to a specific URL, which is formed by the currentProductById(id) method on 'constants' page.
            Uri.parse(Urls.currentProductById(id))
          )
        ).thenAnswer(         //Reads a JSON string from a file, This is used to simulate the API response.
            (_) async => http.Response(
              readJson('helpers/dummy_data/dummy_product_response.json'), 200
            )
        );

        //act
        final result = await productRemoteDataSourceImpl.getProductById(id);

        //assert
        expect(result, isA<ProductModel>());
      });
    });

  group('get All Product', () {   //run related tests
    test('should return ALL product model with response code 200', () async {
      // arrange
      when(
          mockHttpClient.get(
              Uri.parse(Urls.productAll())
          )
      ).thenAnswer(
              (_) async => http.Response(
              readJson('helpers/dummy_data/dummy_product_response.json'), 200
          )
      );

      //act
      final result = await productRemoteDataSourceImpl.getProductAll();

      //assert
      expect(result, isA<List<ProductModel>>());
    });
  });

  group('delete current Product', () {   //run related tests
    test('should make successful delete request ', () async {
      // arrange
      when(
          mockHttpClient.delete(
              Uri.parse(Urls.deleteProductById(id))
          )
      ).thenAnswer(
              (_) async => http.Response('', 200)
      );

      // Act
      await productRemoteDataSourceImpl.deleteProductId(id);    // method should send a delete request to the specified URL.

      //assert
      verify(mockHttpClient.delete(Uri.parse(Urls.deleteProductById(id))));    // checks that the delete request was indeed made with the correct URL.
    });

    test('should throw ServerException if delete fails', () async {
      // Arrange
      when(mockHttpClient.delete(Uri.parse(Urls.currentProductById(id))))
          .thenAnswer((_) async => http.Response('', 404));

      // Act & Assert   -If the method correctly throws a ServerException, the test passes.
      expect(
              () async => await productRemoteDataSourceImpl.deleteProductId(id),
          throwsA(isA<ServerException>()));
    });
  });

  group('delete current Product', () {   //run related tests
    test('should make successful delete request ', () async {
      // arrange
      when(
          mockHttpClient.delete(
              Uri.parse(Urls.deleteProductById(id))
          )
      ).thenAnswer(
              (_) async => http.Response('', 200)
      );

      // Act
      await productRemoteDataSourceImpl.deleteProductId(id);    // method should send a delete request to the specified URL.

      //assert
      verify(mockHttpClient.delete(Uri.parse(Urls.deleteProductById(id))));    // checks that the delete request was indeed made with the correct URL.
    });

    test('should throw ServerException if delete fails', () async {
      // Arrange
      when(mockHttpClient.delete(Uri.parse(Urls.currentProductById(id))))
          .thenAnswer((_) async => http.Response('', 404));

      // Act & Assert   -If the method correctly throws a ServerException, the test passes.
      expect(
              () async => await productRemoteDataSourceImpl.deleteProductId(id),
          throwsA(isA<ServerException>()));
    });
  });

  group('update Product', () {
    final updateData = {    //contains the new data we want to update
      'name': 'Updated Product Name',
      'description': 'Updated Description',
      'price': 200,
    };

    final productJson = {   //JSON object that the server would return after successfully updating the product
      'id': id,
      ...updateData,
      'imageUrl': 'https://example.com/path/to/image.jpg'
    };

    test('when response is 200 should return update data', () async {

      // arrange
      when(mockHttpClient.put(Uri.parse(Urls.updateTheProduct(id))    //this is where the HTTP is mocked
      )).thenAnswer((_) async => http.Response(
          json.encode(productJson), 200   //convert to map to Json string
      )
      );

      //act
      final result = await productRemoteDataSourceImpl.updateProduct();

      // assert
      expect(result, isA<ProductModel>());

    });
  });
}
// STUB(stubbing) - returning a fake object when mock object is called