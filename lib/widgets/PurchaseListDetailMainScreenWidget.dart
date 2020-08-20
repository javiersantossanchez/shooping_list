import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import '../dtos/CatalogueItem.dart';
import 'ShoppingItemListWidget.dart';

class PurchaseListDetailMainScreenWidget extends StatefulWidget {

  final int id;

  PurchaseListDetailMainScreenWidget(this.id);

  @override
  ShoppingItemScreenState createState() => ShoppingItemScreenState(this.id);

}

class ShoppingItemScreenState extends State<PurchaseListDetailMainScreenWidget> {

  final int _id;

  ShoppingItemScreenState(this._id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping day'),
      ),
      body:  Column(children: <Widget>[
        ShoppingItemListWidget(this._id),
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