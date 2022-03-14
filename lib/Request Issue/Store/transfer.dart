import 'dart:html';

import 'package:flutter/material.dart';

class transfer extends StatefulWidget {
  //const transfer({ Key? key }) : super(key: key);

  @override
  _transferState createState() => _transferState();
}

class _transferState extends State<transfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'Transfer',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.grey[900]),
        ),
      body: const Padding(
        padding: EdgeInsets.all(9),
        child: ExpansionTile(
          title: Text('Transfer Request Form',style: TextStyle(fontSize: 17),),
          leading: Image(image: AssetImage('transfer.png')),
        ),
      ),
    );
    
  }
}