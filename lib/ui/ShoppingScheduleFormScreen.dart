import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoopinglist/dtos/Product.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import '../dtos/ShoppingScheduler.dart';

class ShoppingScheduleFormScreen extends StatefulWidget {
  @override
  ShoppingScheduleFormState createState() => ShoppingScheduleFormState();
}

class ShoppingScheduleFormState extends State<ShoppingScheduleFormScreen> {
  DateTime _selectedDate;

  List<Product> _items;

  List<Product> _selectedItems;

  ShoppingScheduler scheduleItem;

  final ShoppingListService _service = ShoppingListService();

  final _biggerFont = const TextStyle(fontSize: 18.0);


  void saveSchedule (){
    List<Product> items = new List();
    for (var i = 0; i < _selectedItems.length; i++) {
      items.add(new Product.Unselected(_selectedItems[i].description, _selectedItems[i].id));
    }
    _service.createSchuelde(_selectedDate, items);
  }


  @override
  void initState() {
    super.initState();
    _service.getDefaultShoppingList().then((result) => setState(() {this._items = result;}));
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;

      });
  }

  Widget _getListItemView() {
    if (_items == null) {
      // This is what we show while we're loading
      return new Container();
    }
    Divider div = new Divider(color: Colors.blue,);
    return new //Column(children: <Widget>[
      Expanded(
        child: ListView.separated(
          separatorBuilder: (context, index) => div,
          padding: const EdgeInsets.all(16.0),
          itemCount: _items.length,
          itemBuilder: (context, index) => _buildRow(_items[index], context)
        )
      );
    //]);
  }

  // #docregion _buildRow
  Widget _buildRow(Product pair, BuildContext context) {
    return ListTile(
      title: Text(
        pair.description == null? '': pair.description,
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
      title: Text( this._selectedDate == null
          ? "Not set"
          : new DateFormat.yMMMd()
          .format(this._selectedDate)),
      subtitle: Text('Click to select a date'),
      onTap: () => _selectDate(context),
    );
  }

  void onClickSaveButton(BuildContext context){
      setState(() {
        saveSchedule();
        Navigator.pop(context,);
      });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Catalog'),
      ),
      body: Column(children: <Widget>[
        _getDatePickerView(),
        _getListItemView(),
        RaisedButton(
          onPressed: this._selectedDate == null? null : ()=> onClickSaveButton(context),
          child: Text('Save',
          ),
        ),
        //      ,)
      ]),
    );
  }
}
