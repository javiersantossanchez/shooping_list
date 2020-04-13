import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import 'dtos/ShoppingListItem.dart';

class ShoppingGroup extends StatefulWidget {

  int id;

  ShoppingGroup(int id){
    this.id= id;
  }

  @override
  ShoppingListItemaaa createState() => ShoppingListItemaaa(this.id);

}


class ShoppingListItemaaa extends State<ShoppingGroup> {

  List<ShoppingListItem> _suggestions ;
  final _biggerFont = const TextStyle(fontSize: 18.0);


  ShoppingListItemaaa(int id){
    ShoppingListService service =  ShoppingListService();
    this._suggestions = service.loadShoppingList(id);
  }

  Widget _buildSuggestions() {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.blue,
        ),
        padding: const EdgeInsets.all(16.0),
        itemCount: _suggestions.length,
        itemBuilder: /*1*/ (context, index) {
          return _buildRow(_suggestions[index], context);
        });
  }


  // #docregion _buildRow
  Widget _buildRow(ShoppingListItem pair, BuildContext context) {
    return ListTile(
      title: Text(
        pair.description,
        style: _biggerFont,
      ),
      trailing: Icon(
        pair.ready? Icons.check_circle: Icons.radio_button_unchecked ,
        color: Colors.blue ,
        size: 30,
      ),
      onTap: () {
        setState(() {
          pair.ready = !pair.ready ;
        });

      },
    );


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping day'),
      ),
      body: _buildSuggestions(),
    );
  }




}