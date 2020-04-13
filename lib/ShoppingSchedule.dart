import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoopinglist/ShoopingGroup.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import 'dtos/ShoppingScheduleItem.dart';

class ShoppingScheduleWidget extends StatefulWidget {
  @override
  ShoppingScheduleState createState() => ShoppingScheduleState();
}


class ShoppingScheduleState extends State<ShoppingScheduleWidget> {

  List<ShoppingScheduleItem> _suggestions ;

  final _biggerFont = const TextStyle(fontSize: 18.0);

  ShoppingScheduleState(){
    ShoppingListService service =  ShoppingListService();
    this._suggestions = service.loadShoppingDays();
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
  Widget _buildRow(ShoppingScheduleItem pair, BuildContext context) {
    return ListTile(
      title: Text(
        new DateFormat.yMMMd().format(pair.shoppingDate),
        style: _biggerFont,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios ,
        color: Colors.blue ,
        size: 30,
      ),
      onTap: () {
        setState(() {
                 Navigator.push(
            context,
            new MaterialPageRoute(builder: (ctxt) =>  ShoppingGroup(pair.id)),
          );
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