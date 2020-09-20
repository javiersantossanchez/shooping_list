import 'package:shoopinglist/dtos/Product.dart';

import 'package:shoopinglist/dtos/ShoppingScheduler.dart';
import 'package:shoopinglist/providers/ShoppingSchedulerProvider.dart';


class MockDataProvider implements ShoppingSchedulerProvider{

  List<ShoppingScheduler> _info = new List();

  set shoppingSchedulerList(List<ShoppingScheduler> value) {
    _info = value;
  }

  Future<List<ShoppingScheduler>> getShoppingSchedulerList() async {
      return Future.value(_info);
  }

  Future<List<Product>> getProductList(int id) async {
  }

  Future<void> createShoppingScheduler(
      ShoppingScheduler newShoppingList) async {
  }

  Future<void> deleteShoppingScheduler(ShoppingScheduler shoppingListToDelete) async{
  }

  @override
  Future<void> updateShoppingList() {
    return null;
  }

  @override
  // TODO: implement info
  List<ShoppingScheduler> get shoppingSchedulerList => null;
}
