// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:new_app/main.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: productAdd(),
));

class productAdd extends StatelessWidget {
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Shoe()),
                    // );
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
                "Add Product",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),

            centerTitle: true,    //CENTER OUR TITLE
          ),

        body:
          SizedBox(
            height: MediaQuery.of(context).size.height ,
            child: ListView(
              children: [
                Container(
                    margin: EdgeInsets.only(left:30, right:30),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.grey[200],
                        child: Center(
                            child: Container(
                              width: 100,
                              height: 120,
                              child:
                              Column(
                                children: [
                                  Icon(
                                    Icons.image_outlined,
                                    size: 60,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 25),
                                      child: Text(
                                        "Upload image",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                  ),
                                ],
                              ),
                            ),
                        ),
                      ),

                      Container(  //NAME and INPUT
                        margin: EdgeInsets.only(top:30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "name",
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none, //Remove the Outer border
                                  // border: OutlineInputBorder(),  //to add border on the Field
                                  // hintStyle: TextStyle(  //To style Placeholder Text
                                  //   color: Colors.grey,
                                  // ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  // hintText: "Leather",
                                )
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(  //NAME and INPUT
                        margin: EdgeInsets.only(top:10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "category",
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none, //Remove the Outer border
                                    // border: OutlineInputBorder(),  //to add border on the Field
                                    // hintStyle: TextStyle(  //To style Placeholder Text
                                    //   color: Colors.grey,
                                    // ),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    // labelText: "Placeholder",
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(  //NAME and INPUT
                        margin: EdgeInsets.only(top:10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "price",
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextField(
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.attach_money),
                                    border: InputBorder.none, //Remove the Outer border
                                    // border: OutlineInputBorder(),  //to add border on the Field
                                    // hintStyle: TextStyle(  //To style Placeholder Text
                                    //   color: Colors.grey,
                                    // ),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    // labelText: "Placeholder",
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(  //NAME and INPUT
                        margin: EdgeInsets.only(top:10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "description",
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(bottom: 100),
                                    border: InputBorder.none, //Remove the Outer border
                                    // border: OutlineInputBorder(),  //to add border on the Field
                                    // hintStyle: TextStyle(  //To style Placeholder Text
                                    //   color: Colors.grey,
                                    // ),
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    // labelText: "Placeholder",
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      // THE BUTTONS

                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton( //PURE BUTTON
                              onPressed: (){
                                Navigator.of(context).pop();
                                },
                              child: Padding(
                                padding: const EdgeInsets.only(top:10, bottom:10, left: 15, right: 15),
                                child: Text(
                                    "ADD",
                                    style: TextStyle(
                                      color: Colors.white,
                                    )
                                ),
                              ),

                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity,1),
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(  //MAKE the Button Square
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),


                            ElevatedButton( //PURE BUTTON
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top:10, bottom:10, left: 15, right: 15),
                                child: Text(
                                    "DELETE",
                                    style: TextStyle(
                                      color: Colors.red,
                                    )
                                ),
                              ),

                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity,10),
                                side: BorderSide(
                                  color: Colors.red,
                                ),

                                shape: RoundedRectangleBorder(  //MAKE the Button Square
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

      ),
    );
  }
}
