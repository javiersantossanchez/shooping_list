
import 'dart:convert';

import 'package:shoopinglist/dtos/ShoppingListItem.dart';
import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';

class FileParser {

  final shoppingItemListKey = "shoppingList";

  final shoppingScheduleDateKey = "shoppingDate";

  final shoppingItemDescriptionKey = "description";

  final shoppingScheduleIdKey = "id";

  ShoppingScheduleItem _parse(dynamic item) {
    DateTime date;
    if(item[shoppingScheduleDateKey] == null){
      print("The shoppingDate property is no present");
      return null;
    }
    try {
      date = DateTime.parse(item[shoppingScheduleDateKey]);
    } on FormatException catch(exception){
      print("Date has an invalid format $exception");
      return null;
    }
    List<dynamic> shoppingList = item[shoppingItemListKey];
    if(shoppingList == null){
      return null;
    }
    List<ShoppingListItem> listItems = shoppingList.map((item) => ShoppingListItem(item[shoppingItemDescriptionKey])).toList();
    return ShoppingScheduleItem(item[shoppingScheduleIdKey], date, listItems);
  }

  List<ShoppingScheduleItem> parser (String text) {
    List<dynamic> jsonFileContent;
    if(text == null || text.isEmpty){
      return null;
    }
    try {
      jsonFileContent = json.decode(text);
    } on FormatException catch(exception){
      print("The file has invalid format $exception");
      return null;
    }
    List<ShoppingScheduleItem> result = jsonFileContent.map((item) => _parse(item)).where((item) => item != null).toList();
    if(result.isEmpty){
      return null;
    }
    return result;
  }

}