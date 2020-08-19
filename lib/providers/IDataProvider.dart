import 'package:path_provider/path_provider.dart';
import 'package:shoopinglist/dtos/ShoppingItem.dart';
import 'dart:io';
import 'dart:convert';

import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';
import 'package:shoopinglist/parsers/FileParser.dart'; //to convert json to maps and vice versa

abstract class IDataProvider {

  final List<ShoppingScheduleItem> info = new List();

  Future<List<ShoppingItem>> getShoppingList(int id) async {
    ShoppingScheduleItem v = info.firstWhere((item) => item.id == id);

    return v.shoppingList;
  }

  Future<void> createNewShoppingList(
      ShoppingScheduleItem newShoppingList) async {
    this.info.add(newShoppingList);
    this.updateShoppingList();
  }

  Future<void> deleteShoppingList(ShoppingScheduleItem shoppingListToDelete) async{
    this.info.remove(shoppingListToDelete);
    this.updateShoppingList();
  }

  Future<List<ShoppingScheduleItem>> getScheduler() ;

  Future<void> updateShoppingList();
}
