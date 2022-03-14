import 'package:flutter/material.dart';
import 'package:xenoptics/drawer.dart';

class engineering extends StatefulWidget {
  //const engineering({ Key? key }) : super(key: key);

  @override
  _engineeringState createState() => _engineeringState();
}

class _engineeringState extends State<engineering> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          'Engineering Control',
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
                Navigator.pushNamed(context, '/BOM');
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: const AssetImage('bom.png'),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                 const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'BOM List',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

            const SizedBox(width: 17,),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/track');
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: const AssetImage('router.png'),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                 const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Tracking',
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
