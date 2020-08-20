import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import '../dtos/CatalogueItem.dart';

class ShoppingItemListWidget extends StatefulWidget {

  final int id;

  ShoppingItemListWidget(this.id);

  @override
  ShoppingItemListState createState() => ShoppingItemListState(this.id);

}

class ShoppingItemListState extends State<ShoppingItemListWidget> {

  List<CatalogueItem> _listItems ;

  final int id;

  ShoppingItemListState(this.id);

  @override
  void initState() {
    super.initState();
    this._reload();
  }

  Widget getSelectIconButton(CatalogueItem currentItem){
    return IconButton(
      icon: Icon(
        currentItem.selected? Icons.check_circle: Icons.radio_button_unchecked ,
        color: Colors.blue,
        size: 30,
      ),
      onPressed: () => this._test(currentItem),
    );
  }

  Widget _getListView() {
    Divider div = new Divider(color: Colors.blue,);
    return new Expanded(
        child:ListView.separated(
        separatorBuilder: (context, index) => div,
        padding: const EdgeInsets.all(16.0),
        itemCount: _listItems.length,
        itemBuilder: (context, index) => _getItemView(_listItems[index], context),
    ));
  }

  Widget _getItemView(CatalogueItem currentItem, BuildContext context) {
    return ListTile(
      title: Text(
        currentItem.description,
      ),
      trailing: getSelectIconButton(currentItem),
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


  void _reload(){
    ShoppingListService service =  ShoppingListService();
    service.loadShoppingList(this.id).then((result) =>
        setState(() {
          this._listItems = result;
        })
    );
  }
  
  void _test(CatalogueItem currentItem){
    ShoppingListService service = ShoppingListService();
    setState((){
      currentItem.switchSelectedState();
      service.updateShoopingItem();
    });
  }

}