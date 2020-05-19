import 'package:flutter_test/flutter_test.dart';
import 'package:shoopinglist/dtos/ShoppingItem.dart';
import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';
import 'package:shoopinglist/providers/FileDataProvider.dart';
import 'package:shoopinglist/providers/FileParser.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import 'MockDataProvider.dart';

void main() {
  test('Parser the text in the right way', ()  async {

    MockDataProvider dataProvider = MockDataProvider();

    ShoppingScheduleItem item;
    List<ShoppingItem> shoppingList;
    List<ShoppingScheduleItem> list = new List();

    shoppingList = new List();
    shoppingList.add(new ShoppingItem('Test 1',false));
    shoppingList.add(new ShoppingItem('Test 2',false));
    shoppingList.add(new ShoppingItem('Test 3',false));
    item = (new ShoppingScheduleItemBuilder(1, DateTime.now())..shoppingList = shoppingList).build();
    list.add(item);

    shoppingList = new List();
    shoppingList.add(new ShoppingItem('Test 4',false));
    shoppingList.add(new ShoppingItem('Test 5',false));
    item = (new ShoppingScheduleItemBuilder(1, DateTime.now())..shoppingList = shoppingList).build();
    list.add(item);
    dataProvider.info = list;

    ShoppingListService service = new ShoppingListService(dataProvider: dataProvider);
    List<ShoppingScheduleItem> result = await service.loadShoppingDays();

    expect(result, list);
  });


}