import 'package:shoopinglist/dtos/Product.dart';
import 'dart:convert';



import 'package:http/http.dart' as http;
import 'package:shoopinglist/providers/StaticDefaultShoppingListDataProvider.dart';

import '../../providers/ProductCatalogProvider.dart';
import 'authenticator/JexiaAuthenticator.dart';
import 'connector/JexiaConnectionConfiguration.dart';


class JexiaProductCatalogProvider implements  ProductCatalogProvider{

  static final JexiaProductCatalogProvider _instance = new JexiaProductCatalogProvider._internal();

  final JexiaConnectionConfiguration connectorConfiguration = new JexiaConnectionConfiguration();

  final String _listItemsDefaultPath = 'ds/list_items_default';

  final JexiaAuthenticator authenticator = JexiaAuthenticator ();


  factory JexiaProductCatalogProvider() {
    return _instance;
  }

  JexiaProductCatalogProvider._internal();


  @override
  Future<Product> createNewProduct(String newItemName) async{
    String accesToken = await authenticator.authenticate();

    final result = await http.post(connectorConfiguration.getUriToEndPoint(_listItemsDefaultPath) ,
        headers: {'Authorization': 'Bearer $accesToken'},
        body: jsonEncode(<String, String>{
        'description': newItemName,
        }),
    );
     ///TODO: get the id from the response object
    return new Product(newItemName, false, '123');
  }

  @override
  Future<List<Product>> getProductCatalog() async {
    print('Getting product list from jexia server');
    try {
      String accessToken = await authenticator.authenticate();

      final result = await http.get(connectorConfiguration.getUriToEndPoint(_listItemsDefaultPath),
          headers: {'Authorization': 'Bearer $accessToken'});

      List<dynamic> decode = json.decode(result.body);

      return decode.map((item) => new Product(item['description'], false,item['id']))
          .toList();
    }catch (e){
      print('There is a problem on connection with Jexia');
      StaticDefaultShoppingListDataProvider staticProvider = new StaticDefaultShoppingListDataProvider();
      return staticProvider.getProductCatalog();

    }

  }

  @override
  Future<bool> deleteProduct(String id) async {
    print('Deleting product from jexia server');

    String accesToken = await authenticator.authenticate();

    Map<String, String> queryParameters1 = {
      "cond": "[{\"field\":\"id\"},\"=\",\"$id\"]"
    };
    final result = await http.delete(connectorConfiguration.getUriWithParamToEndPoint(_listItemsDefaultPath,queryParameters1),
        headers: {'Authorization': 'Bearer $accesToken'});
    return result.statusCode== 200;
  }

}
