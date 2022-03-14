import 'package:flutter/material.dart';

class monioring extends StatefulWidget {
  //const monioring({ Key? key }) : super(key: key);

  @override
  _monioringState createState() => _monioringState();
}

class _monioringState extends State<monioring> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'Monitoring',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.grey[900]),
        ),
      
    );
  }
}