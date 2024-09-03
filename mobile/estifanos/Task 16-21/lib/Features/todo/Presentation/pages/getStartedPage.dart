// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/Features/todo/Presentation/pages/registrationPage.dart';

import '../../../../authentication/Features/todo/Presentation/bloc/Auth/auth_bloc.dart';
import '../../../../dependency_injection.dart';
import 'home.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  late SignInFormControllers _controllers;
  bool _isPasswordVisible = true;

  void initState() {
    super.initState();
    _controllers = SignInFormControllers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoggedInState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Welcome Back')));

              Navigator.pushNamed(context, '/third');
            } else if (state is LogInFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Login Failed')));
            }
          },
          builder: (context, state) {
            if (state is LoggingInState) {
              return Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height: 200,
                      alignment:
                          Alignment.center, //important to put margins at SIDE!!
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          // color: Colors.blue,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.blue,
                                width: 3,
                              )),
                          child: Text(
                            'ECOM',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign into your Account',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Email',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.grey, fontSize: 20),
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
                              color: Colors.grey,
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
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                )),
                          ),
                          SizedBox(height: 50),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                final email = _controllers.emailController.text;
                                final password =
                                    _controllers.passwordController.text;
                                var login = BlocProvider.of<AuthBloc>(
                                    context); //!!!(MAIN)This triggers the login logic within the bloc.

                                login.add(LoginEvent(email, password));
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
                                'SIGN IN',
                              ),
                            ),
                          ),
                          SizedBox(height: 100),
                          RichText(
                            text: TextSpan(
                              text: "Don't have an account? ",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                              children: [
                                TextSpan(
                                  text: 'SIGN UP',
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
                                                RegistrationPage()),
                                      );
                                      // Navigator.push(context, route)
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            );
          },
        ),
      ),
    );
    //delete
  }
}

class SignInFormControllers {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  SignInFormControllers()
      : emailController = TextEditingController(),
        passwordController = TextEditingController();

  // Dispose method to clean up the controllers
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
