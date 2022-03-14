// ignore_for_file: avoid_web_libraries_in_flutter, file_names
import 'package:flutter/material.dart';

class RequestList extends StatefulWidget {
  //const RequestList({ Key? key }) : super(key: key);

  @override
  _RequestListState createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'Engineer Request List',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.grey[900]),
        ),
      
    );
  }
}