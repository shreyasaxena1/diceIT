import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            'DiceIT',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;
 void changeDiceFace(){
   leftDiceNumber = Random().nextInt(6) + 1;
   rightDiceNumber = Random().nextInt(6) + 1;
 }
  @override
  Widget build(BuildContext context) {
    //hot reload start here
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            //flex = 2 // take twice space
            child: TextButton(
              // come with already 16.00 padding
              onPressed: () {
                setState(() {
                  changeDiceFace();
                }); //anonymous function
              },
              child: Image(
                //width: 200.0, not suitable for more than one devices
                image: AssetImage('images/dice$leftDiceNumber.png'),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
                onPressed: () {
                  setState(() {
                    changeDiceFace();
                  });
                },
                child: Image.asset('images/dice$rightDiceNumber.png')),
          ),
        ],
      ),
    );
  }
}

//stateless state not really meant to change instead we use stateful

/*
class DicePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) { //hot reload start here
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            //flex = 2 // take twice space
            child: TextButton(
              // come with already 16.00 padding
              onPressed: (){  //anonymous function
                print('left pressed');
              },
              child: Image(
                //width: 200.0, not suitable for more than one devices
                image: AssetImage('images/dice4.png'),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed:(){
                print('right pressed');
              },
                child: Image.asset('images/dice2.png')
            ),
          ),
        ],
      ),
    );
  }
}
*/
