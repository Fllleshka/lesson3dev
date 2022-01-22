import 'package:flutter/material.dart';
import 'package:lesson3/pages/home.dart';
import 'package:lesson3/pages/newcont.dart';
import 'package:lesson3/pages/deletecont.dart';
import 'package:lesson3/pages/chat.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  routes: {
    '/': (context) => StlWidget(),
    '/addcont': (context) => AddNewCont(),
    '/deletecont': (context) => DeleteCont(),
    '/chat': (context) => ChatPage(),
  },
));


