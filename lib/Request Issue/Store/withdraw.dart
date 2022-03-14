import 'dart:html';

import 'package:flutter/material.dart';

class withdraw extends StatefulWidget {
  //const withdraw({ Key? key }) : super(key: key);

  @override
  _withdrawState createState() => _withdrawState();
}

class _withdrawState extends State<withdraw> {
  final _input = TextEditingController();
  late TextEditingController _controller;
   @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          'Withdraw',
          style:
              TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.grey[900]),
      ),
      body: Padding(
          padding: EdgeInsets.all(9),
          child: ExpansionTile(
            title: Text(
              'Inventory Check Out Request Form',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            leading: Image(image: AssetImage('withdraw.png')),
            children: [
              Column(
                children: [
                  ListTile(
                    title: Text(
                      'New request issue',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(height: 1,color: Colors.grey[200],)
                  
                ],
              )
            ],
          )),
    );
  }
}
