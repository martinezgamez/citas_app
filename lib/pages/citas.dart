import 'package:flutter/material.dart';
import 'package:async/async.dart';

class CitasForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CitasFormState();
  }
}

class _CitasFormState extends State<CitasForm> {
  String _paciente;
  DateTime _fecha;
  String _consulta;
  String _lugar;

  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2020));

    if (picked != null && picked != _date) {
      print('Data selected: ${_date.toString()}');
      setState(() {
        _date = picked;
      });
    }
  }

  var _pacientes = ['Antonio', 'Mamen', 'Pablo Antonio', 'Elisa'];
  var currentItemSelected = 'Antonio';

  Widget _buildPacienteTextField() {
    return TextFormField(
      //initialValue: _paciente,
      decoration: InputDecoration(labelText: 'Paciente'),
      onSaved: (String value) {
        setState(() {
          //_paciente = value;
          value = _paciente;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Cita $_paciente'),
      ),
      body: Form(
        child: Container(
          child: Column(children: <Widget>[
            _buildPacienteTextField(),
            DropdownButton<String>(
              items: _pacientes.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String newValueSelected) {
                setState(() {
                  this.currentItemSelected = newValueSelected;
                  _paciente = newValueSelected;
                });
              },
              value: currentItemSelected,
            ),
            new Text('Fecha Seleccionada: ${_date.toString()}'),
            new RaisedButton(
                child: Text('Selecciona Fecha'),
                onPressed: () {
              _selectDate(context);
            }),
            TextFormField(
              decoration: InputDecoration(labelText: 'Paciente'),

              onSaved: (String value) {
                setState(() {
                  //_paciente = value;
                  value = _paciente;
                });
              },

            )
          ]),
        ),
      ),
    );
  }
}
