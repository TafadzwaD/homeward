import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homeward/providers/authentication_provider.dart';
import 'package:homeward/utilities/all_providers.dart';
import 'package:homeward/views/all_blogs/blogs_screen.dart';
import 'package:homeward/views/login/login_screen.dart';
import 'package:loading_elevated_button/loading_elevated_button.dart';
import 'package:provider/provider.dart';

void main(){

  loginScreen() =>  MultiProvider(
    providers: providers,
    child: MaterialApp(

      home: Consumer<AuthProvider>(
        builder: (context, state, child) {
          return state.isLoggedIn ? BlogsHomeScreen() : LoginScreen();
        },
      ),

    ),
  );


  group('Login Screen Widgets Test : ', (){
      testWidgets('Testing if 2 TextFields Show Up on the Login Screen(Email Field and Password Field)', (tester) {
         return tester.pumpWidget(loginScreen()).then((value){
            expect(find.byType(TextField),findsNWidgets(2));
          });
      });
      testWidgets('Testing if 1 Loading Elevated button for Login Show Up on the Login Screen', (tester) {
         return tester.pumpWidget(loginScreen()).then((value){
            expect(find.byType(LoadingElevatedButton),findsOneWidget);
          });
      });
  });
}

