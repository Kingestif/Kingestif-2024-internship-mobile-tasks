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
        // ORIGINAL SIDE BAR
        // drawer: Nav(),

        backgroundColor: Colors.white,

        // Original Profile
        // appBar:
        //   PreferredSize(preferredSize: Size.fromHeight(70),
        //       child:Container(
        //         // margin: EdgeInsets.only(left: 20, right: 20),
        //         child: AppBar(
        //           backgroundColor: Colors.blue[900],
        //           title:
        //           Container(
        //             margin: EdgeInsets.only(top: 10),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceAround,
        //               children: <Widget>[
        //                 Spacer(), //widget that push the next widget to the end
        //
        //                 Container( //PERFECT TREE 1 container-> row -> children -> (Icon,Text)
        //                   margin: EdgeInsets.all(20),
        //                   padding: EdgeInsets.all(5),
        //
        //                   color: Color(0x2196F3E5),
        //                   child:
        //                     Row(
        //                       children: [
        //                         Padding(
        //                           padding: const EdgeInsets.only(right: 5),
        //                           child: Icon(
        //                             Icons.search,
        //                             color: Colors.white,
        //                           ),
        //                         ),
        //                         Text(
        //                           "search",
        //                           style: TextStyle(
        //                             fontSize: 15,
        //                             color: Colors.grey,
        //                           ),
        //                         ),
        //
        //                       ],
        //                     ),
        //                 ),
        //
        //                 Column(
        //                   children: <Widget>[
        //                     ClipOval(
        //                         child: Container(
        //                           child: Image.asset(
        //                             "images/girl1.jpg",
        //                             width: 50,
        //                             height: 50,
        //                             fit: BoxFit.cover,
        //                           ),
        //                         )
        //                     )
        //                   ],
        //                 ),
        //               ],
        //
        //             ),
        //           ),
        //
        //         ),
        //       ),
        //
        //     ),

        appBar:
        AppBar(
          title:
          Container(
            // padding: EdgeInsets.symmetric(vertical: 1.0),
            // margin: EdgeInsets.only(left:1, right:1,),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "July 14, 2023",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          )
                      ),
                      Row(
                        children: [
                          Text(
                              "Hello, ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              )

                          ),
                          Text(
                            "Estifanos",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),

                        ],



                      ),


                    ],
                  ),
                ),
                Spacer(),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:Colors.grey,
                      // width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  width: 40,
                  height: 40,
                  child:
                  Icon(Icons.notifications_none),
                ),
              ],


            ),
          ),

        ),



        body:
        // PERFECT layout(TREE) Do without the container at first then add it if you want to update the margin
        Container(
          margin: EdgeInsets.only(left: 13, right: 13),
          child:Column( //AVAILABLE PRODUCTS
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                height: MediaQuery.of(context).size.height * 0.84,
                child: ListView(  //just do whatever you like and finally wrap it with ListView, NOTE!! ListView must be wrapped by sizedBox or other container where you will set Height for it (i used size of the phone) using media query!!
                  children: [
                    // **made just 1 Card on my "_duplicate" function then pass inputs as parameters
                    _duplicate(context,
                      "images/first.jpg",
                      "Nike Air Jordan 1",
                      "Men's Shoes",
                      "\$299",
                      "(4.0)",
                      "This is Nike Air,  leo urna ultrices turpis, nec gravida libero enim nec sapien. Donec ultrices turpis, nec gravida libero C . Donec ultrices turpis, nec gravida libero enim nec sapien. Donec erat. Integer quis dapibus turpis. Nullam eget justo egbibendum turpis at dictum ullamcorper. Morbi venenatis metus non libero gravida, nec tristique orci efficitur. Phasellus sed nunc in magna auctor congue. Vivamus aliquet pharetra lectus, at fermentum leo sollicitudin eget. Maecenas et nibh sit amet ligula tincidunt lacinia.",
                    ),

                    // ---------Copy of the function call instead of all cards:)
                    _duplicate(context,
                      "images/second.jpg",
                      "Nike Airforce",
                      "Men's Shoes",
                      "\$200",
                      "(4.0)",
                      "This is Nike Airforce,  leo urna ultrices turpis, nec gravida libero enim nec sapien. Donec ultrices turpis, nec gravida libero C . Donec ultrices turpis, nec gravida libero enim nec sapien. Donec erat. Integer quis dapibus turpis. Nullam eget justo egbibendum turpis at dictum ullamcorper. Morbi venenatis metus non libero gravida, nec tristique orci efficitur. Phasellus sed nunc in magna auctor congue. Vivamus aliquet pharetra lectus, at fermentum leo sollicitudin eget. Maecenas et nibh sit amet ligula tincidunt lacinia.",


                    ),

                    _duplicate(context,
                      "images/third.jpg",
                      "Classic Vans",
                      "Men's Shoes",
                      "\$150",
                      "(3.0)",
                      "This is Vans,  leo urna ultrices turpis, nec gravida libero enim nec sapien. Donec ultrices turpis, nec gravida libero C . Donec ultrices turpis, nec gravida libero enim nec sapien. Donec erat. Integer quis dapibus turpis. Nullam eget justo egbibendum turpis at dictum ullamcorper. Morbi venenatis metus non libero gravida, nec tristique orci efficitur. Phasellus sed nunc in magna auctor congue. Vivamus aliquet pharetra lectus, at fermentum leo sollicitudin eget. Maecenas et nibh sit amet ligula tincidunt lacinia.",
                    ),
                  ],
                ),
              ),
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


        // the NAV BAR AT BOTTOM
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: 0,  //select the 0th index item on the navbar
        //   selectedItemColor: Colors.blue,   //make the selected item Blue
        //   selectedLabelStyle: TextStyle(fontSize: 15),
        //   unselectedLabelStyle: TextStyle(fontSize: 12),
        //   iconSize: 30,
        //
        //   items: [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        //     BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        //     BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        //   ],),
      ),
    );
  }
}

Widget _duplicate(BuildContext context1, String imageUrl1, String shoeName1, String description1, String shoePrice1, String shoeRating1, String about1){
  return Container(  //wrapping the Card with Padding
    // padding: const EdgeInsets.all(10.0),
    child: Card(
      child: Column( //SHOE PICTURE and PRICE
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context1,
                // routing and passing the arguments
                MaterialPageRoute(builder: (context) => detail(
                  imageUrl: imageUrl1,
                  shoeName: shoeName1,
                  description: description1,
                  shoePrice: shoePrice1,
                  shoeRating: shoeRating1,
                  about: about1,
                ),
                ),
              );
            },

            child: Container( //shoe pic
              margin: EdgeInsets.only(top: 10),
              width:double.infinity,
              height: 220,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Image.asset(
                  imageUrl1,
                  // "https://images.unsplash.com/photo-1556906781-9a412961c28c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEzfHx8ZW58MHx8fHx8",
                  fit:BoxFit.cover,
                ),
              ),
              // color: Colors.blue,
            ),
          ),

          Row(  //DERBY LEATHER
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
            // padding: const EdgeInsets.all(8.0),
            child: Row(  //MANS shoes and RATING
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  description1,
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