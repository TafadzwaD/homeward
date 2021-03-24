import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:homeward/utilities/utilities.dart';
import 'package:loading_elevated_button/loading_elevated_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainThemeColor,
      body: Container(
        child: Column(
          children: [
            Container(
              height: 400,

              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/homeWardLogo.png'),

                // colorFilter: ColorFilter.mode(Colors.green, blendMode)
              )),
            ),
            FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: themeBlue,
                  //     blurRadius: 20,
                  //     offset: Offset(0, 1)
                  //   )
                  // ]
                ),
                child: Column(
                  children: [
                    Card(
                      elevation: 50,
                      child: FormBuilderTextField(
                        name: 'password',
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Password',
                            hintStyle: hintTextStyle,
                            errorStyle: errorTextStyle,
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10.0))),
                        obscureText: true,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.minLength(context, 6,
                              errorText:
                              'Should not be less than 5 characters'),
                        ]),
                      ),
                    ),
                    Card(
                      elevation: 50,
                      color: Colors.white,
                      shadowColor: Colors.black,
                      child: FormBuilderTextField(
                        name: 'password',
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Password',
                            hintStyle: hintTextStyle,
                            errorStyle: errorTextStyle,
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10.0))),
                        obscureText: true,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.minLength(context, 6,
                              errorText:
                              'Should not be less than 5 characters'),
                        ]),
                      ),
                    ),
                    Card(
                      elevation: 50,
                      color: Colors.white,
                      shadowColor: Colors.black,
                      child: LoadingElevatedButton(onPressed: null, child: null),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
