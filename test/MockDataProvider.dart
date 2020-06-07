import 'package:shoopinglist/dtos/ShoppingItem.dart';

import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';
import 'package:shoopinglist/providers/IDataProvider.dart';


class MockDataProvider implements IDataProvider{

  List<ShoppingScheduleItem> _info = new List();

  set info(List<ShoppingScheduleItem> value) {
    _info = value;
  }

  Future<List<ShoppingScheduleItem>> getScheduler() async {
      return Future.value(_info);
  }

  Future<List<ShoppingItem>> getShoppingList(int id) async {
  }

  Future<void> createNewShoppingList(
      ShoppingScheduleItem newShoppingList) async {
  }

  Future<void> deleteShoppingList(ShoppingScheduleItem shoppingListToDelete) async{
  }

  @override
  Future<void> updateShoppingList() {
    return null;
  }
}
