import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          brightness: Brightness.light,
          title: Text(
            "Your profile",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: Text(
            " Under Development",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
