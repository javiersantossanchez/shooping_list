
import 'package:shoopinglist/dtos/Product.dart';
import 'package:shoopinglist/dtos/ShoppingScheduler.dart';
import 'package:shoopinglist/json/provider/FileDataProvider.dart';

import 'package:shoopinglist/providers/ShoppingSchedulerProvider.dart';
import 'package:shoopinglist/providers/ProductCatalogProvider.dart';

import 'package:shoopinglist/jexia/providers/JexiaProductCatalogProvider.dart';

class ShoppingListService {


  final ShoppingSchedulerProvider _dataProvider;


  final ProductCatalogProvider __defaultShoppingListDataCreator;



  ShoppingListService({ShoppingSchedulerProvider dataProvider, ProductCatalogProvider defaultShoppingListDataCreator}):
        this._dataProvider = dataProvider ?? new FileDataProvider() ,
        this.__defaultShoppingListDataCreator = defaultShoppingListDataCreator?? new JexiaProductCatalogProvider();

  Future<List<ShoppingScheduler>> loadShoppingDays() async {
    return await this._dataProvider.getShoppingSchedulerList();
  }

  Future<List<Product>> loadShoppingList(int id){
    return this._dataProvider.getProductList(id);
  }


  Future<List<Product>> getDefaultShoppingList() async{
    return this.__defaultShoppingListDataCreator.getProductCatalog();
  }


  void createNewItemOnShoppingList(String newItemName ) {
    __defaultShoppingListDataCreator.createNewProduct(newItemName);
  }

  void createSchuelde(DateTime selectedDate, List<Product> listItem ) {
    ShoppingScheduler newShoppingList = (ShoppingScheduleItemBuilder((new DateTime.now()).millisecondsSinceEpoch,selectedDate)..shoppingList = listItem).build();
    _dataProvider.createShoppingScheduler(newShoppingList);
  }

  void deleteSchuelde(ShoppingScheduler shoppingListToDelete) {
    _dataProvider.deleteShoppingScheduler(shoppingListToDelete);
  }

  void updateShoopingItem(){
    _dataProvider.updateShoppingList();
  }

  Future<bool> deleteProduct(String id){
    return __defaultShoppingListDataCreator.deleteProduct(id);
  }

}