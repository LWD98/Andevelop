import 'package:flutter/material.dart';

class report extends StatefulWidget {
  //const report({ Key? key }) : super(key: key);

  @override
  _reportState createState() => _reportState();
}

class _reportState extends State<report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'Report',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.grey[900]),
        ),
      
    );
  }
}