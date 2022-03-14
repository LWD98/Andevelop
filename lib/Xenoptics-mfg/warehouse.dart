import 'dart:js';

import 'package:flutter/material.dart';
import 'package:xenoptics/drawer.dart';

class warehouse extends StatefulWidget {
  //const warehouse({ Key? key }) : super(key: key);

  @override
  _warehouseState createState() => _warehouseState();
}

class _warehouseState extends State<warehouse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'Warehouse Control',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.grey[900]),
        ),
        drawer: mdrawer(),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/material');
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: const AssetImage('material.png'),
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Material',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/stock');
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: const AssetImage('stock.png'),
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Stock',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/safetys');
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: const AssetImage('safetys.png'),
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Safety Stock',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/shorts');
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: const AssetImage('shorts.png'),
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Short Stock',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/transaction');
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: const AssetImage('transaction.png'),
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Transaction',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/unpack');
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: const AssetImage('unpack.png'),
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Unpack',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/prepare');
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: const AssetImage('prepare.png'),
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Prepare',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}
