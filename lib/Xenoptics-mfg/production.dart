import 'package:flutter/material.dart';
import 'package:xenoptics/drawer.dart';

class production extends StatefulWidget {
  //const production({ Key? key }) : super(key: key);

  @override
  _productionState createState() => _productionState();
}

class _productionState extends State<production> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          'Production Control',
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
                  Navigator.pushNamed(context, '/monitoring');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ink.image(
                      image: const AssetImage('monitoring.png'),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Monitoring',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            const SizedBox(
              width: 17,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/trace');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ink.image(
                      image: const AssetImage('trace.png'),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Traceability',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
