import 'package:flutter/material.dart';

AppBar customAppBar(){
  return AppBar(
    title: Text("Todos with Flutter and Django",
      style: TextStyle(
        color: Colors.white
      ),
    ),
    centerTitle: true,
    backgroundColor: Color(0xFF001133),
  );
}