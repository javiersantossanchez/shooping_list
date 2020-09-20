import 'package:flutter/material.dart';
import 'package:shoopinglist/ui/ShoppingSchedulerCatalogScreen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: ShoppingSchedulerCatalogScreen(),
    );
  }
}