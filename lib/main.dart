import 'package:flut/dhur.dart';
import 'package:flut/kattha.dart';

import 'package:flut/widget.dart';
import 'package:flutter/material.dart';

import 'bigha.dart';
import 'frontScreen.dart';

void main() {
  runApp(MyApp(

  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      color: Colors.white,
      debugShowCheckedModeBanner: false,

      home: SignIn(),
    );
  }
}