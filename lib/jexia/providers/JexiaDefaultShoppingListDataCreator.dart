import 'package:shoopinglist/dtos/CatalogueItem.dart';
import 'dart:convert';



import 'package:http/http.dart' as http;

import '../../providers/IDefaultShoppingListDataCreator.dart';
import 'authenticator/JexiaAuthenticator.dart';
import 'connector/JexiaConnectionConfiguration.dart';


class JexiaDefaultShoppingListDataCreator implements  IDefaultShoppingListDataCreator{

  static final JexiaDefaultShoppingListDataCreator _instance = new JexiaDefaultShoppingListDataCreator._internal();

  final JexiaConnectionConfiguration connectorConfiguration = new JexiaConnectionConfiguration();

  final String _listItemsDefaultPath = 'ds/list_items_default';

  final JexiaAuthenticator authenticator = JexiaAuthenticator ();


  factory JexiaDefaultShoppingListDataCreator() {
    return _instance;
  }

  JexiaDefaultShoppingListDataCreator._internal();


  @override
  Future<CatalogueItem> createNewItem(String newItemName) async{
    String accesToken = await authenticator.authenticate();

    final result = await http.post(connectorConfiguration.getUriToEndPoint(_listItemsDefaultPath) ,
        headers: {'Authorization': 'Bearer $accesToken'},
        body: jsonEncode(<String, String>{
        'description': newItemName,
        }),
    );
    return new CatalogueItem(newItemName, false);
  }




}
