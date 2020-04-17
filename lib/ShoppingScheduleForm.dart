import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoopinglist/dtos/ShoppingListItem.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import 'dtos/ShoppingScheduleItem.dart';

class ShoppingScheduleFormWidget extends StatefulWidget {
  @override
  ShoppingScheduleFormState createState() => ShoppingScheduleFormState();
}

class ShoppingScheduleFormState extends State<ShoppingScheduleFormWidget> {
  DateTime selectedDate ;//= DateTime.now();

  List<ShoppingListItem> _items;

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    ShoppingListService service =  ShoppingListService();
        setState(() {
          this._items = service.getDefaultShoppingList();
        });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }


  Widget _buildSuggestions() {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.blue,
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        itemCount: _items.length,
        itemBuilder: /*1*/ (context, index) {
          return _buildRow(_items[index], context);
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
    if (_items == null) {
      // This is what we show while we're loading
      return new Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTime Picker'),
      ),
      body:
      Column(
          children: <Widget>[
            RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)),
          elevation: 4.0,
          onPressed: () => _selectDate(context),
          child: Container(
            alignment: Alignment.center,
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.date_range,
                            size: 18.0,
                            color: Colors.teal,
                          ),
                          Text(
                            this.selectedDate == null ? "Not set" : new DateFormat.yMMMd().format(this.selectedDate),
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Text(
                  "  Change",
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ],
            ),

          ),

          color: Colors.white,
        ),
            new Expanded(
              child:
              _buildSuggestions(),)
      //      ,
          ]
      ),

    );
  }




















  @override
  Widget buildOld(BuildContext context) {
    if (_items == null) {
      // This is what we show while we're loading
      return new Container();
    }
//_buildSuggestions(),
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTime Picker'),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 4.0,
                onPressed: () => _selectDate(context),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  size: 18.0,
                                  color: Colors.teal,
                                ),
                                Text(
                                    this.selectedDate == null ? "Not set" : new DateFormat.yMMMd().format(this.selectedDate),
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "  Change",
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),
      RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)),
        elevation: 4.0,
        onPressed: (){
          ShoppingListService service =  ShoppingListService();
          service.addNewItem(new ShoppingScheduleItem(0, this.selectedDate, new List()));
          Navigator.pop(context);
        },
      ),
_buildSuggestions(),
            ],
          ),
        ),

      ),
    );
  }

}
