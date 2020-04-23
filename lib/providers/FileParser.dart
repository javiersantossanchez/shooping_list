
import 'dart:convert';

import 'package:shoopinglist/dtos/ShoppingListItem.dart';
import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';

class FileParser {

  final shoppingItemListKey = "shoppingList";

  final shoppingScheduleDateKey = "shoppingDate";

  final shoppingItemDescriptionKey = "description";

  final shoppingScheduleIdKey = "id";

  ShoppingScheduleItem _parse(dynamic item) {
    List<dynamic> shoppingList = item[shoppingItemListKey];
    List<ShoppingListItem> listItems = shoppingList.map((item) => ShoppingListItem(item[shoppingItemDescriptionKey])).toList();
    DateTime date = DateTime.parse(item[shoppingScheduleDateKey]);
    return ShoppingScheduleItem(item[shoppingScheduleIdKey], date, listItems);
  }

  List<ShoppingScheduleItem> parser (String text) {
    print(text);
    List<dynamic> jsonFileContent = json.decode(text);
    return jsonFileContent.map((item) => _parse(item)).toList();
  }

}