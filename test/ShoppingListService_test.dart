import 'package:flutter_test/flutter_test.dart';
import 'package:shoopinglist/dtos/Product.dart';
import 'package:shoopinglist/dtos/ShoppingScheduler.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

import 'MockDataProvider.dart';

void main() {

  test('deleteProduct with empty id parameter', ()  async {
    ShoppingListService service = new ShoppingListService();
    service.deleteProduct(null);

  });



  test('Parser the text in the right way', ()  async {

    MockDataProvider dataProvider = MockDataProvider();

    ShoppingScheduler item;
    List<Product> shoppingList;
    List<ShoppingScheduler> list = new List();

    shoppingList = new List();
    shoppingList.add(new Product('Test 1',false,'1'));
    shoppingList.add(new Product('Test 2',false,'2'));
    shoppingList.add(new Product('Test 3',false,'3'));
    item = (new ShoppingScheduleItemBuilder(1, DateTime.now())..shoppingList = shoppingList).build();
    list.add(item);

    shoppingList = new List();
    shoppingList.add(new Product('Test 4',false,'4'));
    shoppingList.add(new Product('Test 5',false,'5'));
    item = (new ShoppingScheduleItemBuilder(1, DateTime.now())..shoppingList = shoppingList).build();
    list.add(item);
    dataProvider.shoppingSchedulerList = list;

    ShoppingListService service = new ShoppingListService(dataProvider: dataProvider);
    List<ShoppingScheduler> result = await service.loadShoppingDays();

    expect(result, list);
  });


}