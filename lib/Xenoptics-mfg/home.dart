// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:xenoptics/Login/login.dart';
import 'package:xenoptics/Login/API.dart';
import 'package:xenoptics/drawer.dart';

class home extends StatefulWidget {
  // const home({ Key? key }) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    foo();
    super.initState();
  }

  String token = 'loading...';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          'Home',
          style:
              TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.grey[900]),
      ),
      body: Text('This is home page'),
      drawer: mdrawer(),
    );
  }

  

   

  void foo() async {
    //print("Getting the token ....");
    final tokenx = await Auth().getUserData();
    print("Get token finish----");
    print(tokenx);
    setState(() {
      token = tokenx;
    });
  }
}
