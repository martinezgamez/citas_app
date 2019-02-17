import 'package:flutter/material.dart';

class CitasCard extends StatelessWidget {
  final String paciente;
  final String servicio;

  CitasCard(this.paciente, this.servicio);

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
              size: 30.0,
            ),
            title: Text(
              paciente,
              style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Pacifico'),
            ),
            subtitle: Text(
              servicio,
            ),

          ),
          IconButton(
            icon: Icon(Icons.attachment, color: Colors.deepOrange, size:30.0,),
            onPressed: (){},
          ),
          Divider(color: Colors.deepOrange,indent: 16.0,)
        ],
      ),
    );
  }
}
