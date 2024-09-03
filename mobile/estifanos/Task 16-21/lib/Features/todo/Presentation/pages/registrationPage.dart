// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/Features/todo/Presentation/bloc/Auth/auth_bloc.dart';
import 'getStartedPage.dart';
import 'home.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late UserFormControllers _controllers;
  bool _isPasswordVisible = true;
  bool _ischecked = false;

  void initState() {
    super.initState();
    _controllers = UserFormControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.blue,
                            width: 1,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          'ECOM',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SignedUpState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Signup Successful')));

              Navigator.pushNamed(context, '/second');
            } else if (state is SignUpFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Failed to Signup')));
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is SigningUpState) {
              return Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              'Create your Account',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Name',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 20),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: _controllers.nameController,
                              decoration: InputDecoration(
                                filled: true,
                                hintText: 'ex: jon smith',
                                fillColor: Color(0x8808080),
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  //To style Placeholder Text
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Email',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 20),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: _controllers.emailController,
                              decoration: InputDecoration(
                                filled: true,
                                hintText: 'ex: jon.smith@email.com',
                                fillColor: Color(0x8808080),
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  //To style Placeholder Text
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Password',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: _controllers.passwordController,
                              obscureText: _isPasswordVisible,
                              decoration: InputDecoration(
                                  filled: true,
                                  hintText: '************',
                                  fillColor: Color(0x8808080),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    //To style Placeholder Text
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                  )),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Confirm Password',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 5),
                            TextField(
                              controller: _controllers.confirmController,
                              obscureText: _isPasswordVisible,
                              decoration: InputDecoration(
                                  filled: true,
                                  hintText: '************',
                                  fillColor: Color(0x8808080),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    //To style Placeholder Text
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                  )),
                            ),
                            SizedBox(height: 50),
                            CheckboxListTile(
                                title: RichText(
                                  text: TextSpan(
                                    text: 'I understood the ',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                    children: [
                                      TextSpan(
                                        text: 'terms & policy',
                                        style: TextStyle(
                                          color: Colors.blue, // Link color
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration
                                              .underline, // Underline for link effect
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            print('check');
                                            // Navigator.push(context, route)
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                                value: _ischecked,
                                onChanged: (bool? value) {
                                  // Unlike Icons the setState must be wrapped by function
                                  setState(() {
                                    _ischecked = !_ischecked;
                                  });
                                }),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () {
                                  final name = _controllers.nameController.text;
                                  final email =
                                      _controllers.emailController.text;
                                  final password =
                                      _controllers.passwordController.text;

                                  final confirm =
                                      _controllers.confirmController.text;

                                  if (password == confirm &&
                                      password.length >= 8 &&
                                      _ischecked) {
                                    //(MAIN), Triggers Signup logic on our Bloc
                                    var signup =
                                        BlocProvider.of<AuthBloc>(context);
                                    signup.add(
                                        SignupEvent(name, email, password));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text('Sign Up Failed')));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  'SIGN UP',
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                            Container(
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                  text: 'Have an account? ',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  children: [
                                    TextSpan(
                                      text: 'SIGN IN',
                                      style: TextStyle(
                                        color: Colors.blue, // Link color
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration
                                            .underline, // Underline for link effect
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    GetStartedPage()),
                                          );
                                          // Navigator.push(context, route)
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            );
          },
        ));
  }
}

class UserFormControllers {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmController;

  UserFormControllers()
      : nameController = TextEditingController(),
        emailController = TextEditingController(),
        passwordController = TextEditingController(),
        confirmController = TextEditingController();

  // Dispose method to clean up the controllers
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
  }
}
