// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/Features/todo/Presentation/pages/add.dart';
import 'package:new_app/Features/todo/Presentation/pages/update.dart';

import '../../../../dependency_injection.dart';
import '../bloc/home/home_bloc.dart';
import 'home.dart';

class detail extends StatefulWidget {
  String imageUrl;
  String shoeName;
  String description;
  String shoePrice;
  String shoeRating;
  String id;

  detail(
      {required this.imageUrl,
      required this.shoeName,
      required this.description,
      required this.shoePrice,
      required this.shoeRating,
      required this.id});

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  Color _textColor = Colors.white; //initialize the current color as Black

  void _changeSizeColor() {
    //call this using ontap() of gesture detector so whenever that container is pressed this state change the _textcolor to blue
    setState(() {
      _textColor = Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: Stack(
          children: <Widget>[
            Column(
              children: [
                Container(
                  child: Card(
                    margin: EdgeInsets
                        .zero, //Card have default padding that might interfere with the pic so remove that
                    elevation: 0,
                    child: Column(
                      //SHOE PICTURE and PRICE
                      children: [
                        Container(
                          width: double.infinity,
                          height: 300,
                          child: ClipRRect(
                            child: Image.network(
                              widget.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView(
                    children: [
                      Padding(
                        //MENS SHOES
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Row(
                            //MANS shoes and RATING
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.description,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_rate,
                                    color: Colors.amber[700],
                                  ),
                                  Text(
                                    widget.shoeRating,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        //DERBY LEATHER
                        margin: EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          //DERBY LEATHER
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.shoeName,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.shoePrice,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        //SIZE
                        padding: const EdgeInsets.only(left: 20),
                        margin: EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Size:",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    "39",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    "40",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(35),
                                  bottomLeft: Radius.circular(35),
                                  bottomRight: Radius.circular(35),
                                ),
                                child: GestureDetector(
                                  onTap: _changeSizeColor,
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    color: _textColor,
                                    child: Center(
                                      child: Text(
                                        "41",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    "42",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    "43",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    "44",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 30, right: 30, top: 20),
                        child: Text('This shoe can FLY'),
                      ),

                      // TEMPLATE FOR BLOCListener

                      Container(
                        child: BlocListener<HomeBloc, HomeState>(
                          listener: (context, state) {
                            if (state is ProductDeleteSuccess) {
                              // PURE
                              BlocProvider.of<HomeBloc>(context)
                                  .add(StarterEvent());

                              Navigator.of(context).push(
                                //since .pop has some issues just use push to navigate back to homepage
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Product deleted successfully!'),
                                ),
                              );
                            } else if (state is ProductDeleteFailure) {
                              // If delete failed, show an error message
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Failed to delete the product: ${state.message}'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: ElevatedButton(
                                    // PURE BUTTON
                                    onPressed: () {
                                      BlocProvider.of<HomeBloc>(context)
                                          .add(ProductDeleteEvent(widget.id));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12,
                                          bottom: 12,
                                          left: 17,
                                          right: 17),
                                      child: Text('Delete',
                                          style: TextStyle(color: Colors.red)),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      side: BorderSide(color: Colors.red),
                                      shape: RoundedRectangleBorder(
                                        // MAKE the Button Square
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20, left: 30),
                                  child: ElevatedButton(
                                    // PURE BUTTON
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => productUpdate(
                                                  imageUrl: widget.imageUrl,
                                                  shoeName: widget.shoeName,
                                                  description:
                                                      widget.description,
                                                  shoePrice: widget.shoePrice,
                                                  shoeRating: widget.shoeRating,
                                                  id: widget.id,
                                                )),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12,
                                          bottom: 12,
                                          left: 17,
                                          right: 17),
                                      child: Text("Update",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        // MAKE the Button Square
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 2,
              left: 2,
              child: FloatingActionButton(
                //Floating POINT
                shape: CircleBorder(),
                mini: true,
                backgroundColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
