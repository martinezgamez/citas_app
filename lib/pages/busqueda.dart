import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../dataAccess.dart';
import '../widgets/CitasCard.dart';

class BusquedaCitas extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BusquedaCitasState();
  }
}

class _BusquedaCitasState extends State<BusquedaCitas> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de Citas'),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          color: Colors.blueGrey,
        ),
        child: buildBody(context),
      ),
    );
  }
}

Widget buildBody(BuildContext context) {
  // TODO: get actual snapshot from Cloud Firestore
  return StreamBuilder<QuerySnapshot>(
    stream: fetchCitaPaciente('Maria'),
    //stream: fetchCitaIndice('acax20193'),

    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();

      return _buildList(context, snapshot.data.documents);
    },
  );
}

Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return ListView(
    padding: const EdgeInsets.only(top: 20.0),
    children: snapshot.map((data) => _buildListItem(context, data)).toList(),
  );
}

Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
  final record = Cita.fromSnapshot(data);

  return Padding(
    key: ValueKey(record.paciente),
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      /*
      child: ListTile(
        title: Text(record.name),
        trailing: Text(record.votes.toString()),
        onTap: () => print(record),
      )*/
      child: CitasCard(record.paciente, record.servicio, record.fechaHora.toString()),
    ),
  );
}

class Cita {
  final String paciente;
  final DateTime fechaHora;
  final String servicio;
  final DocumentReference reference;

  Cita.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['paciente'] != null),
        assert(map['fechaHora'] != null),
        assert(map['servicio'] != null),
        paciente = map['paciente'],
        fechaHora = map['fechaHora'],
        servicio = map['servicio'];

  Cita.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$paciente:$servicio>";
}
