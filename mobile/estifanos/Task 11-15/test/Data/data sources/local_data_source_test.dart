import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:new_app/Features/todo/Data/data%20sources/local_data_source.dart';
import 'package:new_app/Features/todo/Data/models/Product_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// specifically testing ProductRemoteImpl interaction with SharedPreferences using the mockito package for mocking
class MockSharedPreferences extends Mock implements SharedPreferences {}
void main() {
  late ProductLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = ProductLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('getProduct', () {    //checks if the Product exist in the cache and returns it Otherwise returns exception
    const productId = '1';
    const productModel = ProductModel(
      id: '1',
      name: 'Test Product',
      description: 'Test Description',
      price: 10,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg',
    );
    // final jsonString = '{"id": "1", "name": "Test Product", "description": "Test Description", "price": 10}';    //error
    final jsonString = jsonEncode({
      'id': '1',
      'name': 'Test Product',
      'description': 'Test Description',
      'price': 10,
      'imageUrl': 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg',
    });

    test('should return ProductModel when there is one in the cache', () async {
      // Arrange
      when(mockSharedPreferences.getString('PRODUCT_$productId'))
          .thenReturn(jsonString);

      // Act
      final result = await dataSource.getProduct(productId);

      // Assert
      expect(result, equals(productModel));
    });

    test('should throw an exception when there is nothing in the cache', () async {
      // Arrange
      when(mockSharedPreferences.getString('PRODUCT_$productId')).thenReturn(null);

      // Act
      final call = dataSource.getProduct;

      // Assert
      expect(() => call(productId), throwsException);
    });
  });

  group('addProduct', () {
    const productModel = ProductModel(
      id: '1',
      name: 'Test Product',
      description: 'Test Description',
      price: 10,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg',
    );

    test('should call SharedPreferences to cache the data', () async {
      // Arrange    convert ProductModel to Json String
      final jsonString = jsonEncode(productModel.toJson());

      // Act
      await dataSource.addProduct(productModel);

      // Assert
      verify(mockSharedPreferences.setString('PRODUCT_${productModel.id}', jsonString));
    });
  });

}