// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home/home_bloc.dart';

class SearchApp extends StatefulWidget {
  const SearchApp({super.key});

  @override
  State<SearchApp> createState() => _SearchAppState();
}

class _SearchAppState extends State<SearchApp> {
  RangeValues values = const RangeValues(0.1, 0.5);

  Future<void> _refreshProduct(BuildContext context) async {
    context.read<HomeBloc>().add(StarterEvent());
  }

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(
      values.start.toString(),
      values.end.toString(),
    );

    void updateRangeValues(RangeValues newValues) {
      setState(() {
        values = newValues;
      });
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading:
              // NAVIGATION ON CONTAINER
              GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); //help us go back
            },
            child: Container(
              margin: EdgeInsets.only(left: 30),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.blue,
              ),
            ),
          ),
          title: Text(
            "Search Product",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.only(left: 13, right: 13),
          // padding: EdgeInsets.only(right: ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.arrow_forward,
                          color: Colors.blue,
                        ),
                        hintStyle: TextStyle(
                          //To style Placeholder Text
                          color: Colors.grey[500],
                        ),
                        border:
                            OutlineInputBorder(), //to add border on the Field
                        hintText: "Leather",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ), //PUTS SPACE

                  // ---------------------------FINAL CALLING ON MENU
                  GestureDetector(
                    child: SizedBox(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Container(
                          // margin: EdgeInsets.only(left: 0),
                          width: 50,
                          height: 50,
                          color: Colors.blue,
                          child: GestureDetector(
                            child: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      child: _Category(
                                          context, values, updateRangeValues),
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.filter_list),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // ---------------remove this
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is LoadingHomeSate) {
                      return const Center(child: CircularProgressIndicator());
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
                      return const Center(child: Text('Something went wrong'));
                    }
                  },
                ),
              ),

              //2.Calling Category
              // _Category(context, values, updateRangeValues),
            ],
          ),
        ),
      ),
    );
  }
}

// FUNCTION instead of copying
Widget _duplicate(BuildContext context1, String imageUrl1, String shoeName1,
    String description1, String shoePrice1, String shoeRating1, String about1) {
  return Container(
    //wrapping the Card with Padding
    // padding: const EdgeInsets.all(10.0),
    child: Card(
      child: Column(
        //SHOE PICTURE and PRICE
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              //shoe pic
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 220,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Image.network(
                  imageUrl1,
                  fit: BoxFit.cover,
                ),
              ),
              // color: Colors.blue,
            ),
          ),
          Row(
            //DERBY LEATHER
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                shoeName1,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                shoePrice1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
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
    ),
  );
}

Widget _Category(
    BuildContext context, RangeValues values, Function(RangeValues) onChanged) {
  RangeLabels labels = RangeLabels(
    values.start.toString(),
    values.end.toString(),
  );

  return Container(
    margin: EdgeInsets.only(left: 30, right: 30, top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Category",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(), //to add border on the Field
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 25),
          child: Text(
            "Price",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Column(
          children: [
            Center(
                child: RangeSlider(
              values: values,
              divisions: 10,
              labels: labels,
              onChanged: onChanged,
              activeColor: Colors.blue,
            )),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: ElevatedButton(
            //PURE BUTTON
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Apply",
                style: TextStyle(
                  color: Colors.white,
                )),

            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 40),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                //MAKE the Button Square
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
