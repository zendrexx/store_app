import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:store_app/global_variables.dart';
import 'package:store_app/models/users.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/services/manage_http_response.dart';
import 'package:store_app/views/screens/authentication_screens/login_screen.dart';
import 'package:store_app/views/screens/main_screen.dart';

class AuthController {
  Future<void> signUpUsers({
    required context,
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
      User user = User(
        id: '',
        fullName: fullName,
        email: email,
        state: '',
        city: '',
        locality: '',
        password: password,
        token: '',
      );
      http.Response response = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(), //convert the user object to a json string
        headers: <String, String>{
          //set the header for the request
          "Content-Type":
              'application/json; charset=UTF-8', //set the content type to json
        },
      );
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
          showSnackBar(context, 'Account created successfully');
        },
      );
    } catch (e) {
      print("Error: $e");
    }
  }

  //sign in users function
  Future<void> signInUsers({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }), //convert the user object to a json string
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );

      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
            (route) => false, // Remove all previous routes
          );
          showSnackBar(context, 'Loged in successfully');
        },
      );
    } catch (e) {
      print("Error: $e");
    }
  }
}
