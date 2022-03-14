import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:xenoptics/Login/login.dart';

import 'Login/API.dart';

class mdrawer extends StatefulWidget {
  //const mdrawer({Key? key}) : super(key: key);

  @override
  _mdrawerState createState() => _mdrawerState();
}

int selectedIndex = 0;

class _mdrawerState extends State<mdrawer> {
  @override
  void initState() {
    foo();
    super.initState();
  }

  String token = 'loading...';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/xenoptics.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Xenoptics",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        token,
                        style: const TextStyle(fontSize: 13),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      size: 30,
                      color: Colors.grey[700],
                    ),
                    title: const Text(
                      'Home',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.notifications,
                      size: 30,
                      color: Colors.grey[700],
                    ),
                    title: const Text(
                      'Notification',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/notification');
                    },
                  ),
                  ExpansionTile(
                    leading: Icon(
                      Icons.timeline,
                      size: 30,
                      color: Colors.grey[700],
                    ),
                    title: const Text(
                      'Factory Control',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.gite,
                          size: 25,
                          color: Colors.grey[700],
                        ),
                        title: const Text(
                          'Warehouse',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/warehouse');
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.precision_manufacturing,
                          size: 25,
                          color: Colors.grey[700],
                        ),
                        title: const Text(
                          'Production',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/production');
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.engineering,
                          size: 25,
                          color: Colors.grey[700],
                        ),
                        title: const Text(
                          'Engineering',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/engineering');
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.price_check,
                          size: 25,
                          color: Colors.grey[700],
                        ),
                        title: const Text(
                          'Purchase',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/purchase');
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Icon(
                      Icons.post_add,
                      size: 30,
                      color: Colors.grey[700],
                    ),
                    title: const Text(
                      'Request Issue',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.receipt_long,
                          size: 25,
                          color: Colors.grey[700],
                        ),
                        title: const Text(
                          'Store',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/store');
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.engineering_outlined,
                          size: 25,
                          color: Colors.grey[700],
                        ),
                        title: const Text(
                          'Engineer',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/engineer');
                        },
                      ),
                    ],
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      size: 30,
                      color: Colors.grey[700],
                    ),
                    title: const Text(
                      'Setting',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/setting');
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      size: 30,
                      color: Colors.grey[700],
                    ),
                    title: const Text(
                      'Logout',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                     
                      
                      showDialog(
                          context: context,
                          builder: (_) => Dialog(
                               child: AlertDialog(
                                    title: Text("Confrim!"),
                                    content: const Text("Do you want to logout?"),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text("CANCEL"),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                      TextButton(
                                        child: const Text("LOGOUT"),
                                        onPressed: () {
                                          Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                                        },
                                      ),
                                    ],
                                  ),
                                 
                                
                              ));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void foo() async {
    //print("Getting the token ....");
    final tokenx = await Auth().getUserData();
    setState(() {
      token = tokenx;
    });
  }
}
