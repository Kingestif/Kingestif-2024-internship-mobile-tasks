import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Core/constants/constants.dart';
import '../../../../Core/error/exception.dart';
import '../../Presentation/pages/add.dart';
import '../models/Product_Model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> getProductById(String id);
  Future<List<ProductModel>> getProductAll();
  Future<void> deleteProductId(String id);
  Future<void> insertProduct(ProductModel product);
  Future<ProductModel> updateProduct(ProductModel product);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<ProductModel> getProductById(String id) async {
    var sf = await SharedPreferences.getInstance();
    var token = sf.getString('Token');

    var header = {"Authorization": 'Bearer $token'};

    final response = await client.get(Uri.parse(Urls.currentProductById(id)),
        headers: header);

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'][0];

      return ProductModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getProductAll() async {
    var sf = await SharedPreferences.getInstance();
    var token = sf.getString('Token');

    var header = {"Authorization": 'Bearer $token'};

    final response =
        await client.get(Uri.parse(Urls.productAll()), headers: header);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];

      final products = data
          .map((productJson) => ProductModel.fromJson(productJson))
          .toList();
      return products;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteProductId(String id) async {
    var sf = await SharedPreferences.getInstance();
    var token = sf.getString('Token');

    var header = {"Authorization": 'Bearer $token'};

    final response = await client.delete(Uri.parse(Urls.deleteProductById(id)),
        headers: header);

    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<void> insertProduct(ProductModel product) async {
    var sf = await SharedPreferences.getInstance();
    var token = sf.getString('Token');

    var header = {"Authorization": 'Bearer $token'};

    var request =
        MultipartRequest('POST', Uri.parse(Urls.insertCurrentProduct(product)));

    request.fields['id'] = product.id;
    request.fields['name'] = product.name;
    request.fields['description'] = product.description;
    request.fields['price'] = product.price.toString();

    request.files.add(await MultipartFile.fromPath(
      'image',
      product.imageUrl,
      contentType: MediaType('image', 'jpg'),
    ));

    request.headers['Authorization'] = 'Bearer $token';

    // Send the request
    final response = await client.send(request);

    // Handle the response
    if (response.statusCode != 201) {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    var base =
        'https://g5-flutter-learning-path-be.onrender.com/api/v2/products/';

    var sf = await SharedPreferences.getInstance();
    var token = sf.getString('Token');

    var header = {
      "Authorization": 'Bearer $token',
      'Content-Type': 'application/json',
    };
    print(base + product.id);

    final response =
        await client.put(Uri.parse(Urls.updateTheProduct(product.id)),
            body: json.encode({
              'name': product.name,
              'description': product.description,
              'price': product.price,
            }),
            headers: header);

    print("THE STATUS CODE");
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonList =
          json.decode(response.body)["data"] as Map<String, dynamic>;
      return ProductModel.fromJson(jsonList);
    } else {
      throw ServerException();
    }
  }
}
