import 'package:citas_app/pages/anadirDocumento.dart';
import 'package:flutter/material.dart';

class CitasCard extends StatelessWidget {
  final String paciente;
  final String servicio;
  final String fechaProgramada;

  CitasCard(this.paciente, this.servicio, this.fechaProgramada);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Colors.blueGrey,
              size: 40.0,
            ),
            title: Text(
              paciente,
              style: TextStyle(
                  fontWeight: FontWeight.w400, fontFamily: 'Pacifico', fontSize: 30.0),
            ),
            subtitle: Text(
              servicio,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.attachment,
              color: Colors.deepOrange,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          GestorDocumentos(paciente)));
            },
          ),
          Divider(
            color: Colors.deepOrange,
            indent: 16.0,
          )
        ],
      ),
    );
  }
}
