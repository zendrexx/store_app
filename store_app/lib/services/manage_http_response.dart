import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void manageHttpResponse({
  required http.Response response, //the HTTp response from the request
  required BuildContext context, //to show the snackbar
  required VoidCallback onSuccess, //callback for success
}) {
  //Switch statement to handle different HTTP status codes
  switch (response.statusCode) {
    case 200: //Successfull
      onSuccess(); //call the success callback
      break;
    case 201: //Created Successfull
      onSuccess();
      break;
    case 400: //Bad Request
      showSnackBar(context, json.decode(response.body)['msg']);
      break;
    case 500: //Internal Server Error
      showSnackBar(context, json.decode(response.body)['error']);
      break;

    default:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Unexpected Error: ${response.statusCode}')),
      );
  }
}

void showSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}
