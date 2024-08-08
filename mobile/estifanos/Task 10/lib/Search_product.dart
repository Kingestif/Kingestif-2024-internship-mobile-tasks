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

// initializing the Rangeslider
class _SearchAppState extends State<SearchApp> {
  RangeValues values = const RangeValues(0.1,0.5);

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
                              hintStyle: TextStyle(  //To style Placeholder Text
                                color: Colors.grey[500],
                              ),
                              border: OutlineInputBorder(),  //to add border on the Field
                              hintText: "Leather",
                            ),
                        ),
                      ),
                      SizedBox(width: 10,), //PUTS SPACE



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
                                          showModalBottomSheet(context: context,
                                            builder: (BuildContext context) {
                                              return SizedBox(
                                                height: MediaQuery.of(context).size.height * 0.4,
                                                child: _Category(context, values, updateRangeValues),
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

                  Container(
                    // margin: EdgeInsets.only(left:20, right:20),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height* 0.82,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        children: [

                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.93,
                                child: _duplicate(context,
                                  "images/first.jpg",
                                  "Nike Air Jordan 1",
                                  "Men's Shoes",
                                  "\$299",
                                  "(4.0)",
                                  "This is Nike Air,  leo urna ultrices turpis, nec gravida libero enim nec sapien. Donec ultrices turpis, nec gravida libero C . Donec ultrices turpis, nec gravida libero enim nec sapien. Donec erat. Integer quis dapibus turpis. Nullam eget justo egbibendum turpis at dictum ullamcorper. Morbi venenatis metus non libero gravida, nec tristique orci efficitur. Phasellus sed nunc in magna auctor congue. Vivamus aliquet pharetra lectus, at fermentum leo sollicitudin eget. Maecenas et nibh sit amet ligula tincidunt lacinia.",
                                ),
                              )
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.93,
                                child: _duplicate(context,
                                  "images/second.jpg",
                                  "Nike Airforce",
                                  "Men's Shoes",
                                  "\$200",
                                  "(4.0)",
                                  "This is Nike Airforce,  leo urna ultrices turpis, nec gravida libero enim nec sapien. Donec ultrices turpis, nec gravida libero C . Donec ultrices turpis, nec gravida libero enim nec sapien. Donec erat. Integer quis dapibus turpis. Nullam eget justo egbibendum turpis at dictum ullamcorper. Morbi venenatis metus non libero gravida, nec tristique orci efficitur. Phasellus sed nunc in magna auctor congue. Vivamus aliquet pharetra lectus, at fermentum leo sollicitudin eget. Maecenas et nibh sit amet ligula tincidunt lacinia.",
                                ),
                              )
                            ],
                          ),

                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.93,
                                child: _duplicate(context,
                                  "images/third.jpg",
                                  "Classic Vans",
                                  "Men's Shoes",
                                  "\$150",
                                  "(3.0)",
                                  "This is Vans,  leo urna ultrices turpis, nec gravida libero enim nec sapien. Donec ultrices turpis, nec gravida libero C . Donec ultrices turpis, nec gravida libero enim nec sapien. Donec erat. Integer quis dapibus turpis. Nullam eget justo egbibendum turpis at dictum ullamcorper. Morbi venenatis metus non libero gravida, nec tristique orci efficitur. Phasellus sed nunc in magna auctor congue. Vivamus aliquet pharetra lectus, at fermentum leo sollicitudin eget. Maecenas et nibh sit amet ligula tincidunt lacinia.",
                                ),
                              )
                            ],
                          ),
                        ],


                      ),
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
Widget _duplicate(BuildContext context1, String imageUrl1, String shoeName1, String description1, String shoePrice1, String shoeRating1, String about1){
  return Container(  //wrapping the Card with Padding
    // padding: const EdgeInsets.all(10.0),
    child: Card(
      child: Column( //SHOE PICTURE and PRICE
        children: [
          GestureDetector(
            onTap: () {},

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

Widget _Category(BuildContext context, RangeValues values, Function(RangeValues) onChanged){
  RangeLabels labels = RangeLabels(
    values.start.toString(),
    values.end.toString(),
  );

  return Container(
    margin: EdgeInsets.only(left:30, right: 30, top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                border: OutlineInputBorder(),  //to add border on the Field
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(top:25),
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
                )
            ),
          ],
        ),

        Container(
          margin: EdgeInsets.only(top: 50),
          child: ElevatedButton( //PURE BUTTON
            onPressed: () {
              Navigator.of(context).pop();
            },
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
  );
}




