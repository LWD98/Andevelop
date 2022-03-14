import 'package:flutter/material.dart';

class tracking extends StatefulWidget {
  //const tracking({ Key? key }) : super(key: key);

  @override
  _trackingState createState() => _trackingState();
}

class _trackingState extends State<tracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'Tracking',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.grey[900]),
        ),
      
    );
  }
}