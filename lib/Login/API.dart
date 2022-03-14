// ignore_for_file: avoid_web_libraries_in_flutter, file_names

import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth{
  late String username;
  late String password;
  Auth();
   Future<bool> login(String username, String password) async {
    
    var response = await http.post(Uri.parse("http://xendb/api/mfg/auth/login"),
        body: {
          'username': username ,
          'password': password ,
          'mode': 'login'
        },
        
        headers: {
          'device': 'b5e28aaf1ace115bd521bea1fd26ced3',
        });
    Base64Codec base64 = const Base64Codec();
    
    Map data = json.decode(response.body);
    if(data['msg'] == 'login pass')
    {
      SharedPreferences pre = await SharedPreferences.getInstance();
      var jsonResponse = json.decode(response.body);
      jsonResponse =
            json.decode(utf8.decode(base64.decode(jsonResponse['data'])));
      await pre.setString('userInfo', json.encode(jsonResponse));
      await pre.setString('usertoken', json.encode(jsonResponse['token']));
      
    }
      print('login ---end');
      print(data['msg']);
      
    
    return data['msg'] == 'login pass';
   }
   
   Future getUserData()async{
    SharedPreferences pre = await SharedPreferences.getInstance() as SharedPreferences;
    var userInfo = json.decode(pre.getString('userInfo')!);
    //var token = userInfo['userInfo']['Detail'][0]['firstName']+' '+userInfo['userInfo']['Detail'][0]['lastName']+''+userInfo['token'];
    var token = userInfo['userInfo']['Detail'][0]['firstName']+' '+userInfo['userInfo']['Detail'][0]['lastName'];
    print('token ---end');
    return token;
    
  }
   Future getUserToken()async{
    SharedPreferences pre = await SharedPreferences.getInstance() as SharedPreferences;
    var userInfo = json.decode(pre.getString('userInfo')!);
    var token = userInfo['token'];
    //var token = userInfo['userInfo']['Detail'][0]['firstName']+' '+userInfo['userInfo']['Detail'][0]['lastName'];
    
    return token;
    
  }
  Future getUserID()async{
    SharedPreferences pre = await SharedPreferences.getInstance() as SharedPreferences;
    var userInfo = json.decode(pre.getString('userInfo')!);
    var token = userInfo['userInfo']['userID'];
    
    return token;
    
  }
  
}