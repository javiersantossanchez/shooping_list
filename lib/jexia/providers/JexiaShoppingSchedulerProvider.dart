import 'package:shoopinglist/dtos/Product.dart';
import 'dart:convert';

import 'package:shoopinglist/dtos/ShoppingScheduler.dart';
import 'package:shoopinglist/parsers/FileParser.dart';
import 'package:shoopinglist/parsers/IShoppingScheduleParse.dart';

import '../../providers/ShoppingSchedulerProvider.dart';

import 'package:http/http.dart' as http;

import 'authenticator/JexiaAuthenticator.dart';

class JexiaShoppingSchedulerProvider extends ShoppingSchedulerProvider{

  static final JexiaShoppingSchedulerProvider _instance = new JexiaShoppingSchedulerProvider._internal();

  final String _baseUrl ="https://2b23210d-91d7-4a37-a1b3-3a7a30b20e9c.nl00.app.jexia.com/";

  final String _listItemsDefaultPath = 'ds/shoppingList';

  final JexiaAuthenticator authenticator = JexiaAuthenticator ();


  final IShoppingScheduleParse _parser =  new FileParser();



  factory JexiaShoppingSchedulerProvider() {
    return _instance;
  }

  JexiaShoppingSchedulerProvider._internal();

  Future<List<ShoppingScheduler>> getShoppingSchedulerList() async {

    if (shoppingSchedulerList == null || shoppingSchedulerList.isEmpty) {
      String accesToken = await authenticator.authenticate();

      final result = await http.get(_baseUrl + _listItemsDefaultPath,
          headers: {'Authorization': 'Bearer $accesToken'});

      List<ShoppingScheduler> itemsFromFile = _parser.parser(result.body);
      if(itemsFromFile != null) {
        shoppingSchedulerList.addAll(itemsFromFile);
      }
    }
    return shoppingSchedulerList;
  }

  Future<List<Product>> getProductList(int id) async {
    ShoppingScheduler v = shoppingSchedulerList.firstWhere((item) => item.id == id);

    return v.shoppingList;
  }

  Future<void> createShoppingScheduler(
      ShoppingScheduler newShoppingList) async {
    this.shoppingSchedulerList.add(newShoppingList);
    this.updateShoppingList();
  }

  Future<void> deleteShoppingScheduler(ShoppingScheduler shoppingListToDelete) async{
    this.shoppingSchedulerList.remove(shoppingListToDelete);
    this.updateShoppingList();
  }

  Future<void> updateShoppingList() async{
    String accesToken = await authenticator.authenticate();
    //final file = await _localFile;
    //TODO: I need move this json.encode statement to parse class
    final result = await http.post(_baseUrl + _listItemsDefaultPath,
      headers: {'Authorization': 'Bearer $accesToken'},
      body: jsonEncode(<String, String>{
        'info': json.encode(this.shoppingSchedulerList),
      }),
    );
  }
}
