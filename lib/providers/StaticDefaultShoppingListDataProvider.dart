import 'package:path_provider/path_provider.dart';
import 'package:shoopinglist/dtos/CatalogueItem.dart';
import 'dart:io';
import 'dart:convert';

import 'package:shoopinglist/dtos/PurchaseList.dart';
import 'package:shoopinglist/parsers/FileParser.dart';
import 'package:shoopinglist/parsers/IShoppingScheduleParse.dart';
import 'package:shoopinglist/providers/IDefaultShoppingListDataProvider.dart';

import 'IDataProvider.dart';

import 'package:http/http.dart' as http;


class StaticDefaultShoppingListDataProvider implements IDefaultShoppingListDataProvider{

  static final StaticDefaultShoppingListDataProvider _instance = new StaticDefaultShoppingListDataProvider._internal();

  factory StaticDefaultShoppingListDataProvider() {
    return _instance;
  }

  StaticDefaultShoppingListDataProvider._internal();

  @override
  Future<List<CatalogueItem>> getDefaultShoppingList() async {
    List<CatalogueItem> listToReturn = new List();
    listToReturn.add(new CatalogueItem("Arroz",false));
    listToReturn.add(new CatalogueItem("Pasta",false));
    listToReturn.add(new CatalogueItem("Jabon de ropa",false));
    listToReturn.add(new CatalogueItem("Pasta de dientes",false));
    listToReturn.add(new CatalogueItem("Cafe",false));
    listToReturn.add(new CatalogueItem("Papas",false));
    listToReturn.add(new CatalogueItem("Aceite de oliva",false));
    listToReturn.add(new CatalogueItem("Banana",false));
    listToReturn.add(new CatalogueItem("Fresa",false));
    listToReturn.add(new CatalogueItem("Tomate",false));
    listToReturn.add(new CatalogueItem("Leche",false));
    listToReturn.add(new CatalogueItem("Pañales",false));
    listToReturn.add(new CatalogueItem("Jabon de Ainara",false));
    listToReturn.add(new CatalogueItem("Atun",false));
    listToReturn.add(new CatalogueItem("Diablito",false));
    listToReturn.add(new CatalogueItem("Zanahorias",false));
    listToReturn.add(new CatalogueItem("Cebolla",false));
    listToReturn.add(new CatalogueItem("Juegos",false));
    listToReturn.add(new CatalogueItem("Jamon",false));
    listToReturn.add(new CatalogueItem("Queso crema",false));
    listToReturn.add(new CatalogueItem("Pan de sanwich",false));
    listToReturn.add(new CatalogueItem("Yogurt",false));
    listToReturn.add(new CatalogueItem("Carne molida",false));
    listToReturn.add(new CatalogueItem("Pollo",false));
    listToReturn.add(new CatalogueItem("Bisteck",false));
    listToReturn.add(new CatalogueItem("Shampo",false));
    listToReturn.add(new CatalogueItem("Acondicionador",false));
    listToReturn.add(new CatalogueItem("Jabon de bañarse",false));
    listToReturn.add(new CatalogueItem("Pimenton",false));
    listToReturn.add(new CatalogueItem("Harina de cachapa",false));
    listToReturn.add(new CatalogueItem("Harina pan",false));
    listToReturn.add(new CatalogueItem("Harina de trigo",false));
    listToReturn.add(new CatalogueItem("Mantequilla de mani",false));
    listToReturn.add(new CatalogueItem("Mantequilla",false));
    listToReturn.add(new CatalogueItem("Cereal",false));
    listToReturn.add(new CatalogueItem("Compota",false));
    listToReturn.add(new CatalogueItem("Mandarina",false));
    listToReturn.add(new CatalogueItem("Aguacate",false));
    listToReturn.add(new CatalogueItem("Toallitas clorox",false));
    listToReturn.add(new CatalogueItem("Desinfectante",false));
    return listToReturn;
  }


}
