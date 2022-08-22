// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:carolclient/models/NoteModel.dart';
import 'package:carolclient/pages/clients.dart';
import 'package:flutter/material.dart';
import 'package:carolclient/db/fun.dart';
import 'dart:math';

class SaveClient extends StatelessWidget {
  // ignore: constant_identifier_names
  static const String ROUTE = "/save";
  const SaveClient({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Guardar"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: _Form(),
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  final title = TextEditingController();
  final description = TextEditingController();
  final id = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(children: [
        SizedBox(
          height: 30,
        ),
        TextFormField(
          controller: title,
          decoration: InputDecoration(
              labelText: "Titulo:",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)))),
        ),
        SizedBox(
          height: 30,
        ),
        TextFormField(
          controller: description,
          minLines: 20,
          maxLines: null,
          // ignore: prefer_const_constructors
          decoration: InputDecoration(
              labelText: "description:",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)))),
        ),
        SizedBox(
          height: 30,
        ),

        // ignore: deprecated_member_use
        RaisedButton(
            child: Text("Guardar"),
            onPressed: () {
              if (_key.currentState == null || _key.currentState!.validate()) {
                var rng = Random();
                var k = rng.nextInt(100);
                print(k);

                Fun.insert(Note(
                    title: title.text, description: description.text, id: k));
                Fun.lista();
                Navigator.pushNamed(context, Clientpage.ROUTE);
              } else {
                print("Faltan campos");
              }
            })
      ]),
    );
  }
}
