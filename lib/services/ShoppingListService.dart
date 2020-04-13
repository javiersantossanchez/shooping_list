import 'package:shoopinglist/dtos/ShoppingListItem.dart';
import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';
import 'package:shoopinglist/providers/FileDataProvider.dart';

class ShoppingListService {
  List<ShoppingListItem> shoppingList;

  List<ShoppingScheduleItem> shoppingDates;

  FileDataProvider dataProvider = new FileDataProvider();

  Future<List<ShoppingScheduleItem>> loadShoppingDays(){
      return dataProvider.getScheduler();
  }

  ShoppingListService(){
  }

  Future<List<ShoppingListItem>> loadShoppingList(int id){
    return this.dataProvider.getScheduler1111(id);
  }

}