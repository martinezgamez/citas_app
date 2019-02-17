import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  String _servicio;
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

  var _pacientes = [
    'Pepe',
    'Manolo',
    'Juan',
    'Paco',
  ];
  var _servicios = [
    'Oftalmologia',
    'Dermatologia',
    'Maxilofacial',
    'Reuma',
  ];

  var currentItemSelectedPaciente = 'Pepe';
  var currentItemSelectedServicio = 'Oftalmologia';

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

  Widget _builTitle() {
    //_paciente = null;
    return Text(
        _paciente != null ? 'Nueva Cita para $_paciente' : 'Nueva Cita');
  }

  Widget _buildDropDown(List<String> array, String variable) {
    return DropdownButton<String>(
      items: array.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(
            dropDownStringItem,
            style: TextStyle(fontSize: 20.0),
          ),
        );
      }).toList(),
      onChanged: (String newValueSelected) {
        setState(() {
          this.currentItemSelectedPaciente = newValueSelected;
          variable = newValueSelected;
        });
      },
      value: this.currentItemSelectedPaciente,
      //value: variable.toString()!=null ? '':variable.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: _builTitle(),
      ),
      body: Form(
        child: Container(
          child: Column(children: <Widget>[
            _buildPacienteTextField(),

            //_buildDropDown(_pacientes, _paciente),
            //Desplegable de pacientes

            DropdownButton<String>(
              items: _pacientes.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: TextStyle(fontSize: 20.0),
                  ),
                );
              }).toList(),
              onChanged: (String newValueSelected) {
                setState(() {
                  this.currentItemSelectedPaciente = newValueSelected;
                  _paciente = newValueSelected;
                });
              },
              value: this.currentItemSelectedPaciente,
            ),

            //new Text('Fecha Seleccionada: ${_date.toString()}'),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: new RaisedButton(
                  child: Text('Selecciona Fecha'),
                  onPressed: () {
                    _selectDate(context);
                  }),
            ),
            new Text(
                'Cita programada para el ${_date.day}/${_date.month}/${_date.year}'),

            //Desplegable de servicios

            DropdownButton<String>(
              items: _servicios.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: TextStyle(fontSize: 20.0),
                  ),
                );
              }).toList(),
              onChanged: (String newValueSelected) {
                setState(() {
                  this.currentItemSelectedServicio = newValueSelected;
                  _servicio = newValueSelected;
                });
              },
              value: this.currentItemSelectedServicio,
            ),

            TextFormField(
              decoration: InputDecoration(labelText: 'Paciente'),
              onSaved: (String value) {
                setState(() {
                  //_paciente = value;
                  //value = _builTitle().toString();
                });
              },
            ),
          ]),
        ),
      ),
    );
  }
}
