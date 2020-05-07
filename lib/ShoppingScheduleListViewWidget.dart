import 'dart:developer';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoopinglist/ShoopingGroup.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import 'ShoppingScheduleForm.dart';
import 'dtos/ShoppingScheduleItem.dart';

class ShoppingScheduleListViewWidget extends StatefulWidget {
  @override
  ShoppingScheduleListViewState createState() => ShoppingScheduleListViewState();
}

class ShoppingScheduleListViewState extends State<ShoppingScheduleListViewWidget> {
  List<ShoppingScheduleItem> _listItems = new List();

  ShoppingListService _service = ShoppingListService();

  ShoppingScheduleListViewState();

  @override
  void initState() {
    super.initState();
    this.reloadState();
  }

  @override
  void didUpdateWidget(ShoppingScheduleListViewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    this.reloadState();
  }

  Widget getViewDetailIconButton(ShoppingScheduleItem currentItem, BuildContext context){
    return IconButton(
      icon: Icon(
        Icons.arrow_forward_ios,
        color: Colors.blue,
        size: 30,
      ),
      onPressed: () => onClickViewDetailIcon(currentItem, context),
    );
  }

  Widget getDeleteIconButton(ShoppingScheduleItem currentItem){
    return IconButton(
      icon: Icon(
        Icons.delete,
        color: Colors.blue,
        size: 30,
      ),
      onPressed: () => onClickDeleteIcon(currentItem),
    );
  }

  Widget _getItemView(ShoppingScheduleItem currentItem, BuildContext context) {
    return ListTile(
      title: Text(
        new DateFormat.yMMMd().format(currentItem.shoppingDate),
      ),
      trailing: Wrap(
        spacing: 12, // space between two icons
        children: <Widget>[
          getViewDetailIconButton(currentItem, context),
          getDeleteIconButton(currentItem),
        ],
      ),
    );
  }

  Widget _getListItemView() {
    Divider div = new Divider(color: Colors.blue,);
    return ListView.separated(
      separatorBuilder: (context, index) => div,
      padding: const EdgeInsets.all(16.0),
      itemCount: _listItems.length,
      itemBuilder: (context, index) => _getItemView(_listItems[index], context),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget;
    if (_listItems == null) {
      // This is what we show while we're loading
      bodyWidget = Container();
    } else {
      bodyWidget = _getListItemView();
    }
    return bodyWidget;

  }


  void onClickViewDetailIcon(ShoppingScheduleItem selectedItem, BuildContext context) {
    print('The user click on view detail icon');
    ShoppingGroup widget = ShoppingGroup(selectedItem.id);
    MaterialPageRoute router = new MaterialPageRoute(builder: (ctxt) => widget);
    Navigator.push(context, router);
  }

  void onClickDeleteIcon(ShoppingScheduleItem itemToDelete) {
    print('The user click on delete icon');
    _service.deleteSchuelde(itemToDelete);
    this.reloadState();
  }

  void reloadState() {
    _service.loadShoppingDays().then((result) => setState(() {
          if (result != null) {
            _listItems.clear();
            this._listItems.addAll(result);
          }
        }));
  }
}
