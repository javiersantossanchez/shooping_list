import 'package:path_provider/path_provider.dart';
import 'package:shoopinglist/dtos/CatalogueItem.dart';
import 'dart:io';
import 'dart:convert';

import 'package:shoopinglist/dtos/PurchaseList.dart';
import 'package:shoopinglist/parsers/FileParser.dart'; //to convert json to maps and vice versa

abstract class IDefaultShoppingListDataProvider {

  Future<List<CatalogueItem>> getDefaultShoppingList() ;

}
