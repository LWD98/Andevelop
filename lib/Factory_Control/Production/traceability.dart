import 'package:flutter/material.dart';

class traceability extends StatefulWidget {
  //const traceability({ Key? key }) : super(key: key);

  @override
  _traceabilityState createState() => _traceabilityState();
}

class _traceabilityState extends State<traceability> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'Traceability',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.grey[900]),
        ),
      
    );
  }
}