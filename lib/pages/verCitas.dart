import 'package:flutter/material.dart';

import '../widgets/CitasCard.dart';
import '../dataAccess.dart';

class VisorCitas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Visor Citas'),
      ),
      body: Container(
        //child: CitasCard('Pablo','Oftalmologia'),
        child: buildBody(context) ,
      ),
    );
  }
}
