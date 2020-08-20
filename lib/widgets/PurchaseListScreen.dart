import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import 'ShoppingScheduleFormWidget.dart';
import 'PurchaseListListingWidget.dart';

class PurchaseListScreen extends StatefulWidget {
  @override
  PurchaseListScreenState createState() => PurchaseListScreenState();
}

class PurchaseListScreenState extends State<PurchaseListScreen> {
  final ShoppingListService _service = ShoppingListService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping day  aaaaaa'),

      ),
      body: PurchaseListListingWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => this.onClickAddButton(context),
      ),
    );
  }


  void onClickAddButton(BuildContext context) {
    print('The user click on add button');
    ShoppingScheduleFormWidget widget = new ShoppingScheduleFormWidget();
    MaterialPageRoute router = new MaterialPageRoute(builder: (ctxt) => widget);
    Navigator.push(context, router);
  }
}
