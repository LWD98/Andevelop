import 'dart:js';

import 'package:flutter/material.dart';
import 'package:xenoptics/Factory_Control/Engineering/bom.dart';
import 'package:xenoptics/Factory_Control/Engineering/tracking.dart';
import 'package:xenoptics/Factory_Control/Production/monitoring.dart';
import 'package:xenoptics/Factory_Control/Production/traceability.dart';
import 'package:xenoptics/Factory_Control/Purchase/report.dart';
import 'package:xenoptics/Factory_Control/Purchase/supplier.dart';
import 'package:xenoptics/Factory_Control/Warehouse/material.dart';
import 'package:xenoptics/Factory_Control/Warehouse/prepare.dart';
import 'package:xenoptics/Factory_Control/Warehouse/safetys.dart';
import 'package:xenoptics/Factory_Control/Warehouse/shorts.dart';
import 'package:xenoptics/Factory_Control/Warehouse/stock.dart';
import 'package:xenoptics/Factory_Control/Warehouse/transaction.dart';
import 'package:xenoptics/Factory_Control/Warehouse/unpack.dart';
import 'package:xenoptics/Login/login.dart';
import 'package:xenoptics/Login/reset_password.dart';
import 'package:xenoptics/Request%20Issue/Engineer/RequestList.dart';
import 'package:xenoptics/Request%20Issue/Engineer/newBOM.dart';
import 'package:xenoptics/Request%20Issue/Engineer/newMaterial.dart';
import 'package:xenoptics/Request%20Issue/Engineer/transformation.dart';
import 'package:xenoptics/Request%20Issue/Store/request.dart';
import 'package:xenoptics/Request%20Issue/Store/transfer.dart';
import 'package:xenoptics/Request%20Issue/Store/withdraw.dart';
import 'package:xenoptics/Xenoptics-mfg/Notification.dart';
import 'package:xenoptics/Xenoptics-mfg/engineer.dart';
import 'package:xenoptics/Xenoptics-mfg/engineering.dart';
import 'package:xenoptics/Xenoptics-mfg/home.dart';
import 'package:xenoptics/Xenoptics-mfg/production.dart';
import 'package:xenoptics/Xenoptics-mfg/purchase.dart';
import 'package:xenoptics/Xenoptics-mfg/setting.dart';
import 'package:xenoptics/Xenoptics-mfg/store.dart';
import 'package:xenoptics/Xenoptics-mfg/warehouse.dart';

void main() {
  runApp(MaterialApp(
    
    debugShowCheckedModeBanner: false,
    
    initialRoute: '/login',
    routes: {
      '/login': (context) => login(),
      '/resetpwd': (context) => resetPassword(),
      '/home': (context) => home(),
      '/notification': (context) => notification(),
      '/warehouse': (context) => warehouse(),
      '/production': (context) => production(),
      '/engineering': (context) => engineering(),
      '/purchase': (context) => purchase(),
      '/store': (context) => store(),
      '/engineer': (context) => engineer(),
      '/setting': (context) => setting(),
      '/material': (context) => material(),
      '/stock': (context) => stock(),
      '/safetys': (context) => safetys(),
      '/shorts': (context) => shorts(),
      '/transaction': (context) => transaction(),
      '/unpack': (context) => unpack(),
      '/prepare': (context) => prepare(),
      '/monitoring': (context) => monioring(),
      '/trace': (context) => traceability(),
      '/BOM': (context) => bom(),
      '/track': (context) => tracking(),
      '/report': (context) => report(),
      '/supplier': (context) => supplier(),
      '/withdraw': (context) => withdraw(),
      '/transfer': (context) => transfer(),
      '/request': (context) => request(),
      '/newMaterial': (context) => newMaterial(),
      '/newBOM': (context) => NewBOM(),
      '/transformation': (context) => transformation(),
      '/checkList': (context) => RequestList(),

    },
  ));
}
