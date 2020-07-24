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


class JexiaDefaultShoppingListDataProvider implements IDefaultShoppingListDataProvider{

  static final JexiaDefaultShoppingListDataProvider _instance = new JexiaDefaultShoppingListDataProvider._internal();

  final String _baseUrl ="https://2b23210d-91d7-4a37-a1b3-3a7a30b20e9c.app.jexia.com/";

  final String _listItemsDefaultPath = 'ds/list_items_default';

  final JexiaAuthenticator authenticator = JexiaAuthenticator ();


  factory JexiaDefaultShoppingListDataProvider() {
    return _instance;
  }

  JexiaDefaultShoppingListDataProvider._internal();



  @override
  Future<List<ShoppingItem>> getDefaultShoppingList() async {

        try {
          String accesToken = await authenticator.authenticate();

          final result = await http.get(_baseUrl + _listItemsDefaultPath,
              headers: {'Authorization': 'Bearer $accesToken'});

          List<dynamic> decode = json.decode(result.body);

          return decode.map((item) => new ShoppingItem(item['description'], false))
              .toList();
        }catch (e){
          print('There is a problem on connection with Jexia');
          StaticDefaultShoppingListDataProvider staticProvider = new StaticDefaultShoppingListDataProvider();
          return staticProvider.getDefaultShoppingList();

        }

  }

}
