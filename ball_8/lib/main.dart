// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:Text('ASK ME ANYTHING',
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        ),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
 int ballno=1;
String message='';
 void changeball(){
  setState((){
    ballno=Random().nextInt(5)+1;
    
  });
 }
  @override
  Widget build(BuildContext context) {
    return Center(
      
      child:Column(
        children:<Widget>[
          
         Container(
          height: 100.0,
          width: double.infinity,
  margin: EdgeInsets.all(10.0),
  child: TextField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Type a message',
    ),

)
      ),
          Expanded(
          child: TextButton(
        onPressed:() {
          changeball();
        },
        child:Image.asset('images/ball$ballno.png'),
      ),
          ),
        ],
      ),
    );
  }

}