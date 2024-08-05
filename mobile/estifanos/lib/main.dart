// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:new_app/Nav.dart';
import 'package:new_app/Search_product.dart';
import 'package:new_app/add.dart';
import 'package:new_app/detail.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Shoe(),
));

class Shoe extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(  //ALWAYS Wrap your Scaffold with SafeArea
      child: Scaffold(
        drawer: Nav(),
        backgroundColor: Colors.white,
        appBar:
          PreferredSize(preferredSize: Size.fromHeight(70),
              child:Container(
                // margin: EdgeInsets.only(left: 20, right: 20),
                child: AppBar(
                  backgroundColor: Colors.blue[900],
                  title:
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Spacer(), //widget that push the next widget to the end

                        Container( //PERFECT TREE 1 container-> row -> children -> (Icon,Text)
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(5),

                          color: Color(0x2196F3E5),
                          child:
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "search",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),

                              ],
                            ),
                        ),

                        Column(
                          children: <Widget>[
                            ClipOval(
                                child: Container(
                                  child: Image.asset(
                                    "images/girl1.jpg",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                )
                            )
                          ],
                        ),
                      ],

                    ),
                  ),

                ),
              ),

            ),



        body:
            // PERFECT layout(TREE) Do without the container at first then add it if you want to update the margin
          Container(
            margin: EdgeInsets.only(top: 20),
              child:Column( //AVAILABLE PRODUCTS
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Available Products",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),

                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SearchApp()),
                          );
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          child:Icon(
                            Icons.search,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.72,
                    child: ListView(  //just do whatever you like and finallay wrap it with ListView, NOTE!! ListView must be wrapped by sizedBox or other container where you will set Height for it (i used size of the phone) using media query!!
                      children: [
                        Container(  //wrapping the Card with Padding
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                              child: Column( //SHOE PICTURE and PRICE
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => detail()),
                                  );
                                },

                                child: Container( //shoe pic
                                  margin: EdgeInsets.only(top: 10),
                                  // width:330,
                                  // height: 200,
                                  child: Image.asset("images/newShoe.jpg", fit:BoxFit.cover),
                                  color: Colors.blue,
                                ),
                              ),

                              Row(  //DERBY LEATHER
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Derby Leather Shoes",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),

                                  ),
                                  Text(
                                    "\$120",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),

                                  ),
                                ],
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 5),
                                // padding: const EdgeInsets.all(8.0),
                                child: Row(  //MANS shoes and RATING
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Men's Shoes",
                                      style: TextStyle(
                                        color: Colors.grey[600]
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star_rate,
                                          color: Colors.amber[700],
                                        ),
                                        Text(
                                          "(4.0)",
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
                        ),

                        // -------- Copy of privous container
                        Container(  //wrapping the Card with Padding
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                              child: Column( //SHOE PICTURE and PRICE
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => detail()),
                                      );
                                    },
                                    child: Container( //shoe pic
                                      margin: EdgeInsets.only(top: 10),
                                      // width:330,
                                      // height: 200,
                                      child: Image.asset("images/newShoe.jpg", fit:BoxFit.cover),
                                      color: Colors.blue,
                                    ),
                                  ),

                                  Row(  //DERBY LEATHER
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Derby Leather Shoes",
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),

                                      ),
                                      Text(
                                        "\$120",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),

                                      ),
                                    ],
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    // padding: const EdgeInsets.all(8.0),
                                    child: Row(  //MANS shoes and RATING
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Men's Shoes",
                                          style: TextStyle(
                                              color: Colors.grey[600]
                                          ),
                                        ),

                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star_rate,
                                              color: Colors.amber[700],
                                            ),
                                            Text(
                                              "(4.0)",
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

                              )),
                        ),

                        Container(  //wrapping the Card with Padding
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                              child: Column( //SHOE PICTURE and PRICE
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => detail()),
                                      );
                                    },

                                    child: Container( //shoe pic
                                      margin: EdgeInsets.only(top: 10),
                                      // width:330,
                                      // height: 200,
                                      child: Image.asset("images/newShoe.jpg", fit:BoxFit.cover),
                                      color: Colors.blue,
                                    ),
                                  ),

                                  Row(  //DERBY LEATHER
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Derby Leather Shoes",
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),

                                      ),
                                      Text(
                                        "\$120",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),

                                      ),
                                    ],
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    // padding: const EdgeInsets.all(8.0),
                                    child: Row(  //MANS shoes and RATING
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Men's Shoes",
                                          style: TextStyle(
                                              color: Colors.grey[600]
                                          ),
                                        ),

                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star_rate,
                                              color: Colors.amber[700],
                                            ),
                                            Text(
                                              "(4.0)",
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

                              )),
                        ),
                      ],
                    ),
                  ),

                  // COPY of previous Card


                  // FLOATING POINT
                ],
              ),


          ),

        floatingActionButton: FloatingActionButton( //Floating POINT
          shape: CircleBorder(),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => productAdd()),
            );
          },
          child: Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),

        ),


        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,  //select the 0th index item on the navbar
          selectedItemColor: Colors.blue,   //make the selected item Blue
          selectedLabelStyle: TextStyle(fontSize: 15),
          unselectedLabelStyle: TextStyle(fontSize: 12),
          iconSize: 30,

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          ],),
      ),
    );
  }
}


