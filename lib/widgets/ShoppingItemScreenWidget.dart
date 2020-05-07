import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import '../dtos/ShoppingItem.dart';
import 'ShoppingItemListWidget.dart';

class ShoppingItemScreenWidget extends StatefulWidget {

  final int id;

  ShoppingItemScreenWidget(this.id);

  @override
  ShoppingItemScreenState createState() => ShoppingItemScreenState(this.id);

}

class ShoppingItemScreenState extends State<ShoppingItemScreenWidget> {

  final int _id;

  ShoppingItemScreenState(this._id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping day'),
      ),
      body: ShoppingItemListWidget(this._id),
    );
  }

}