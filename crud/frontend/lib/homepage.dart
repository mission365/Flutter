import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'constants/api.dart';
import 'models/todo.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> myTodos = [];
  void fetchData() async{
    try{
      http.Response response = await http.get(Uri.parse(api));
      var data = json.decode(response.body);
      // create a Todo object....
      data.forEach((todo){
        Todo t = Todo(
            id: todo['id'],
            title: todo['title'],
            desc: todo['desc'],
            date: todo['date'],
            isDone: todo['isDone'],
        );
        myTodos.add(t);
      });
      print(myTodos.length);

      // This got error......
      // data.forEach((todo){
      //   myTodos.add(todo);
      // });
      // print (myTodos.length);
      // print(data.runtimeType);
      // print(response.body.runtimeType);
    } catch(e){
      print(e);
    }
  }
  @override
  void initState() {
    fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
