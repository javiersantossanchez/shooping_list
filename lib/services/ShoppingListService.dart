import 'dart:convert';

import 'package:shoopinglist/dtos/ShoppingItem.dart';
import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';
import 'package:shoopinglist/providers/FileDataProvider.dart';

import 'package:shoopinglist/providers/IDataProvider.dart';
import 'package:shoopinglist/providers/IDefaultShoppingListDataCreator.dart';

import 'package:shoopinglist/providers/IDefaultShoppingListDataProvider.dart';
import 'package:shoopinglist/providers/JexiaDefaultShoppingListDataCreator.dart';
import 'package:shoopinglist/providers/JexiaDefaultShoppingListDataProvider.dart';

class ShoppingListService {


  final IDataProvider _dataProvider;

  final IDefaultShoppingListDataProvider _defaultShoppingListDataProvider;

  final IDefaultShoppingListDataCreator __defaultShoppingListDataCreator;



  ShoppingListService({IDataProvider dataProvider, IDefaultShoppingListDataProvider defaultShoppingListDataProvider, IDefaultShoppingListDataCreator defaultShoppingListDataCreator}):
        this._dataProvider = dataProvider ?? new FileDataProvider() ,
        this._defaultShoppingListDataProvider = defaultShoppingListDataProvider?? new JexiaDefaultShoppingListDataProvider(),
        this.__defaultShoppingListDataCreator = defaultShoppingListDataCreator?? new JexiaDefaultShoppingListDataCreator();

  Future<List<ShoppingScheduleItem>> loadShoppingDays() async {
    return await this._dataProvider.getScheduler();
  }

  Future<List<ShoppingItem>> loadShoppingList(int id){
    return this._dataProvider.getShoppingList(id);
  }


  Future<List<ShoppingItem>> getDefaultShoppingList() async{
    return this._defaultShoppingListDataProvider.getDefaultShoppingList();


  }


  void createNewItemOnShoppingList(String newItemName ) {
    __defaultShoppingListDataCreator.createNewItem(newItemName);
  }

  void createSchuelde(DateTime selectedDate, List<ShoppingItem> listItem ) {
    ShoppingScheduleItem newShoppingList = (ShoppingScheduleItemBuilder((new DateTime.now()).millisecondsSinceEpoch,selectedDate)..shoppingList = listItem).build();
    _dataProvider.createNewShoppingList(newShoppingList);
  }

  void deleteSchuelde(ShoppingScheduleItem shoppingListToDelete) {
    _dataProvider.deleteShoppingList(shoppingListToDelete);
  }

  void updateShoopingItem(){
    _dataProvider.updateShoppingList();
  }

}