import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import '../ShoppingScheduleForm.dart';
import 'ShoppingScheduleListWidget.dart';

class ShoppingScheduleScreenWidget extends StatefulWidget {
  @override
  ShoppingScheduleScreenState createState() => ShoppingScheduleScreenState();
}

class ShoppingScheduleScreenState extends State<ShoppingScheduleScreenWidget> {
  final ShoppingListService _service = ShoppingListService();

  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping day'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.toc),
            onPressed: () => fdf(context),
          )
        ],
      ),
      body: ShoppingScheduleListWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => this.onClickAddButton(context),
      ),
    );
  }

  void fdf(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create a new item'),
          children: <Widget>[
            TextField(
              controller: myController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Type the new item\'s name'),
            ),
            SimpleDialogOption(
              onPressed: () {
                _service.createNewItemOnShoppingList(myController.text);
                Navigator.pop(context, true);
              },
              child: Text(
                "Save",
              ),
            ),
          ],
        );
      },
    );
  }

  void onClickAddButton(BuildContext context) {
    print('The user click on add button');
    ShoppingScheduleFormWidget widget = new ShoppingScheduleFormWidget();
    MaterialPageRoute router = new MaterialPageRoute(builder: (ctxt) => widget);
    Navigator.push(context, router);
  }
}
