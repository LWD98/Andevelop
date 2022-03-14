import 'dart:html';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:xenoptics/Login/login.dart';

class resetPassword extends StatefulWidget {
  // const resetPassword({ Key? key }) : super(key: key);

  @override
  _resetPasswordState createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
  var email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0XFF455A64),
                Color(0XFFEF5350),
                Color(0xFFB0BEC5)
              ])),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0XFF455A64),
                Color(0XFFEF5350),
                Color(0xFFB0BEC5)
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/xenoptics.png'),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6), BlendMode.dstATop)),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Xenoptics',
                style: TextStyle(
                  color: Colors.red[50],
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 300,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 25),
                    const Text(
                      'Hello',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                   const SizedBox(height: 10),
                    const Text(
                      'Please Reset Your Password',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                   const SizedBox(height: 20),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: email,
                        decoration: const InputDecoration(
                          labelText: 'Your email@xenoptics.com',
                          icon: Icon(Icons.email_rounded),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0XFF455A64),
                                Color(0XFFEF5350),
                                Color(0xFFB0BEC5)
                              ]),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: TextButton(
                            onPressed: () {
                              resetpwd();
                            },
                            child: const Text(
                              'SEND',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> resetpwd() async {
    var response = await http
        .post(Uri.parse("http://xendb/api/mfg/auth/reqRestPassword"), body: {
      'email': email.text,
    }, headers: {
      'device': 'b5e28aaf1ace115bd521bea1fd26ced3',
      'token': 'unknow'
    });
    Map data = jsonDecode(response.body);
    if (data['msg'] == 'Create Request Password Success') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          'The email input format is wrong',
          style: TextStyle(letterSpacing: 1.5),
        )),
      );
    }
  }
}
