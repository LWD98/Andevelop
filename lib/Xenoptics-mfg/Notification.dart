// ignore_for_file: avoid_web_libraries_in_flutter, file_names

import 'package:flutter/material.dart';
import 'package:xenoptics/drawer.dart';

class notification extends StatefulWidget {
  //const notification({ Key? key }) : super(key: key);

  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          'Notification',
          style:
              TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.grey[900]),
      ),
      drawer: mdrawer(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10,20,1,1),
        child: Text('Notification List',style: TextStyle(fontSize: 15,color: Colors.grey[900],fontWeight: FontWeight.bold),),
      )
    );
  }
}