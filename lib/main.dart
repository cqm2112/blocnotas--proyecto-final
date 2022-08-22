// ignore_for_file: prefer_const_constructors

import 'package:carolclient/pages/Save.dart';
import 'package:carolclient/pages/clients.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Notes());
}

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Clientpage.ROUTE,
      routes: {
        Clientpage.ROUTE: (_) => Clientpage(),
      },
    );
  }
}
