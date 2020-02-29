import 'package:citas_app/pages/anadirDocumento.dart';
import 'package:flutter/material.dart';


import './pages/principal.dart';
import './pages/citas.dart';
import './pages/pruebaFB.dart';
import './pages/verCitas.dart';
import './pages/busqueda.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String _cita;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {
        '/': (BuildContext context) => Principal(),
        '/nuevacita': (BuildContext context) => CitasForm(),
        '/pruebaFB': (BuildContext context) => PruebaFB(),
        '/visorCitas': (BuildContext context) =>VisorCitas(),
        '/busqueda': (BuildContext context) =>BusquedaCitas(),
        '/gestorDocumentos': (BuildContext context) =>GestorDocumentos(_cita),
      },


      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      title: 'Citas Medicas',
    );
  }
}