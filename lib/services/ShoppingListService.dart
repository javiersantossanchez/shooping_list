import 'dart:convert';

import 'package:shoopinglist/dtos/ShoppingItem.dart';
import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';
import 'package:shoopinglist/providers/FileDataProvider.dart';

import 'package:shoopinglist/providers/IDataProvider.dart';

import 'package:shoopinglist/providers/IDefaultShoppingListDataProvider.dart';
import 'package:shoopinglist/providers/JexiaDefaultShoppingListDataProvider.dart';

class ShoppingListService {


  final IDataProvider _dataProvider;

  final IDefaultShoppingListDataProvider _defaultShoppingListDataProvider;



  ShoppingListService({IDataProvider dataProvider, IDefaultShoppingListDataProvider defaultShoppingListDataProvider}):
        this._dataProvider = dataProvider ?? new FileDataProvider() ,
        this._defaultShoppingListDataProvider = defaultShoppingListDataProvider?? new JexiaDefaultShoppingListDataProvider();

  Future<List<ShoppingScheduleItem>> loadShoppingDays() async {
    return await this._dataProvider.getScheduler();
  }

  Future<List<ShoppingItem>> loadShoppingList(int id){
    return this._dataProvider.getShoppingList(id);
  }


  Future<List<ShoppingItem>> getDefaultShoppingList() async{
    return this._defaultShoppingListDataProvider.getDefaultShoppingList();

/*

    List<ShoppingItem> listToReturn = new List();
    listToReturn.add(new ShoppingItem("Arroz",false));
    listToReturn.add(new ShoppingItem("Pasta",false));
    listToReturn.add(new ShoppingItem("Jabon de ropa",false));
    listToReturn.add(new ShoppingItem("Pasta de dientes",false));
    listToReturn.add(new ShoppingItem("Cafe",false));
    listToReturn.add(new ShoppingItem("Papas",false));
    listToReturn.add(new ShoppingItem("Aceite de oliva",falseimport 'package:http/http.dart' as http;
));



    listToReturn.add(new ShoppingItem("Banana",false));
    listToReturn.add(new ShoppingItem("Fresa",false));
    listToReturn.add(new ShoppingItem("Tomate",false));
    listToReturn.add(new ShoppingItem("Leche",false));
    listToReturn.add(new ShoppingItem("Pañales",false));
    listToReturn.add(new ShoppingItem("Jabon de Ainara",false));
    listToReturn.add(new ShoppingItem("Atun",false));
    listToReturn.add(new ShoppingItem("Diablito",false));
    listToReturn.add(new ShoppingItem("Zanahorias",false));





    listToReturn.add(new ShoppingItem("Cebolla",false));
    listToReturn.add(new ShoppingItem("Juegos",false));
    listToReturn.add(new ShoppingItem("Jamon",false));
    listToReturn.add(new ShoppingItem("Queso crema",false));
    listToReturn.add(new ShoppingItem("Pan de sanwich",false));
    listToReturn.add(new ShoppingItem("Yogurt",false));
    listToReturn.add(new ShoppingItem("Carne molida",false));
    listToReturn.add(new ShoppingItem("Pollo",false));
    listToReturn.add(new ShoppingItem("Bisteck",false));







    listToReturn.add(new ShoppingItem("Shampo",false));
    listToReturn.add(new ShoppingItem("Acondicionador",false));
    listToReturn.add(new ShoppingItem("Jabon de bañarse",false));
    listToReturn.add(new ShoppingItem("Pimenton",false));
    listToReturn.add(new ShoppingItem("Harina de cachapa",false));
    listToReturn.add(new ShoppingItem("Harina pan",false));
    listToReturn.add(new ShoppingItem("Harina de trigo",false));
    listToReturn.add(new ShoppingItem("Mantequilla de mani",false));
    listToReturn.add(new ShoppingItem("Mantequilla",false));



    listToReturn.add(new ShoppingItem("Cereal",false));
    listToReturn.add(new ShoppingItem("Compota",false));
    listToReturn.add(new ShoppingItem("Mandarina",false));
    listToReturn.add(new ShoppingItem("Aguacate",false));
    listToReturn.add(new ShoppingItem("Toallitas clorox",false));
    listToReturn.add(new ShoppingItem("Desinfectante",false));*/
    //return listToReturn;
  }

  void createSchuelde(DateTime selectedDate, List<ShoppingItem> listItem ) {
    ShoppingScheduleItem newShoppingList = (ShoppingScheduleItemBuilder((new DateTime.now()).millisecondsSinceEpoch,selectedDate)..shoppingList = listItem).build();
    _dataProvider.createNewShoppingList(newShoppingList);
  }

  void deleteSchuelde(ShoppingScheduleItem shoppingListToDelete) {
    _dataProvider.deleteShoppingList(shoppingListToDelete);
  }

  void updateShoopingItem(){
    _dataProvider.updateShoppingList();
  }

}