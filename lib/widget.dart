import 'package:flutter/material.dart';


import 'frontScreen.dart';


Widget appBarMain(BuildContext context){
  return AppBar(
    leading: IconButton(icon: Icon(Icons.arrow_back),
    onPressed: (){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignIn()));
    },),
    title: Text('Conversion App',
    style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.white
    ),),
    backgroundColor: Colors.purple[300],
    elevation: 4,
    centerTitle: true,

  );
}

InputDecoration textFieldInputDecoration( String hintText){
  return InputDecoration(

    hintText: hintText,
    hintStyle: textFieldStyle(),

      border: InputBorder.none




  );

}

TextStyle textFieldStyle(){
  return TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.grey[800]
  );
}

BoxDecoration containerDecoration(){
  return BoxDecoration(

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

  );
}

