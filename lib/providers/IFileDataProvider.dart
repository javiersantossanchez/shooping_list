import 'package:path_provider/path_provider.dart';
import 'package:shoopinglist/dtos/ShoppingListItem.dart';
import 'dart:io';
import 'dart:convert';

import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';
import 'package:shoopinglist/providers/FileParser.dart'; //to convert json to maps and vice versa

class IFileDataProvider {


  Future<List<ShoppingScheduleItem>> getScheduler() async {

  }

  Future<List<ShoppingListItem>> getShoppingList(int id) async {

  }

  Future<void> createNewShoppingList(ShoppingScheduleItem newShoppingList) async {

  }

  Future<void> deleteShoppingList(ShoppingScheduleItem shoppingListToDelete) async{

  }
}
