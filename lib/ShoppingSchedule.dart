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

  List<ShoppingScheduleItem> _suggestions = new List();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  ShoppingScheduleState(){
  }

  @override
  void initState() {
    ShoppingListService service =  ShoppingListService();
    service.loadShoppingDays().then((result) =>
        setState(() {
            if(result != null) {
              this._suggestions.addAll(result);
            }
        })
    );
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
      trailing: Wrap(
        spacing: 12, // space between two icons
        children: <Widget>[
          IconButton(
          icon:Icon(
            Icons.arrow_forward_ios ,
            color: Colors.blue ,
            size: 30,
          ),
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  new MaterialPageRoute (builder: (ctxt) =>  ShoppingGroup(pair.id)),
                );
              });
            },
          ),
          IconButton(
            icon:Icon(
              Icons.delete ,
              color: Colors.blue ,
              size: 30,
            )
          ),
        ],
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    if (_suggestions == null) {
      // This is what we show while we're loading
      return new Container();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping day'),
      ),
      body: _buildSuggestions(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (ctxt) =>  ShoppingScheduleFormWidget()),
          ).then((result)  {

              ShoppingListService service =  ShoppingListService();
          service.loadShoppingDays().then((result) =>
              setState(() {
                if(result != null) {
                  this._suggestions.addAll(result);
                }
              })
          );
          });
        },
        child: Icon(Icons.add),
      ),

    );
  }




}