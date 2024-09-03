import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_app/Features/todo/Data/models/Product_Model.dart';
import 'package:new_app/Features/todo/Domain/entities/Product.dart';

import '../../helpers/dummy_data/json_reader.dart';

void main() {
  const testProductModel = ProductModel(    //create instance of weather model
    id: '6672752cbd218790438efdb0',    // this information MUST MATCH!! with the dummy_product_response.json(our API) b/c we said expect() to be the same
    name: 'Anime website',
    description: 'Explore anime characters.',
    price: 123,
    imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg'
  );


  test( //test if product model is subclass of product entity
      'should be a subclass Product entity',
      () async {
        //assert
        expect(testProductModel, isA<ProductEntity>());
      }
  );

  // from Json testing
  test(
    'should return valid model from json',
      () async {
        //arrange
        // we will create dummy Json file for safety and will read from it using Json decode

        // json.decode converts the JSON string read from the file into a Dart Map<String, dynamic> object.
        final Map<String, dynamic> jsonMap = json.decode(
          readJson('helpers/dummy_data/dummy_product_response.json'),
        );

        //act
        // convert the json to product model(dart objects or DESERIALIZE) using fromJson
        final result = ProductModel.fromJson(jsonMap['data'][0]);    //since our Json have nested list we use index

        // assert
        expect(result, equals(testProductModel));   //if result returned from Json != the one we mentioned on testProductModel above the TEST FAILS!!
      }

  );

  test(
    'should return json map with proper data',
      () async {
        // act
        final result =  testProductModel.toJson();  //changes instance of a Dart class into a JSON-compatible Map<String, dynamic>

        // assert
        final expectedJsonMap = {   //MUST BE SAME!! with the above product mode
          'id': '6672752cbd218790438efdb0',
          'name': 'Anime website',
          'description': 'Explore anime characters.',
          'price': 123,
          'imageUrl': 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg',
        };
        
        expect(result, equals(expectedJsonMap));
      }
  );
}