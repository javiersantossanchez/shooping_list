import 'package:shoopinglist/dtos/ShoppingListItem.dart';
import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';
import 'package:shoopinglist/providers/FileDataProvider.dart';

class ShoppingListService {
  List<ShoppingListItem> shoppingList;

  List<ShoppingScheduleItem> shoppingDates;

  FileDataProvider dataProvider = new FileDataProvider();

  List<ShoppingScheduleItem> loadShoppingDays(){

      if(this.shoppingDates == null ){

        int index =0 ;
          this.shoppingDates = List<ShoppingScheduleItem>();
          ShoppingScheduleItem item = ShoppingScheduleItem(index++,new DateTime.utc(2020, 4, 7));
          this.shoppingDates.add(item);

          item = ShoppingScheduleItem(index++,new DateTime.utc(2020, 4, 7));
          this.shoppingDates.add(item);

          item = ShoppingScheduleItem(index++,new DateTime.utc(2020, 4, 16));
          this.shoppingDates.add(item);

          item = ShoppingScheduleItem(index++, new DateTime.utc(2020, 4, 22));
          this.shoppingDates.add(item);
      }
      return this.shoppingDates;
  }

  ShoppingListService(){
    this.dataProvider.writeContent();
    this.dataProvider.getScheduler();
  }

  List<ShoppingListItem> loadShoppingList(int id){
    if(this.shoppingList == null ){
      this.shoppingList = List<ShoppingListItem>();

      ShoppingListItem item = ShoppingListItem("Arroz");
      this.shoppingList.add(item);


      item = ShoppingListItem("Pasta");
      this.shoppingList.add(item);

      item = ShoppingListItem("Atun");
      this.shoppingList.add(item);

      item = ShoppingListItem("Maiz");
      this.shoppingList.add(item);

    }
    return this.shoppingList;
  }

}