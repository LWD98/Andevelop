import 'package:flutter/material.dart';

class unpack extends StatefulWidget {
  //const unpack({ Key? key }) : super(key: key);

  @override
  _unpackState createState() => _unpackState();
}

class _unpackState extends State<unpack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'Unpack',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.grey[900]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(9.0),
          child: ExpansionTile(
            leading: Image(image: AssetImage('receive.png')),
            title: Text('Receive Material Form',style: TextStyle(fontSize: 17,fontWeight: FontWeight.normal),),
            children: [
              Column(
                children: [
                  Text('Receive material issue',textAlign: TextAlign.left, style: TextStyle(fontSize: 15,))
                ],
              )
            ],
          ),
        ),
      
    );
  }
}