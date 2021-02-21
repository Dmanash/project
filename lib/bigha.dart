import 'package:flut/widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class Bigha extends StatefulWidget{
  @override
  _BighaState createState() => _BighaState();
}

class _BighaState extends State<Bigha> {


  String _bighaResult = '';

  TextEditingController _name = new TextEditingController();
  TextEditingController _bigha = new TextEditingController();
  TextEditingController _kattha = new TextEditingController();
  TextEditingController _dhur = new TextEditingController();

  String validateField(value){
    if (value.isEmpty) {

      return 'If 0, Enter 0';

    } else {

      return null;
    }

  }





  final resultDisplayFormKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {



    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarMain(context),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: _name,
                      decoration: textFieldInputDecoration('Name'),

                    ),
                  ),
                  SizedBox(height: 40,),
                  Form(
                    key: resultDisplayFormKey,
                    child: Container(

                      child: Column(
                        children: [
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 7),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height:45,
                              width: 200,
                              child:  Text('Calculate in Bigha',
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
                          SizedBox(height: 15,),
                          Container(
                            width: 350,

                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(


                              color: Colors.white,
                              //borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.pink,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _bigha,
                              decoration: InputDecoration(

                                  hintText: 'Bigha',
                                  border: InputBorder.none


                              ),
                              validator: validateField,
                              keyboardType: TextInputType.number,
                            ),
                            //keyboardType: TextInputType.number,
                          ),
                          SizedBox(height:20),
                          Container(
                            width: 350,

                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(


                              color: Colors.white,
                              //borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.pink,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _kattha,
                              decoration: InputDecoration(

                                  hintText: 'Kattha',
                                  border: InputBorder.none


                              ),
                              validator: validateField,
                              keyboardType: TextInputType.number,
                            ),
                            //keyboardType: TextInputType.number,
                          ),
                          SizedBox(height:20),

                          Container(
                            width: 350,

                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(


                              color: Colors.white,
                              //borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.pink,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _dhur,
                              decoration: InputDecoration(

                                  hintText: 'Dhur',
                                  border: InputBorder.none


                              ),
                              validator: validateField,
                              keyboardType: TextInputType.number,
                            ),
                            //keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 15),
                          FlatButton(
                            onPressed: handleCalculation,



                            child: Text('Calculate'),
                            color: Colors.pinkAccent,
                            textColor: Colors.white,

                          ),

                        ],
                      ),
                      height:400,
                      width: 380,
                      decoration: containerDecoration(),
                    ),
                  ),
                  SizedBox(height: 20,),
                  bighaCalculationResult(_bighaResult),


                ],
              ),
            ),

          ),
        )
    );
  }
  Widget bighaCalculationResult(bighaResult){
    bool canShow = false;
    String _bighaResult = bighaResult;



    if (_bighaResult.length > 0 ){
      canShow = true;
    } return Container(
      height: 100,
      width: 250,
      decoration: BoxDecoration(

        color: Colors.white,
        border: Border.all(
          color: Colors.orange,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.green,
            blurRadius: 7,
            offset: Offset(-5, 10,),
          ),
        ],

      ),
      child: canShow ? Column(
        children: [
          Text('Hello' + '  ' + _name.text , style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),
          ),
          SizedBox(height: 10,),
          Container(
            child: Text('Your Total land Calculation is : ', style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),),
          ),
          SizedBox(height: 10,),
          Container(
            child: Text(_bighaResult + ' Bigha',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),),
          ),
          Container(
            child: Text('You are also a millionare ', style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),),
          ),
        ],
      ) : Container(),
    );
  }

  void handleCalculation(){

    if (resultDisplayFormKey.currentState.validate()) {
      double R = 0.0;
      num B = int.parse(_bigha.text) ;
      num K = int.parse(_kattha.text) ;
      num D = int.parse(_dhur.text) ;

      R = ((B * 1) +  0.05 * K + 0.0025 * D)   ;

      _bighaResult = R.toStringAsFixed(2);

      setState(() {

      });





    }
    else print ('Please provide full data');
  }


  }








