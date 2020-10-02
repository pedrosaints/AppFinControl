import 'package:FinControl/components/transaction_auth_dialog.dart';
import 'package:FinControl/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';


void main() {
  runApp(FinControlApp());
}

class
FinControlApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          )
      ),
      home: Home(),
    );
  }
}

