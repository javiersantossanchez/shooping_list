import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoopinglist/dtos/ShoppingItem.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import '../dtos/ShoppingScheduleItem.dart';

class ShoppingScheduleFormWidget extends StatefulWidget {
  @override
  ShoppingScheduleFormState createState() => ShoppingScheduleFormState();
}

class ShoppingScheduleFormState extends State<ShoppingScheduleFormWidget> {
  DateTime _selectedDate;

  List<ShoppingItem> _items;

  List<ShoppingItem> _selectedItems;

  ShoppingScheduleItem scheduleItem;

  final ShoppingListService _service = ShoppingListService();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }


  void saveSchedule (){
    ShoppingListService service = ShoppingListService();
    service.createSchuelde(_selectedDate, _selectedItems);

  }


  @override
  void initState() {
    super.initState();
    ShoppingListService service = ShoppingListService();
    service.getDefaultShoppingList().then((result) => setState(() {this._items = result;}));



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
        title: Text('DateTime Picker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.toc),
            onPressed: () => fdf(context),
          )
        ],
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }

  void fdf(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create a new item'),
          children: <Widget>[
            TextField(
              controller: myController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Type the new item\'s name'),
            ),
            SimpleDialogOption(
              onPressed: () {
                _service.createNewItemOnShoppingList(myController.text);
                Navigator.pop(context, true);
              },
              child: Text(
                "Save",
              ),
            ),
          ],
        );
      },
    );
  }


}
