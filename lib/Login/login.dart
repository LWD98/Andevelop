import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xenoptics/Login/API.dart';

import 'package:xenoptics/Xenoptics-mfg/home.dart';

class login extends StatefulWidget {
  //const login({ Key? key }) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  
  
  var username = TextEditingController();
  var password = TextEditingController();
  bool passwordVisble = false;

  @override
  void dispose() {
    // TODO: implement dispose
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration:const BoxDecoration(
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
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage('assets/xenoptics.png'),
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
                height: 480,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 25),
                    const Text(
                      'Hello',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                   const SizedBox(height: 10),
                    const Text(
                      'Please Login to Your Account',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: username,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          icon: Icon(Icons.person),
                        ),
                      ),
                    ),
                   const SizedBox(height: 25),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: password,
                        obscureText: !passwordVisble,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          icon: const Icon(Icons.lock_rounded),
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisble
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisble = !passwordVisble;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 40, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/resetpwd');
                            },
                            child: const Text(
                              'Forget password',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          )
                        ],
                      ),
                    ),
                   const SizedBox(height: 20),
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
                          padding: EdgeInsets.all(15),
                          child: TextButton(
                            onPressed: () async{
                              
                              login(username.text,password.text);
                            },
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
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

  Future<void> login(String username, String password) async {
    
    Auth auth = Auth();
    final success = await auth.login(username, password);
    print(success);
    if (success) {
      await Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('username or password is incorrect',style: TextStyle(letterSpacing: 1.5),)),
     );
     
    };
  }
 
}
