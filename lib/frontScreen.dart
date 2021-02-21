import 'dart:ui';
import 'package:flare_flutter/flare_actor.dart';

import 'package:flutter/material.dart';

import 'bigha.dart';
import 'dhur.dart';
import 'kattha.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String animationType = 'idle';

  bool isLoading = false;
  final signInFormKey = GlobalKey<FormState>();

  final regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");


  takeMeToBighaField() {
    if (signInFormKey.currentState.validate()) {
      setState(() {
        isLoading = true;

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Bigha()));
      });
    }
  }

  takeMeToKatthaField() {
    if (signInFormKey.currentState.validate()) {
      setState(() {
        isLoading = true;

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Kattha()));
      });
    }
  }

  takeMeToDhurField() {
    if (signInFormKey.currentState.validate(


          )) {
      setState(() {
        isLoading = true;

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dhur()));
      });
    }
  }



  TextEditingController emailTextFieldController = new TextEditingController();
  final emailFocusNode = new FocusNode();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              Container(
                height: 200,
                width: 200,
                child: CircleAvatar(
                  child: ClipOval(
                    child: FlareActor('assets/images/teddy_test.flr',
                      alignment: Alignment.center,
                      fit: BoxFit.fill,
                      animation: animationType,
                    ),
                  )
                ),

              ),
              Form(
                key: signInFormKey,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.purple,
                                    blurRadius: 5,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                focusNode: emailFocusNode,
                                  controller: emailTextFieldController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.mail_outline),
                                      suffixIcon: regex.hasMatch(
                                          emailTextFieldController.text)
                                          ? Icon(Icons.check)
                                          : null,
                                      hintText: 'Email Address',
                                      border: InputBorder.none),


                                  validator: (val) {
                                    if (val.isEmpty) {
                                      setState(() {
                                        animationType = 'fail';
                                      });
                                      return 'Cannot be Empty';
                                    } else if (!regex.hasMatch(val)) {
                                      setState(() {
                                        animationType = 'fail';
                                      });
                                      return 'Enter valid email';
                                    } else {
                                      setState(() {
                                        animationType = 'success';
                                      });
                                      return null;
                                    }
                                  }),
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height:50,
                          width: 400,

                          child: Text('Tap on the calculation you want',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,

                            ),
                          ),

                          decoration: BoxDecoration(
                            color: Colors.pink[200],

                          ),
                        ),
                      ),

                      Container(

                        height: 160,
                        decoration: BoxDecoration(

                          color: Colors.white,
                          border: Border.all(
                            color: Colors.orange,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange,
                              blurRadius: 7,
                              offset: Offset(-5, 10,),
                            ),
                          ],

                        ),
                        child: Column(
                          children: [

                            Container(
                              width: double.infinity,
                              child: RaisedButton(
                                onPressed: () {
  takeMeToBighaField();
                                },
                                child: Text('Convert to Bigha'),
                                color: Colors.purple[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: double.infinity,
                              child: RaisedButton(
                                onPressed: () {
  takeMeToKatthaField();
  },
                                child: Text('Convert to Kattha'),
                                color: Colors.purple[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: double.infinity,
                              child: RaisedButton(
                                onPressed: () {
  takeMeToDhurField();
                                },
                                child: Text('Convert to Dhur'),
                                color: Colors.purple[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
