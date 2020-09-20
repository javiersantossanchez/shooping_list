import 'package:shoopinglist/dtos/Product.dart';

import 'package:shoopinglist/dtos/ShoppingScheduler.dart';

abstract class ShoppingSchedulerProvider {

  final List<ShoppingScheduler> shoppingSchedulerList = new List();

  Future<List<ShoppingScheduler>> getShoppingSchedulerList();


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

  Future<void> updateShoppingList();
}
