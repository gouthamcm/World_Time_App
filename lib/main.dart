

import 'package:flutter/material.dart';
import 'package:world_time_app/pages/chooseLocation.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => LodingScreen(),
    '/home': (context) => Home(),
    '/chooseLocation': (context) => ChooseLocation()
  },
));


