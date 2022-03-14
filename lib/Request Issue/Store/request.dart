import 'package:flutter/material.dart';

class request extends StatefulWidget {
  //const request({ Key? key }) : super(key: key);

  @override
  _requestState createState() => _requestState();
}

class _requestState extends State<request> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'Store Request List',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.grey[900]),
        ),
      
    );
  }
}