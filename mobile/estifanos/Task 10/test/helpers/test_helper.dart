import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:new_app/Features/todo/Domain/repositories/ProductRepository.dart';

@GenerateMocks(
  [
    ProductRepository_    //class we want to mock
  ],
  customMocks: [MockSpec<http.Client> (as: #MockHttpClient)],
)

void main() {}