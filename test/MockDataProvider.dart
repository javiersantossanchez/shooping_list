import 'package:shoopinglist/dtos/ShoppingListItem.dart';

import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';
import 'package:shoopinglist/providers/IFileDataProvider.dart';


class MockDataProvider implements IFileDataProvider{

  List<ShoppingScheduleItem> _info = new List();

  set info(List<ShoppingScheduleItem> value) {
    _info = value;
  }

  Future<List<ShoppingScheduleItem>> getScheduler() async {
      return Future.value(_info);
  }

  Future<List<ShoppingListItem>> getShoppingList(int id) async {
  }

  Future<void> createNewShoppingList(
      ShoppingScheduleItem newShoppingList) async {
  }

  Future<void> deleteShoppingList(ShoppingScheduleItem shoppingListToDelete) async{
  }
}
