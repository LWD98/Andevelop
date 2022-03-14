import 'package:flutter/material.dart';
import 'package:xenoptics/drawer.dart';

class setting extends StatefulWidget {
  //const setting({ Key? key }) : super(key: key);

  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          'Seeting',
          style:
              TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.grey[900]),
      ),
      drawer: mdrawer(),
    );
  }
}