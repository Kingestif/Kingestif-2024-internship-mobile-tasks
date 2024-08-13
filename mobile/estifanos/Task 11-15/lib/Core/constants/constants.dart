// Define URL, Path and API keys for managing and constructing URL's (THE ENDPOINTS)
import '../../Features/todo/Data/models/Product_Model.dart';

class Urls{
  static const String baseUrl = 'https://g5-flutter-learning-path-be.onrender.com';
  static String currentProductById(String id) => '$baseUrl/$id';    // intended to generate a URL for fetching a specific product by its ID from the API.
  static String productAll() => '$baseUrl/products';
  static String deleteProductById(String id) => '$baseUrl/$id';
  static String insertCurrentProduct(ProductModel product) => '$baseUrl/products';
  static String updateTheProduct(String id) => '$baseUrl/products';
}