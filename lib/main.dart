import 'package:flutter/material.dart';


import './pages/principal.dart';
import './pages/citas.dart';
import './pages/pruebaFB.dart';
import './pages/verCitas.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {
        '/': (BuildContext context) => Principal(),
        '/nuevacita': (BuildContext context) => CitasForm(),
        '/pruebaFB': (BuildContext context) => PruebaFB(),
        '/visorCitas': (BuildContext context) =>VisorCitas(),
      },

      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      title: 'Citas Medicas',
    );
  }
}