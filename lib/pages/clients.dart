// ignore_for_file: prefer_const_literals_to_create_immutables, constant_identifier_titles, prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print

import 'package:carolclient/db/fun.dart';
import 'package:carolclient/models/NoteModel.dart';
import 'package:carolclient/pages/Save.dart';
import 'package:carolclient/pages/Edit.dart';
import 'package:flutter/material.dart';

class Clientpage extends StatefulWidget {
  static const String ROUTE = "/";

  const Clientpage({Key? key}) : super(key: key);

  @override
  State<Clientpage> createState() => _ClientpageState();
}

class _ClientpageState extends State<Clientpage> {
  @override
  Widget build(BuildContext context) {
    Fun.listz();
    return _Mylist();
  }
}

class _Mylist extends StatefulWidget {
  @override
  State<_Mylist> createState() => _MylistState();
}

class _MylistState extends State<_Mylist> {
  List<Note> notes = [];

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SaveClient(),
                )).then((value) => setState(() {
                  loaddata();
                }));
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Notas",
            style: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
          ),
        ),
        body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (_, i) => itemcreate(i),
        ));
  }

  loaddata() async {
    List<Note> aux = await Fun.listz();
    setState(() {
      notes = aux;
    });
  }

  idformat(i) {
    var id = notes[i].id;
    var str = id.toString();
    var idstr = str.substring(0, 3) +
        "-" +
        str.substring(3, 10) +
        "-" +
        str.substring(10, 11);
    return idstr;
  }

  itemcreate(int i) {
    return Card(
      child: ListTile(
        title: Text(
          notes[i].title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(notes[i].description),
        trailing: MaterialButton(
          child: Icon(
            Icons.preview,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Edit(
                      todo: Todo(
                          notes[i].title, notes[i].description, notes[i].id)),
                ));
          },
        ),
        isThreeLine: true,
      ),
    );
  }
}
