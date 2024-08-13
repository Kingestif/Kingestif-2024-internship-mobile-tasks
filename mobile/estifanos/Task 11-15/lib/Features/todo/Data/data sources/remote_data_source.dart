import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import '../../../../Core/constants/constants.dart';
import '../../../../Core/error/exception.dart';
import '../../../../add.dart';
import '../models/Product_Model.dart';

// this abstract class is the contract, change our data to Json and send to server using toJson and receive data and change to Product model using fromJson and store it
// takes id and returns ProductModel
abstract class ProductRemoteDataSource {
  Future<ProductModel> getProductById(String id);
  Future<List<ProductModel>> getProductAll();
  Future<void> deleteProductId(String id);
  Future<void> insertProduct(ProductModel product);
  Future<ProductModel> updateProduct(String id);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource{    //we implement this method below
  final http.Client client;   //Create instance of http client since we will be sending REQUEST to server
  ProductRemoteDataSourceImpl({required this.client});

  // extracting the correct data from the API using our ID
  @override
  Future<ProductModel> getProductById(String id) async {
    final response = await client.get(Uri.parse(Urls.currentProductById(id)));

    if(response.statusCode == 200) {
      final data = json.decode(response.body)['data'][0];

      // Map JSON object to a ProductModel instance
      return ProductModel.fromJson(data);
    }else{
      throw  ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getProductAll() async {
    final response = await client.get(Uri.parse(Urls.productAll()));

    if(response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];

      // Map each JSON object in the data array to a ProductModel instance
      final products = data.map((productJson) => ProductModel.fromJson(productJson)).toList();
      return products;

    }else{
      throw  ServerException();
    }
  }

  @override
  Future<void> deleteProductId(String id) async {
    final response = await client.delete(Uri.parse(Urls.deleteProductById(id)));

    if(response.statusCode != 200) {
      throw  ServerException();
    }
  }

  @override
  Future<void> insertProduct(ProductModel product) async {
    var request = MultipartRequest('POST', Uri.parse(Urls.insertCurrentProduct(product)));

    request.fields['id'] = product.id;
    request.fields['name'] = product.name;
    request.fields['description'] = product.description;
    request.fields['price'] = product.price.toString();

    request.files.add(await MultipartFile.fromPath(
        'image',
        'images/girl1.jpg',
        contentType: MediaType('image', 'jpg'),
    ));

    // Send the request
    final response = await client.send(request);

    // Handle the response
    if (response.statusCode != 201) {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> updateProduct(String id) async {   //updates a Product with the given id
    final response = await client.put(Uri.parse(Urls.updateTheProduct(id)));    //stores the result of http put request

    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as Map<String, dynamic>;    //decodes the above  response to dart map object
      return ProductModel.fromJson(jsonList);   //deserialization or converting the map to product model
    }else {
      throw ServerException();
    }
  }
}