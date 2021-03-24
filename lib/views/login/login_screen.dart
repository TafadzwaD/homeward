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
  bool _isLoading = false; //Login Button State

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
                  borderRadius: BorderRadius.circular(20),
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
                        name: 'email',
                        decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: '***@***.**',
                            prefixIcon: Icon(Icons.email_outlined,size: 30,),
                            hintStyle: hintTextStyle,
                            labelStyle: hintTextStyle,
                            errorStyle: errorTextStyle,
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(5.0))),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.email(context,
                              errorText:
                              'Enter Valid Email'),
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
                            prefixIcon: Icon(Icons.lock_outline,size: 30,),
                            labelStyle: hintTextStyle,
                            errorStyle: errorTextStyle,
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(5.0))),

                        obscureText: true,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.minLength(context, 6,
                              errorText:
                              'Should not be less than 5 characters'),
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _isLoading = true;
                        });

                      },
                      child: Card(
                        elevation: 50,


                        child:Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.teal, mainThemeColor])),
                          child: LoadingElevatedButton(
                            isLoading: _isLoading,
                            disabledWhileLoading: true,
                            child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        )),
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
