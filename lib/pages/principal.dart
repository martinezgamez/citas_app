import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Citas Medicas'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButtonColumn(
                Icons.add_circle, 'Nueva Cita', context, '/nuevacita'),
            _buildButtonColumn(
                Icons.search, 'Buscar Cita', context, '/busqueda'),
            _buildButtonColumn(Icons.announcement, 'Ver Todas las citas', context, '/visorCitas')
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(
      IconData icon, String label, BuildContext context, String ruta) {
    Color color = Theme.of(context).primaryColor;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: RaisedButton(

              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              onPressed: () {
                print(label);
                Navigator.pushNamed(context, ruta);
              }),
        )
      ],
    );
  }
}
