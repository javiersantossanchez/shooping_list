import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoopinglist/ShoopingGroup.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import 'ShoppingScheduleForm.dart';
import 'dtos/ShoppingScheduleItem.dart';

class ShoppingScheduleWidget extends StatefulWidget {
  @override
  ShoppingScheduleState createState() => ShoppingScheduleState();
}

class ShoppingScheduleState extends State<ShoppingScheduleWidget> {
  List<ShoppingScheduleItem> _listItems = new List();

  ShoppingListService _service = ShoppingListService();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  ShoppingScheduleState();

  @override
  void initState() {
    super.initState();
    this.reloadState();
  }

  Widget _getListItemView() {
    Divider div = new Divider(color: Colors.blue,);
    return ListView.separated(
        separatorBuilder: (context, index) => div,
        padding: const EdgeInsets.all(16.0),
        itemCount: _listItems.length,
        itemBuilder: (context, index) => _buildRow(_listItems[index], context),
    );
  }

  // #docregion _buildRow
  Widget _buildRow(ShoppingScheduleItem pair, BuildContext context) {
    return ListTile(
      title: Text(
        new DateFormat.yMMMd().format(pair.shoppingDate),
        style: _biggerFont,
      ),
      trailing: Wrap(
        spacing: 12, // space between two icons
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
              size: 30,
            ),
            onPressed: () => onClickArrowForwardIcon(pair, context),
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.blue,
              size: 30,
            ),
            onPressed: () => clickOnDeleteIcon(pair),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainWidget;
    if (_listItems == null) {
      // This is what we show while we're loading
      mainWidget = Container();
    } else {
      mainWidget = Scaffold(
        appBar: AppBar(
          title: Text('Shopping day'),
        ),
        body: _getListItemView(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => this.onClickAddButton(context),

        ),
      );
    }
    return mainWidget;
  }

  void onClickAddButton(BuildContext context) {
    ShoppingScheduleFormWidget widget = new ShoppingScheduleFormWidget();
    MaterialPageRoute router = new MaterialPageRoute(builder: (ctxt) => widget);
    Navigator.push(context, router).then((result) => this.reloadState());
  }

  void onClickArrowForwardIcon(
      ShoppingScheduleItem selectedItem, BuildContext context) {
    ShoppingGroup widget = ShoppingGroup(selectedItem.id);
    MaterialPageRoute router = new MaterialPageRoute(builder: (ctxt) => widget);
    setState(() => Navigator.push(context, router));
  }

  void clickOnDeleteIcon(ShoppingScheduleItem itemToDelete) {
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
