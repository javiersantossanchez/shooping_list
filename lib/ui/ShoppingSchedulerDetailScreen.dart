import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import '../dtos/Product.dart';
import 'ProductListingWidget.dart';

class ShoppingSchedulerDetailScreen extends StatefulWidget {

  final int id;

  ShoppingSchedulerDetailScreen(this.id);

  @override
  ShoppingSchedulerDetailScreenState createState() => ShoppingSchedulerDetailScreenState(this.id);

}

class ShoppingSchedulerDetailScreenState extends State<ShoppingSchedulerDetailScreen> {

  final int _id;

  ShoppingSchedulerDetailScreenState(this._id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping day'),
      ),
      body:  Column(children: <Widget>[
        ProductListingWidget(this._id),
        RaisedButton(
          onPressed: () => Navigator.pop(context,),
          child: Text(
            'Finish',
          ),
        )
      ]),
    );
  }

}