import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {

  final foodName;
  ResultScreen({this.foodName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${foodName}',
                style: TextStyle(
                    fontSize: 30.0
                ),)
            ],
          ),
        ),
      ),
    );
  }
}