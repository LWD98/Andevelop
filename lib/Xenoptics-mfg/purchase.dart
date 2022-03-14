import 'package:flutter/material.dart';
import 'package:xenoptics/drawer.dart';

class purchase extends StatefulWidget {
  //const purchase({ Key? key }) : super(key: key);

  @override
  _purchaseState createState() => _purchaseState();
}

class _purchaseState extends State<purchase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          'Purchase Control',
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
                Navigator.pushNamed(context, '/report');
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: const AssetImage('report.png'),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'PO Report',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

            const SizedBox(width: 17,),
             InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/supplier');
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: const AssetImage('supplier.png'),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                 const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Supplier',
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