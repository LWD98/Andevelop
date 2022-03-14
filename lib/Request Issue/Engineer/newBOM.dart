// ignore_for_file: avoid_web_libraries_in_flutter, file_names
import 'package:flutter/material.dart';

class NewBOM extends StatefulWidget {
  //const NewBOM({ Key? key }) : super(key: key);

  @override
  _NewBOMState createState() => _NewBOMState();
}

class _NewBOMState extends State<NewBOM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'New BOM',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.grey[900]),
        ),
      body: const Padding(
        padding: EdgeInsets.all(9),
        child: ExpansionTile(
          title: Text('Create Bill Of Material Form',style: TextStyle(fontSize: 17),),
          leading: Image(image: AssetImage('new.png')),
        ),
      ),
    );
  }
}