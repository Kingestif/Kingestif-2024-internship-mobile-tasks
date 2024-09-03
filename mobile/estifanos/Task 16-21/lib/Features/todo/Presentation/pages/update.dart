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

class productUpdate extends StatefulWidget {
  String imageUrl;
  String shoeName;
  String description;
  String shoePrice;
  String shoeRating;
  String id;

  productUpdate(
      {required this.imageUrl,
      required this.shoeName,
      required this.description,
      required this.shoePrice,
      required this.shoeRating,
      required this.id});

  @override
  State<productUpdate> createState() => _productUpdateState();
}

class _productUpdateState extends State<productUpdate> {
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
          leading: GestureDetector(
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
            "Update Product",
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
                  if (state is ProductUpdateSucess) {
                    BlocProvider.of<HomeBloc>(context).add(StarterEvent());

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Product updated successfully!'),
                      ),
                    );

                    Navigator.pushNamed(context, '/third');
                  } else if (state is ProductUpdateFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Failed to update the product: ${state.message}'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.grey[200],
                          child: Image.network(
                            widget.imageUrl,
                            fit: BoxFit.cover,
                          )),

                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'name',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextField(
                                  controller: _controllers.nameController,
                                  decoration: InputDecoration(
                                    hintText: widget.shoeName,
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
                              "price",
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextField(
                                  controller: _controllers.priceController,
                                  decoration: InputDecoration(
                                    hintText: widget.shoePrice,

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
                                    hintText: widget.description,

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
                                String imageUrl = selectedImage != null
                                    ? base64Encode(
                                        selectedImage!.readAsBytesSync())
                                    : '';

                                BlocProvider.of<HomeBloc>(context)
                                    .add(ProductUpdateEvent(ProductEntity(
                                  id: widget.id,
                                  name: _controllers.nameController.text,
                                  description:
                                      _controllers.descriptionController.text,
                                  price: price,
                                  imageUrl: '',
                                )));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 15, right: 15),
                                child: Text('UPDATE',
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 1),
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  //MAKE the Button Square
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
