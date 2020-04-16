
import 'ShoppingListItem.dart';

class ShoppingScheduleItem  {

  int id;

  DateTime shoppingDate;

  List<ShoppingListItem> shoppingList;

  ShoppingScheduleItem(int id , DateTime shoppingDate, List<ShoppingListItem> shoppingList){
    this.id = id;
    this.shoppingDate = shoppingDate;
    this.shoppingList = shoppingList;
  }


  Map<String, dynamic> toJson() =>
      {
        'shoppingDate': shoppingDate.toIso8601String(),
        'id': this.id,
        'shoppingList':this.shoppingList.map((item) => {"description": item.description, "ready": item.ready}).toList()
      };

}