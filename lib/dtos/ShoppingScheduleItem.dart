
import 'ShoppingListItem.dart';

class ShoppingScheduleItem  {

  int id;

  DateTime shoppingDate;

  List<ShoppingListItem> shoppingList;

  ShoppingScheduleItem(int id , DateTime shoppingDate){
    this.id = id;
    this.shoppingDate = shoppingDate;
  }
}