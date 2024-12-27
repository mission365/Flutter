import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/widgets/app_bar.dart';
import 'package:frontend/widgets/todo_container.dart';
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
  bool isLoading = true;

  void _showModel() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height / 2,
            color: Colors.white,
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Add your Todo",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                    ),
                  ),
                  ElevatedButton(onPressed: null, child: Text('Add'))
                ],
              ),
            ),
          );
        });
  }

  void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(api));
      var data = json.decode(response.body);
      // create a Todo object....
      data.forEach((todo) {
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
      setState(() {
        isLoading = false;
      });

      // This got error......
      // data.forEach((todo){
      //   myTodos.add(todo);
      // });
      // print (myTodos.length);
      // print(data.runtimeType);
      // print(response.body.runtimeType);
    } catch (e) {
      print(e);
    }
  }

  void delete_todo(String id) async {
    try {
      http.Response response = await http.delete(Uri.parse(api + "/" + id));

      setState(() {
        myTodos = [];
      });
      fetchData();
    } catch (e) {
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
      appBar: customAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            isLoading
                ? CircularProgressIndicator()
                : Column(
                    children: myTodos.map((e) {
                      return TodoContainer(
                        id: e.id,
                        title: e.title,
                        desc: e.desc,
                        isDone: e.isDone,
                        onPress: () => delete_todo(e.id.toString()),
                      );
                    }).toList(),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showModel();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
