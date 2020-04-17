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

  Future<void> addNewItem(ShoppingScheduleItem va){
    return this.dataProvider.updateddd(va);
  }

  List<ShoppingListItem> getDefaultShoppingList(){
    List<ShoppingListItem> listToReturn = new List();
    listToReturn.add(new ShoppingListItem("Arroz"));
    listToReturn.add(new ShoppingListItem("Pasta"));
    listToReturn.add(new ShoppingListItem("Jabon de ropa"));
    listToReturn.add(new ShoppingListItem("Pasta de dientes"));
    listToReturn.add(new ShoppingListItem("Cafe"));
    listToReturn.add(new ShoppingListItem("Papas"));
    listToReturn.add(new ShoppingListItem("Aceite de oliva"));
    listToReturn.add(new ShoppingListItem("Banana"));
    listToReturn.add(new ShoppingListItem("Fresa"));
    listToReturn.add(new ShoppingListItem("Tomate"));
    listToReturn.add(new ShoppingListItem("Leche"));
    listToReturn.add(new ShoppingListItem("Pañales"));
    listToReturn.add(new ShoppingListItem("Jabon de Ainara"));
    listToReturn.add(new ShoppingListItem("Atun"));
    listToReturn.add(new ShoppingListItem("Diablito"));
    listToReturn.add(new ShoppingListItem("Zanahorias"));
    listToReturn.add(new ShoppingListItem("Cebolla"));
    listToReturn.add(new ShoppingListItem("Juegos"));
    listToReturn.add(new ShoppingListItem("Jamon"));
    listToReturn.add(new ShoppingListItem("Queso crema"));
    listToReturn.add(new ShoppingListItem("Pan de sanwich"));
    listToReturn.add(new ShoppingListItem("Yogurt"));
    listToReturn.add(new ShoppingListItem("Carne molida"));
    listToReturn.add(new ShoppingListItem("Pollo"));
    listToReturn.add(new ShoppingListItem("Bisteck"));
    listToReturn.add(new ShoppingListItem("Shampo"));
    listToReturn.add(new ShoppingListItem("Acondicionador"));
    listToReturn.add(new ShoppingListItem("Jabon de bañarse"));
    listToReturn.add(new ShoppingListItem("Pimenton"));
    listToReturn.add(new ShoppingListItem("Harina de cachapa"));
    listToReturn.add(new ShoppingListItem("Harina pan"));
    listToReturn.add(new ShoppingListItem("Harina de trigo"));
    listToReturn.add(new ShoppingListItem("Mantequilla de mani"));
    listToReturn.add(new ShoppingListItem("Mantequilla"));
    listToReturn.add(new ShoppingListItem("Cereal"));
    listToReturn.add(new ShoppingListItem("Compota"));
    listToReturn.add(new ShoppingListItem("Mandarina"));
    listToReturn.add(new ShoppingListItem("Aguacate"));
    listToReturn.add(new ShoppingListItem("Toallitas clorox"));
    listToReturn.add(new ShoppingListItem("Desinfectante"));
    return listToReturn;
  }

}