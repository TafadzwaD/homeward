import 'package:flutter/material.dart';
import 'package:homeward/providers/authentication_provider.dart';

class BlogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Bearer token in blogs ${AuthProvider().bearerToken}');
    return Scaffold(
      body: Text('Hello'),
    );
  }
}
