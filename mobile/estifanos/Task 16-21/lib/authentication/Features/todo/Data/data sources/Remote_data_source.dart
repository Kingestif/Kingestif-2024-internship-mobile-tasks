import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../Core/error/exception.dart';
import '../../../../Core/constants/constants.dart';
import '../models/Auth_Model.dart';

abstract class AuthRemoteDataSource {
  Future<String> logInUser(String email, String password);
  Future<void> signUpUser(String name, String email, String password);
  Future<void> logOutUser();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final http.Client client;   //Create instance of http client since we will be sending REQUEST to server
  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<String> logInUser (String email, String password) async {
    final response = await client.post(Uri.parse(newUrls.loginUserUrl(email, password)),

        // this will store on the JSON
        body: jsonEncode({
          'email': email,
          'password': password
        }), headers: {
          'Content-Type': 'application/json',
        }
    );

    if(response.statusCode == 201) {
      final access_token = json.decode(response.body)['data']['access_token'];

      // we need to store our Token to our sharedPreference so that we can access it locally AND also we can delete it when we Logout, SO instead of making 'local_data_source' folder just done it below
      var pref = await SharedPreferences.getInstance();
      pref.setString('Token', access_token);

      return access_token;
    }else{
      throw ServerException();
    }
  }

  @override
  Future<void> logOutUser() {
    // TODO: implement logOutUser
    throw UnimplementedError();
  }

  @override
  Future<void> signUpUser(String name, String email, String password) async {
    final response = await client.post(Uri.parse(newUrls.signupUserUrl(name, email, password)),

     // store user information on the JSON usig below
     body: jsonEncode({
       'name':name,
       'email': email,
       'password': password
     }), headers: {
          'Content-Type': 'application/json',
        }
    );

    if(response.statusCode == 201) {
      final data = json.decode(response.body)['data'];
    }else{
      throw ServerException();
    }
  }

  // on signup we send name, email, and password to API to be stored then it return us response 'json.decode' will change it to dart object
}

