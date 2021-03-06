import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './widgets/CitasCard.dart';

Widget buildBody(BuildContext context) {
  // TODO: get actual snapshot from Cloud Firestore
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('citas').snapshots(),
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

void addCita(String paciente, String servicio, DateTime fechaSolicitada) {
  String indice = paciente.substring(1, 3) +
      servicio.substring(1, 3) +
      fechaSolicitada.year.toString() +
      fechaSolicitada.month.toString();

  final DocumentReference = Firestore.instance.document("citas/${indice}");
  Map<String, dynamic> cita = <String, dynamic>{
    "paciente": paciente,
    "servicio": servicio,
    "fechaHora": fechaSolicitada,
  };


  DocumentReference.setData(cita).whenComplete(() {
    print('Anadido: ${paciente} con ${servicio}');
  }).catchError((e) => print(e));
}

fetchCitaPaciente(String paciente) {
  return Firestore.instance
      .collection("citas")
      .where('paciente', isEqualTo: paciente)
      .snapshots();
}


fetchCitaIndice(String indice) {
  return Firestore.instance.collection('citas/${indice}').snapshots();

}
