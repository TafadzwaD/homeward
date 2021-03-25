import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';
import 'package:homeward/utilities/configurations.dart';

String _bearerToken;
bool _isLoggedIn;
class AuthProvider extends ChangeNotifier {



  AuthProvider(){
    _init();
  }

  _init(){
    _isLoggedIn = false;

  }

  Dio dio = new Dio();

  Options opts = Options(headers: {
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/json',

  });

  Future login({String email, String password}) {
    return dio.post(
      '${APIEndpoint.loginUrl }',
    options: opts,
    data: {
    "email": email,
    "password": password,
    },
    ).then((response) {
      if (response.statusCode == 201) {


        _bearerToken = response.data['token'];

        _isLoggedIn = true;
        notifyListeners();
      } else {
        print('This is the response $response');
      }
    }).catchError((onError){
      print('Error encountered : ${onError.message}');
    });
  }

  bool get isLoggedIn => _isLoggedIn;
  String get bearerToken => _bearerToken;
}