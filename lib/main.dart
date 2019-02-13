import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './pages/principal.dart';
import './pages/citas.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {
        '/': (BuildContext context) => Principal(),
        '/nuevacita': (BuildContext context) => CitasForm(),
      },
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      title: 'Citas Medicas',
    );
  }
}