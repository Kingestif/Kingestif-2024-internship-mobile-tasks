import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/Features/todo/Presentation/bloc/home/home_bloc.dart'; // Adjust the path as needed
import 'package:new_app/Features/todo/Presentation/pages/Search_product.dart';
import 'package:new_app/Features/todo/Presentation/pages/add.dart';
import 'package:new_app/Features/todo/Presentation/pages/detail.dart';
import 'package:new_app/dependency_injection.dart'; // Import the GetIt setup file
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../authentication/Features/todo/Presentation/bloc/Auth/auth_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // when this function is called it dispatch a StarterEvent, which tells the HomeBloc to fetch the product list again.
  Future<void> _refreshProduct(BuildContext context) async {
    context.read<HomeBloc>().add(StarterEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Container(
            child: Row(
              //i want this to be aligned to start
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'July 14, 2023',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Hello, ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Estifanos',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    var ch = await SharedPreferences.getInstance();
                    var chx = ch.remove('Token');
                    var cht = ch.getString('Token');

                    if (cht == null) {
                      Navigator.pushNamed(context, '/second');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Logout Successful"),
                        duration: Duration(seconds: 2),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Logout Failed"),
                        duration: Duration(seconds: 5),
                      ));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoggedOutState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Logged out Sucessfully')));

              Navigator.pushNamed(context, '/');
            } else if (state is LogoutFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Logout Failed')));
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Available Products',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchApp()),
                          );
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          child: const Icon(
                            Icons.search,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state is LoadingHomeSate) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is LoadedHomeState) {
                          final products = state.products;

                          return RefreshIndicator(
                            onRefresh: () => _refreshProduct(context),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                itemCount: products.length,
                                itemBuilder: (context, index) {
                                  final product = products[index];
                                  return _duplicate(
                                    context,
                                    product.imageUrl, // Fallback image URL
                                    product.name,
                                    product.description,
                                    product.price.toString(),
                                    '(4.0)', // product.id,
                                    product.id,
                                  );
                                },
                              ),
                            ),
                          );
                        } else if (state is LoadHomeFailure) {
                          return Center(
                              child: Text(
                                  'Failed to load products: ${state.message}'));
                        } else {
                          return const Center(
                              child: Text('Something went wrong'));
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => productAdd()),
            );
          },
          child: const Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

Widget _duplicate(
    BuildContext context,
    String imageUrl1,
    String shoeName1,
    String description1,
    String shoePrice1,
    String shoeRating1,
    String shoeId1) {
  return Card(
    child: Column(
      //SHOE PICTURE and PRICE
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => detail(
                  imageUrl: imageUrl1,
                  shoeName: shoeName1,
                  description: description1,
                  shoePrice: shoePrice1,
                  shoeRating: shoeRating1,
                  id: shoeId1,
                ),
              ),
            );
          },
          child: Container(
            //shoe pic
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 220,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Image.network(
                imageUrl1,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Row(
          //DERBY LEATHER
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              shoeName1,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              shoePrice1,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: Row(
            //MANS shoes and RATING
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                description1,
                style: TextStyle(color: Colors.grey[600]),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_rate,
                    color: Colors.amber[700],
                  ),
                  Text(
                    shoeRating1,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
