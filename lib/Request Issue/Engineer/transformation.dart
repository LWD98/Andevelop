import 'package:flutter/material.dart';

class transformation extends StatefulWidget {
  //const transformation({ Key? key }) : super(key: key);

  @override
  _transformationState createState() => _transformationState();
}

class _transformationState extends State<transformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'Transformation',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.grey[900]),
        ),
      body: const Padding(
        padding: EdgeInsets.all(9),
        child: ExpansionTile(
          title: Text('Transformation Request Form',style: TextStyle(fontSize: 17),),
          leading: Image(image: AssetImage('transformation.png')),
        ),
      ),
    );
  }
}