import 'package:path_provider/path_provider.dart';
import 'package:shoopinglist/dtos/ShoppingItem.dart';
import 'dart:io';
import 'dart:convert';

import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';
import 'package:shoopinglist/parsers/FileParser.dart'; //to convert json to maps and vice versa

abstract class IDefaultShoppingListDataCreator {

  Future<void> createNewItem(String newItemName);
}