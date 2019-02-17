import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './widgets/CitasCard.dart';

Widget buildBody(BuildContext context) {
  // TODO: get actual snapshot from Cloud Firestore
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('baby/C2L0o8pK1vRWZ3tVlxkB/citas').snapshots(),
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
  final record = Record.fromSnapshot(data);

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
      child: CitasCard(record.paciente, record.servicio),
    ),
  );
}

class Record {
  final String paciente;
  final DateTime fechaHora;
  final String servicio;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['Paciente'] != null),
        assert(map['FechaHora'] != null),
        assert(map['Servicio'] != null),
        paciente = map['Paciente'],
        fechaHora = map['FechaHora'],
        servicio = map['Servicio'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$paciente:$servicio>";
}
