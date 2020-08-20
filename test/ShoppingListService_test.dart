import 'package:flutter_test/flutter_test.dart';
import 'package:shoopinglist/dtos/CatalogueItem.dart';
import 'package:shoopinglist/dtos/PurchaseList.dart';
import 'package:shoopinglist/json/provider/FileDataProvider.dart';
import 'package:shoopinglist/parsers/FileParser.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import 'MockDataProvider.dart';

void main() {
  test('Parser the text in the right way', ()  async {

    MockDataProvider dataProvider = MockDataProvider();

    PurchaseList item;
    List<CatalogueItem> shoppingList;
    List<PurchaseList> list = new List();

    shoppingList = new List();
    shoppingList.add(new CatalogueItem('Test 1',false));
    shoppingList.add(new CatalogueItem('Test 2',false));
    shoppingList.add(new CatalogueItem('Test 3',false));
    item = (new ShoppingScheduleItemBuilder(1, DateTime.now())..shoppingList = shoppingList).build();
    list.add(item);

    shoppingList = new List();
    shoppingList.add(new CatalogueItem('Test 4',false));
    shoppingList.add(new CatalogueItem('Test 5',false));
    item = (new ShoppingScheduleItemBuilder(1, DateTime.now())..shoppingList = shoppingList).build();
    list.add(item);
    dataProvider.info = list;

    ShoppingListService service = new ShoppingListService(dataProvider: dataProvider);
    List<PurchaseList> result = await service.loadShoppingDays();

    expect(result, list);
  });


}