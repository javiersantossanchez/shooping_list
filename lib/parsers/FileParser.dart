
import 'dart:convert';

import 'package:shoopinglist/dtos/Product.dart';
import 'package:shoopinglist/dtos/ShoppingScheduler.dart';

import 'IShoppingScheduleParse.dart';

class FileParser implements IShoppingScheduleParse{

  final _shoppingItemListKey = "shoppingList";

  final _shoppingScheduleDateKey = "shoppingDate";

  final _shoppingItemDescriptionKey = "description";

  final _shoppingItemReadyKey = "ready";

  final _shoppingScheduleIdKey = "id";

  ShoppingScheduler _parseItem(dynamic item) {
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

    List<Product> listItems = shoppingList.map((item) => Product(item[_shoppingItemDescriptionKey], item[_shoppingItemReadyKey],'1')).toList();
    return  (ShoppingScheduleItemBuilder(item[_shoppingScheduleIdKey],date)
            ..shoppingList = listItems
           ).build();
  }

  List<ShoppingScheduler> parser (String text) {
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
    List<ShoppingScheduler> result = jsonFileContent.map((item) => _parseItem(item)).where((item) => item != null).toList();
    if(result.isEmpty){
      return null;
    }
    return result;
  }

}