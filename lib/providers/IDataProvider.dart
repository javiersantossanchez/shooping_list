import 'package:path_provider/path_provider.dart';
import 'package:shoopinglist/dtos/CatalogueItem.dart';
import 'dart:io';
import 'dart:convert';

import 'package:shoopinglist/dtos/PurchaseList.dart';
import 'package:shoopinglist/parsers/FileParser.dart'; //to convert json to maps and vice versa

abstract class IDataProvider {

  final List<PurchaseList> info = new List();

  Future<List<CatalogueItem>> getShoppingList(int id) async {
    PurchaseList v = info.firstWhere((item) => item.id == id);

    return v.shoppingList;
  }

  Future<void> createNewShoppingList(
      PurchaseList newShoppingList) async {
    this.info.add(newShoppingList);
    this.updateShoppingList();
  }

  Future<void> deleteShoppingList(PurchaseList shoppingListToDelete) async{
    this.info.remove(shoppingListToDelete);
    this.updateShoppingList();
  }

  Future<List<PurchaseList>> getScheduler() ;

  Future<void> updateShoppingList();
}
