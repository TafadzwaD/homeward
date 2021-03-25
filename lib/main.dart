import 'package:flutter/material.dart';
import 'package:homeward/providers/authentication_provider.dart';
import 'package:provider/provider.dart';
import 'views/login/login_screen.dart';
import 'utilities/all_providers.dart';
import 'views/all_blogs/blogs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        theme: ThemeData(

          fontFamily: 'Poppins',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Consumer<AuthProvider>(
          builder: (context, state, child) {
            return state.isLoggedIn ? BlogsHomeScreen() : LoginScreen();
          },
        ),
        // home: BlogsHomeScreen(),
      ),
    );
  }
}
