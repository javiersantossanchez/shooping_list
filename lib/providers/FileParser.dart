
import 'dart:convert';

import 'package:shoopinglist/dtos/ShoppingListItem.dart';
import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';

class FileParser {

  final _shoppingItemListKey = "shoppingList";

  final _shoppingScheduleDateKey = "shoppingDate";

  final _shoppingItemDescriptionKey = "description";

  final _shoppingScheduleIdKey = "id";

  ShoppingScheduleItem _parse(dynamic item) {
    DateTime date;
    if(item[_shoppingScheduleDateKey] == null){
      print("The shoppingDate property is no present");
      return null;
    }
    try {
      date = DateTime.parse(item[_shoppingScheduleDateKey]);
    } on FormatException catch(exception){
      print("Date has an invalid format $exception");
      return null;
    }
    List<dynamic> shoppingList = item[_shoppingItemListKey];
    if(shoppingList == null){
      return null;
    }
    List<ShoppingListItem> listItems = shoppingList.map((item) => ShoppingListItem(item[_shoppingItemDescriptionKey])).toList();
    return ShoppingScheduleItem(item[_shoppingScheduleIdKey], date, listItems);
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