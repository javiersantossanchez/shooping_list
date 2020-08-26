import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import 'ShoppingScheduleFormScreen.dart';
import 'ShoppingSchedulerListingWidget.dart';

class ShoppingSchedulerCatalogScreen extends StatefulWidget {
  @override
  ShoppingSchedulerCatalogScreenState createState() => ShoppingSchedulerCatalogScreenState();
}

class ShoppingSchedulerCatalogScreenState extends State<ShoppingSchedulerCatalogScreen> {
  final ShoppingListService _service = ShoppingListService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping day  aaaaaa'),

      ),
      body: ShoppingSchedulerListingWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => this.onClickAddButton(context),
      ),
    );
  }


  void onClickAddButton(BuildContext context) {
    print('The user click on add button');
    ShoppingScheduleFormScreen widget = new ShoppingScheduleFormScreen();
    MaterialPageRoute router = new MaterialPageRoute(builder: (ctxt) => widget);
    Navigator.push(context, router);
  }
}
