import 'package:shoopinglist/dtos/CatalogueItem.dart';
import 'dart:convert';

import 'package:shoopinglist/providers/IDefaultShoppingListDataProvider.dart';
import 'package:shoopinglist/providers/StaticDefaultShoppingListDataProvider.dart';


import 'package:http/http.dart' as http;

import 'authenticator/JexiaAuthenticator.dart';
import 'connector/JexiaConnectionConfiguration.dart';



class JexiaDefaultShoppingListDataProvider implements IDefaultShoppingListDataProvider{

  static final JexiaDefaultShoppingListDataProvider _instance = new JexiaDefaultShoppingListDataProvider._internal();

  final String _listItemsDefaultPath = 'ds/list_items_default';

  final JexiaAuthenticator authenticator = JexiaAuthenticator ();

  final JexiaConnectionConfiguration connectorConfiguration = new JexiaConnectionConfiguration();

  factory JexiaDefaultShoppingListDataProvider() {
    return _instance;
  }

  JexiaDefaultShoppingListDataProvider._internal();

  @override
  Future<List<CatalogueItem>> getDefaultShoppingList() async {

        try {
          String accessToken = await authenticator.authenticate();

          final result = await http.get(connectorConfiguration.getUriToEndPoint(_listItemsDefaultPath),
              headers: {'Authorization': 'Bearer $accessToken'});

          List<dynamic> decode = json.decode(result.body);

          return decode.map((item) => new CatalogueItem(item['description'], false))
              .toList();
        }catch (e){
          print('There is a problem on connection with Jexia');
          StaticDefaultShoppingListDataProvider staticProvider = new StaticDefaultShoppingListDataProvider();
          return staticProvider.getDefaultShoppingList();

        }

  }

}
