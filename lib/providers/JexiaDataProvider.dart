import 'package:path_provider/path_provider.dart';
import 'package:shoopinglist/dtos/ShoppingItem.dart';
import 'dart:io';
import 'dart:convert';

import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';
import 'package:shoopinglist/parsers/FileParser.dart';
import 'package:shoopinglist/parsers/IShoppingScheduleParse.dart';

import 'IDataProvider.dart';
import 'authenticator/JexiaAuthenticator.dart';

import 'package:http/http.dart' as http;

class JexiaDataProvider extends IDataProvider{

  static final JexiaDataProvider _instance = new JexiaDataProvider._internal();

  final String _baseUrl ="https://2b23210d-91d7-4a37-a1b3-3a7a30b20e9c.nl00.app.jexia.com/";

  final String _listItemsDefaultPath = 'ds/shoppingList';

  final JexiaAuthenticator authenticator = JexiaAuthenticator ();


  final IShoppingScheduleParse _parser =  new FileParser();



  factory JexiaDataProvider() {
    return _instance;
  }

  JexiaDataProvider._internal();

  Future<List<ShoppingScheduleItem>> getScheduler() async {

    if (info == null || info.isEmpty) {
      String accesToken = await authenticator.authenticate();

      final result = await http.get(_baseUrl + _listItemsDefaultPath,
          headers: {'Authorization': 'Bearer $accesToken'});

      List<ShoppingScheduleItem> itemsFromFile = _parser.parser(result.body);
      if(itemsFromFile != null) {
        info.addAll(itemsFromFile);
      }
    }
    return info;
  }

  Future<List<ShoppingItem>> getShoppingList(int id) async {
    ShoppingScheduleItem v = info.firstWhere((item) => item.id == id);

    return v.shoppingList;
  }

  Future<void> createNewShoppingList(
      ShoppingScheduleItem newShoppingList) async {
    this.info.add(newShoppingList);
    this.updateShoppingList();
  }

  Future<void> deleteShoppingList(ShoppingScheduleItem shoppingListToDelete) async{
    this.info.remove(shoppingListToDelete);
    this.updateShoppingList();
  }

  Future<void> updateShoppingList() async{
    String accesToken = await authenticator.authenticate();
    //final file = await _localFile;
    //TODO: I need move this json.encode statement to parse class
    final result = await http.post(_baseUrl + _listItemsDefaultPath,
      headers: {'Authorization': 'Bearer $accesToken'},
      body: jsonEncode(<String, String>{
        'info': json.encode(this.info),
      }),
    );
  }
}
