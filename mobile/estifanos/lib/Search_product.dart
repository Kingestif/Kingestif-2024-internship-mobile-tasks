// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: SearchApp(),
));


class SearchApp extends StatefulWidget {
  const SearchApp({super.key});

  @override
  State<SearchApp> createState() => _SearchAppState();
}

class _SearchAppState extends State<SearchApp> {
  RangeValues _currentRangeValues = const RangeValues(0,100);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
        AppBar(
          leading:
          // NAVIGATION ON CONTAINER
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();  //help us go back
            },
            child: Container(
              margin: EdgeInsets.only(left: 30),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.blue,
              ),
            ),
          ),

          title:
          Text(
            "Search Product",
            style: TextStyle(
              fontSize: 20,
            ),
          ),

          centerTitle: true,    //CENTER OUR TITLE
        ),
        body:
          Container(
            margin: EdgeInsets.only(left:30, right:30, top:20),
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
                              hintStyle: TextStyle(  //To style Placeholder Text
                                color: Colors.grey[500],
                              ),
                              border: OutlineInputBorder(),  //to add border on the Field
                              hintText: "Leather",
                            ),
                        ),
                      ),
                      SizedBox(width: 10,), //PUTS SPACE

                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: Container(
                            // margin: EdgeInsets.only(left: 0),
                            width: 50,
                            height: 50,
                            color: Colors.blue,
                            child: Icon(
                              Icons.filter_list,
                              color: Colors.white,
                            ),
                          ),
                      ),
                    ],
                  ),

                  Container(
                    // margin: EdgeInsets.only(left:20, right:20),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.57,
                      // width: MediaQuery.of(context).size.width,
                      child: ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 21),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.85,
                                  child: _myCard(),
                                )
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 21),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.85,
                                  child: _myCard(),
                                )
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 21),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.85,
                                  child: _myCard(),
                                )
                              ],
                            ),
                          ),
                        ],


                      ),
                    ),
                  ),

                  SizedBox(
                    height: 70,
                    // width: MediaQuery.of(context).size.width,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                              "Category",
                              style: TextStyle(
                                fontSize: 15,
                              ),

                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),  //to add border on the Field
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(
                            fontSize: 15,
                          ),

                        ),

                        Column(
                          children: [
                            RangeSlider(
                              values: _currentRangeValues,
                              min: 0,
                              max: 100,
                              divisions: 10,
                              labels: RangeLabels(
                                _currentRangeValues.start.round().toString(),
                                _currentRangeValues.end.round().toString(),
                              ),
                              activeColor: Colors.blue, // Active portion color
                              inactiveColor: Colors.grey,
                              onChanged: (RangeValues values) {
                                setState(() {
                                  _currentRangeValues = values;
                                });
                              },
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20,),
                    child: ElevatedButton( //PURE BUTTON
                      onPressed: () {},
                      child: Text(
                          "Apply",
                          style: TextStyle(
                            color: Colors.white,
                          )
                      ),

                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity,40),

                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(  //MAKE the Button Square
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
            ),
          ),
      ),
    );
  }
}

Widget _myCard(){
  return Container(  //wrapping the Card with Padding
    child: Card(
      child: Column( //SHOE PICTURE and PRICE
        children: [
          Container( //shoe pic
            // margin: EdgeInsets.only(top: 10),
            // width:330,
            // height: 200,
            child: Image.asset("images/newShoe.jpg", fit:BoxFit.cover),
            color: Colors.blue,
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
  );
}