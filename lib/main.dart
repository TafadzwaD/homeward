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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          fontFamily: 'Poppins',
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Consumer<AuthProvider>(
          builder: (context, state, child) {
            print(state.isLoggedIn);
            return state.isLoggedIn ? BlogsHomeScreen() : LoginScreen();
          },
        ),
        // home: BlogsHomeScreen(),
      ),
    );
  }
}
