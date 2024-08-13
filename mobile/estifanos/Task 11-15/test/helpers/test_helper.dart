import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:new_app/Features/todo/Data/data%20sources/remote_data_source.dart';
import 'package:new_app/Features/todo/Domain/repositories/ProductRepository.dart';

@GenerateMocks(
  [
    ProductRepository,    //class we want to mock
    ProductRemoteDataSource
  ],
  customMocks: [MockSpec<http.Client> (as: #MockHttpClient)],
)

void main() {}