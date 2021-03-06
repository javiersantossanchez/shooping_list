import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import '../dtos/ShoppingScheduler.dart';
import 'ShoppingSchedulerDetailScreen.dart';

class ShoppingSchedulerListingWidget extends StatefulWidget {
  @override
  ShoppingScheduleListState createState() => ShoppingScheduleListState();
}

class ShoppingScheduleListState extends State<ShoppingSchedulerListingWidget> {

  final List<ShoppingScheduler> _listItems = new List();

  final ShoppingListService _service = ShoppingListService();

  @override
  void initState() {
    super.initState();
    this.reloadState();
  }

  @override
  void didUpdateWidget(ShoppingSchedulerListingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    this.reloadState();
  }

  Widget getViewDetailIconButton(ShoppingScheduler currentItem, BuildContext context){
    return IconButton(
      icon: Icon(
        Icons.arrow_forward_ios,
        color: Colors.blue,
        size: 30,
      ),
      onPressed: () => onClickViewDetailIcon(currentItem, context),
    );
  }

  Widget getDeleteIconButton(ShoppingScheduler currentItem){
    return IconButton(
      icon: Icon(
        Icons.delete,
        color: Colors.blue,
        size: 30,
      ),
      onPressed: () => onClickDeleteIcon(currentItem),
    );
  }

  Widget _getItemView(ShoppingScheduler currentItem, BuildContext context) {
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

  Widget _getListView() {
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
      bodyWidget = _getListView();
    }
    return bodyWidget;
  }


  void onClickViewDetailIcon(ShoppingScheduler selectedItem, BuildContext context) {
    print('The user click on view detail icon');
    Widget widget = ShoppingSchedulerDetailScreen(selectedItem.id);
    MaterialPageRoute router = new MaterialPageRoute(builder: (ctxt) => widget);
    Navigator.push(context, router);
  }

  void onClickDeleteIcon(ShoppingScheduler itemToDelete) {
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
