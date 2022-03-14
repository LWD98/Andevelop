import 'package:flutter/material.dart';

class transaction extends StatefulWidget {
  //const transaction({ Key? key }) : super(key: key);

  @override
  _transactionState createState() => _transactionState();
}

class _transactionState extends State<transaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'View Transaction',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.grey[900]),
        ),
      
    );
  }
}