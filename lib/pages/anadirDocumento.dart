import 'package:flutter/material.dart';


class GestorDocumentos extends StatefulWidget{
  final String cita;

  const GestorDocumentos(this.cita);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GestorDocumentosState(this.cita);
  }

}

class _GestorDocumentosState extends State<GestorDocumentos>{
  final String cita;

  _GestorDocumentosState(this.cita);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Gestor de Documentos cita: ${cita}'),),
      body: Text('gestor de documentos'),
    );
  }


}