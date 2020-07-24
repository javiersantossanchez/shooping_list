import 'package:path_provider/path_provider.dart';
import 'package:shoopinglist/dtos/ShoppingItem.dart';
import 'dart:io';
import 'dart:convert';

import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';
import 'package:shoopinglist/parsers/FileParser.dart';
import 'package:shoopinglist/parsers/IShoppingScheduleParse.dart';
import 'package:shoopinglist/providers/IDefaultShoppingListDataProvider.dart';
import 'package:shoopinglist/providers/StaticDefaultShoppingListDataProvider.dart';
import 'package:shoopinglist/providers/authenticator/JexiaAuthenticator.dart';

import 'IDataProvider.dart';

import 'package:http/http.dart' as http;

import 'IDefaultShoppingListDataCreator.dart';


class JexiaDefaultShoppingListDataCreator implements  IDefaultShoppingListDataCreator{

  static final JexiaDefaultShoppingListDataCreator _instance = new JexiaDefaultShoppingListDataCreator._internal();

  final String _baseUrl ="https://2b23210d-91d7-4a37-a1b3-3a7a30b20e9c.app.jexia.com/";

  final String _listItemsDefaultPath = 'ds/list_items_default';

  final JexiaAuthenticator authenticator = JexiaAuthenticator ();


  factory JexiaDefaultShoppingListDataCreator() {
    return _instance;
  }

  JexiaDefaultShoppingListDataCreator._internal();


  @override
  Future<ShoppingItem> createNewItem(String newItemName) async{
    String accesToken = await authenticator.authenticate();

    final result = await http.post(_baseUrl + _listItemsDefaultPath,
        headers: {'Authorization': 'Bearer $accesToken'},
        body: jsonEncode(<String, String>{
        'description': newItemName,
        }),
    );
    return new ShoppingItem(newItemName, false);
  }




}
