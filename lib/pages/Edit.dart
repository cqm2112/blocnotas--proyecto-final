// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carolclient/db/fun.dart';
import 'package:carolclient/pages/clients.dart';

class Todo {
  final String title;
  final String description;
  final int id;

  Todo(this.title, this.description, this.id);
}

class Edit extends StatelessWidget {
  //Declara un campo que contenga la clase Todo
  final Todo todo;

  // En el constructor, se requiere el objeto Todo
  Edit({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Usa el objeto Todo para crear nuestra UI
    return Scaffold(
      appBar: AppBar(
        leading: MaterialButton(
          child: Icon(Icons.delete),
          onPressed: () {
            Fun.delete(todo.id);
            Navigator.pushNamed(context, Clientpage.ROUTE);
          },
        ),
        backgroundColor: Colors.grey,
        title: Text(todo.title,
            style: TextStyle(color: Colors.black, fontFamily: 'Roboto')),
      ),
      body: Container(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Form(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // ignore: prefer_const_constructors

              initialValue: todo.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
              decoration: InputDecoration(),
            ),
            TextFormField(
              // ignore: prefer_const_constructors
              initialValue: todo.description,
              minLines: 40,
              maxLines: null,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
          ]),
        ),
      )),
    );
  }
}
