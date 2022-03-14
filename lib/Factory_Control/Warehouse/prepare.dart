import 'package:flutter/material.dart';



class Prepare{
  
}

class prepare extends StatefulWidget {
  //const prepare({ Key? key }) : super(key: key);

  @override
  _prepareState createState() => _prepareState();
}

class _prepareState extends State<prepare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'Prepare Material',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.grey[900]),
        ),
      
    );
  }
}