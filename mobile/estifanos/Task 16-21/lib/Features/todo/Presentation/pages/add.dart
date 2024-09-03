// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/main.dart';
import 'package:image_picker/image_picker.dart';

import '../../Domain/entities/Product.dart';
import '../bloc/home/home_bloc.dart';
import 'home.dart';

class productAdd extends StatefulWidget {
  @override
  State<productAdd> createState() => _productAddState();
}

class _productAddState extends State<productAdd> {
  late ProductFormControllers _controllers;
  File? selectedImage;

  @override
  void initState() {
    super.initState();
    _controllers = ProductFormControllers();
  }

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            "Add Product",
            style: TextStyle(
              fontSize: 20,
            ),
          ),

          centerTitle: true, //CENTER OUR TITLE
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              BlocListener<HomeBloc, HomeState>(
                listener: (context, state) {
                  if (state is ProductAddSuccess) {
                    BlocProvider.of<HomeBloc>(context).add(StarterEvent());

                    Navigator.of(context).push(
                      //since .pop has some issues just use push to navigate back to homepage
                      MaterialPageRoute(builder: (context) => const Home()),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Product added successfully!'),
                      ),
                    );
                  } else if (state is ProductAddFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('Failed to add the product: ${state.message}'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await _pickImage();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.grey[200],
                          child: selectedImage != null
                              ? Image.file(
                                  File(selectedImage!.path),
                                  fit: BoxFit.cover, // Fills the container
                                )
                              : Center(
                                  child: Container(
                                    width: 100,
                                    height: 120,
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.image_outlined,
                                          size: 60,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 25),
                                          child: Text(
                                            'Upload image',
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
                      ),

                      Container(
                        //NAME and INPUT
                        margin: EdgeInsets.only(top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "name",
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextField(
                                  controller: _controllers.nameController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,

                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    // hintText: "Leather",
                                  )),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        //NAME and INPUT
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "category",
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextField(
                                  controller: _controllers.categoryController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,

                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    // labelText: "Placeholder",
                                  )),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        //NAME and INPUT
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "price",
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextField(
                                  controller: _controllers.priceController,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.attach_money),
                                    border: InputBorder.none,

                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    // labelText: "Placeholder",
                                  )),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        //NAME and INPUT
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "description",
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextField(
                                  controller:
                                      _controllers.descriptionController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(bottom: 100),
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    // labelText: "Placeholder",
                                  )),
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
                            ElevatedButton(
                              onPressed: () {
                                double price = double.tryParse(
                                        _controllers.priceController.text) ??
                                    0.0;

                                BlocProvider.of<HomeBloc>(context)
                                    .add(ProductAddEvent(
                                  ProductEntity(
                                      name: _controllers.nameController.text,
                                      price: price,
                                      description: _controllers
                                          .descriptionController.text,
                                      id: '',
                                      imageUrl: selectedImage?.path ?? ''),
                                  // Add image if needed
                                ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 15, right: 15),
                                child: Text("ADD",
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 1),
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 15, right: 15),
                                child: Text("DELETE",
                                    style: TextStyle(
                                      color: Colors.red,
                                    )),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 10),
                                side: BorderSide(
                                  color: Colors.red,
                                ),
                                shape: RoundedRectangleBorder(
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImgPicker();
    final pickedFile = await picker.pickImageFromGallery();

    if (pickedFile != null) {
      setState(() {
        selectedImage = pickedFile;
      });
    }
  }
}

class ImgPicker {
  final ImagePicker imagePicker = ImagePicker();

  Future<File?> pickImageFromGallery() async {
    final XFile? pickedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}

class ProductFormControllers {
  // Controllers for TextFields
  final TextEditingController nameController;
  final TextEditingController categoryController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;

  ProductFormControllers()
      : nameController = TextEditingController(),
        categoryController = TextEditingController(),
        priceController = TextEditingController(),
        descriptionController = TextEditingController();

  // Dispose method to clean up the controllers
  void dispose() {
    nameController.dispose();
    categoryController.dispose();
    priceController.dispose();
    descriptionController.dispose();
  }
}
