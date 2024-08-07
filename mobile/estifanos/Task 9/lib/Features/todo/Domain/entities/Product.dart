import 'package:equatable/equatable.dart';
//** what will our api return its a Product("shoe") so a shoe must contain this  properties to be fetches from the API
class ProductEntity extends Equatable{
  final String id;
  final String name;
  final String description;
  final String price;
  final String imageUrl;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id,name,description,price,imageUrl];
}