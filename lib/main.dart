import 'package:flutter/material.dart';
import 'package:myapp/pages/principal.dart';

import 'package:myapp/src/pages/principal.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      onGenerateRoute: (settings) {
        return null;
      }
      );
      
  }
}