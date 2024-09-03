import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../Domain/entities/Product.dart';
import '../models/Product_Model.dart';

abstract class ProductLocalDataSource {
  //Defines the contract for the local data source
  Future<ProductModel> getProduct(String id);
  Future<String> addProduct(ProductModel product);
  Future<String> deleteProduct(String id);
  Future<String> updateProduct(ProductModel product);
  Future<List<ProductEntity>> getProducts();
}

// we will uses SharedPreferences(key-value storage system) to store, retrieve, update, and delete product data locally on the device.

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final SharedPreferences sharedPreferences;
  ProductLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<String> addProduct(ProductModel product) async {
    //Converts a ProductModel into a JSON string and saves it in SharedPreferences (CACHE THE DATA)

    final jsonString = jsonEncode(product.toJson());
    final success =
        await sharedPreferences.setString('PRODUCT_${product.id}', jsonString);

    if (success) {
      return 'Product added successfully';
    } else {
      throw Exception('Failed to add product');
    }
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    final jsonString = sharedPreferences.getString(
        'PRODUCT_$id'); //retrieve a string from sharedPreference using the key 'PRODUCT_$id
    if (jsonString != null) {
      var ans = ProductModel.fromJson(jsonDecode(
          jsonString)); //Convert the json to Map<String, dynamic> then again this to Dart object
      print(ans);
      return ans;
    } else {
      throw Exception('Product not found');
    }
  }

  @override
  Future<String> deleteProduct(String id) async {
    await sharedPreferences
        .remove('PRODUCT_$id'); //remove the product from the Shared Preference
    if (sharedPreferences.containsKey('PRODUCT_$id')) {
      throw Exception('Failed to delete product');
    } else {
      return 'Product deleted successfully';
    }
  }

  @override
  Future<List<ProductEntity>> getProducts() async {
    //we will select all keys that start with PRODUCT_ then map all to Map<String, dynamic> then to Dart object
    final keys = sharedPreferences.getKeys();
    final productKeys = keys.where((key) => key.startsWith('PRODUCT_'));
    final products = productKeys.map((key) {
      final jsonString = sharedPreferences.getString(key);
      if (jsonString != null) {
        return ProductModel.fromJson(jsonDecode(jsonString));
      } else {
        throw Exception('Product not found for key: $key');
      }
    }).toList();

    return products;
  }

  @override
  Future<String> updateProduct(ProductModel product) async {
    final jsonString = jsonEncode(product.toJson());
    await sharedPreferences.setString('PRODUCT_${product.id}', jsonString);
    return 'Product updated successfully';
  }
}
