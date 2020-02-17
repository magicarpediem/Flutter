import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[300],
          title: Text('Magikarp'),
        ),
        backgroundColor: Colors.red[200],
        body: Center(
          child: Image(
            image: AssetImage('images/129.png'),
          ),
        ),
      ),
    ),
  );
}
