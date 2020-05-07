
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ShoppingScheduleForm.dart';
import 'ShoppingScheduleListWidget.dart';

class ShoppingScheduleScreenWidget extends StatefulWidget {
  @override
  ShoppingScheduleScreenState createState() => ShoppingScheduleScreenState();
}

class ShoppingScheduleScreenState extends State<ShoppingScheduleScreenWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping day'),
        ),
        body: ShoppingScheduleListWidget(),
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
