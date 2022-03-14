import 'package:flutter/material.dart';
import 'package:xenoptics/drawer.dart';

class store extends StatefulWidget {
  //const store({ Key? key }) : super(key: key);

  @override
  _storeState createState() => _storeState();
}

class _storeState extends State<store> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          'Store Request',
          style:
              TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.grey[900]),
      ),
      drawer: mdrawer(),
      body: Padding(
        padding:  const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/withdraw');
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: const AssetImage('withdraw.png'),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Withdraw',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

            const SizedBox(width: 17,),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/transfer');
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: const AssetImage('transfer.png'),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Transfer',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

            const SizedBox(width: 17,),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/request');
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