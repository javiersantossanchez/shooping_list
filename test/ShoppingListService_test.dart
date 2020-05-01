import 'package:flutter_test/flutter_test.dart';
import 'package:shoopinglist/dtos/ShoppingListItem.dart';
import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';
import 'package:shoopinglist/providers/FileDataProvider.dart';
import 'package:shoopinglist/providers/FileParser.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import 'MockDataProvider.dart';

void main() {
  test('Parser the text in the right way', ()  async {

    MockDataProvider dataProvider = MockDataProvider();

    ShoppingScheduleItem item;
    List<ShoppingListItem> shoppingList;
    List<ShoppingScheduleItem> list = new List();

    shoppingList = new List();
    shoppingList.add(new ShoppingListItem('Test 1'));
    shoppingList.add(new ShoppingListItem('Test 2'));
    shoppingList.add(new ShoppingListItem('Test 3'));
    item = new ShoppingScheduleItem(1, DateTime.now(), shoppingList);
    list.add(item);

    shoppingList = new List();
    shoppingList.add(new ShoppingListItem('Test 4'));
    shoppingList.add(new ShoppingListItem('Test 5'));
    item = new ShoppingScheduleItem(1, DateTime.now(), shoppingList);
    list.add(item);
    dataProvider.info = list;

    ShoppingListService service = new ShoppingListService(dataProvider: dataProvider);
    List<ShoppingScheduleItem> result = await service.loadShoppingDays();

    expect(result, list);
  });


}