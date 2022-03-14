import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xenoptics/drawer.dart';

class engineer extends StatefulWidget {
  //const engineer({ Key? key }) : super(key: key);

  @override
  _engineerState createState() => _engineerState();
}

class _engineerState extends State<engineer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          'Engineering Request',
          style:
              TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.grey[900]),
      ),
      drawer: mdrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/newMaterial');
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: const AssetImage('add.png'),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'New Material',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

            const SizedBox(width: 17,),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/newBOM');
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: const AssetImage('new.png'),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'New BOM',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

            const SizedBox(width: 17,),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/transformation');
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: const AssetImage('transformation.png'),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Transformation',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

            const SizedBox(width: 17,),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/checkList');
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: const AssetImage('request.png'),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Request List',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}