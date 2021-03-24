import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';
import 'package:homeward/utilities/configurations.dart';


class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _bearerToken;

  Dio dio = new Dio();

  Options opts = Options(headers: {
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/json',

  });

  Future signInUser({String email, String password}) {
    return dio.post(
      '${APIEndpoint.loginUrl }',
    options: opts,
    data: {
    "email": email,
    "password": password,
    },
    ).then((response) {
      if (response.statusCode == 200) {
        Map returnedResponse = response.data;
        print('Status code ${response.statusCode}');
        _bearerToken = response.data['token'];
        print('This is the bearer roken $_bearerToken');

        var message = returnedResponse['message'];
        // _customerId = returnedResponse['id_customer'];
        // _email = email;
        print(response.data);
        print(message);

        // print(email);
        // print(_customerId);

        if (message.contains('Client Account Logged in')) {
          return 'successful';
        } else {
          return 'Wrong Password or Phone Number';
        }
      } else {
        return 'Error Encountered . Check your network';
      }
    });
  }
}