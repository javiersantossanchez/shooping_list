import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoopinglist/dtos/ShoppingItem.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import 'dtos/ShoppingScheduleItem.dart';

class ShoppingScheduleFormWidget extends StatefulWidget {
  @override
  ShoppingScheduleFormState createState() => ShoppingScheduleFormState();
}

class ShoppingScheduleFormState extends State<ShoppingScheduleFormWidget> {
  DateTime selectedDate;

  List<ShoppingItem> _items;

  List<ShoppingItem> _selectedItems;

  ShoppingScheduleItem scheduleItem;

  final _biggerFont = const TextStyle(fontSize: 18.0);

  void saveSchedule (){
    ShoppingListService service = ShoppingListService();
    service.createSchuelde(selectedDate, _selectedItems);

  }


  @override
  void initState() {
    super.initState();
    ShoppingListService service = ShoppingListService();
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

  Widget _getListItemView() {
    Divider div = new Divider(color: Colors.blue,);
    return new Expanded(
        child: ListView.separated(
          separatorBuilder: (context, index) => div,
          padding: const EdgeInsets.all(16.0),
          itemCount: _items.length,
          itemBuilder: (context, index) => _buildRow(_items[index], context)
        )
      );
  }

  // #docregion _buildRow
  Widget _buildRow(ShoppingItem pair, BuildContext context) {
    return ListTile(
      title: Text(
        pair.description,
        style: _biggerFont,
      ),
      trailing: Icon(
        pair.selected ? Icons.check_circle : Icons.radio_button_unchecked,
        color: Colors.blue,
        size: 30,
      ),
      onTap: () {
        setState(() {
          pair.switchSelectedState();
          if(_selectedItems == null){
            _selectedItems = new List();
          }
          if(pair.selected){
            _selectedItems.add(pair);
          }else{
            _selectedItems.remove(pair);
          }

        });
      },
    );
  }

  Widget _getDatePickerView(){
    return ListTile(
      leading: Icon(
        Icons.date_range,
        size: 30.0,
        color: Colors.blue,
      ),
      title: Text( this.selectedDate == null
          ? "Not set"
          : new DateFormat.yMMMd()
          .format(this.selectedDate)),
      subtitle: Text('Click to select a date'),
      onTap: () => _selectDate(context),
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
      body: Column(children: <Widget>[
        _getDatePickerView(),
        _getListItemView(),
        RaisedButton(
          onPressed: () {
          setState(() {
              saveSchedule();
              Navigator.pop(context,);
          });
      }, child: Text(
        'Save',
        ),
    )
        //      ,)
      ]),
    );
  }


}
