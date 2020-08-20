import 'package:shoopinglist/dtos/CatalogueItem.dart';

import 'package:shoopinglist/dtos/PurchaseList.dart';
import 'package:shoopinglist/providers/IDataProvider.dart';


class MockDataProvider implements IDataProvider{

  List<PurchaseList> _info = new List();

  set info(List<PurchaseList> value) {
    _info = value;
  }

  Future<List<PurchaseList>> getScheduler() async {
      return Future.value(_info);
  }

  Future<List<CatalogueItem>> getShoppingList(int id) async {
  }

  Future<void> createNewShoppingList(
      PurchaseList newShoppingList) async {
  }

  Future<void> deleteShoppingList(PurchaseList shoppingListToDelete) async{
  }

  @override
  Future<void> updateShoppingList() {
    return null;
  }

  @override
  // TODO: implement info
  List<PurchaseList> get info => null;
}
