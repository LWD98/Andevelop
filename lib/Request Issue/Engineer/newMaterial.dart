// ignore_for_file: avoid_web_libraries_in_flutter, file_names
import 'package:flutter/material.dart';

class newMaterial extends StatefulWidget {
  //const newMaterial({ Key? key }) : super(key: key);

  @override
  _newMaterialState createState() => _newMaterialState();
}

class _newMaterialState extends State<newMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'New Material',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.grey[900]),
        ),
      body: const Padding(
        padding: EdgeInsets.all(9),
        child: ExpansionTile(
          title: Text('Create Material Form',style: TextStyle(fontSize: 17),),
          leading: Image(image: AssetImage('add.png')),
        ),
      ),
    );
  }
}