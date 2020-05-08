import 'package:shoopinglist/dtos/ShoppingItem.dart';
import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';
import 'package:shoopinglist/providers/FileDataProvider.dart';

import 'package:shoopinglist/providers/IFileDataProvider.dart';

class ShoppingListService {


  List<ShoppingScheduleItem> shoppingDates;

  final IFileDataProvider dataProvider;

  Future<List<ShoppingScheduleItem>> loadShoppingDays() async {
    shoppingDates = await  dataProvider.getScheduler();
    return shoppingDates;
  }

  ShoppingListService({IFileDataProvider dataProvider}): this.dataProvider = dataProvider ?? new FileDataProvider();

  Future<List<ShoppingItem>> loadShoppingList(int id){
    return this.dataProvider.getShoppingList(id);
  }


  List<ShoppingItem> getDefaultShoppingList(){
    List<ShoppingItem> listToReturn = new List();
    listToReturn.add(new ShoppingItem("Arroz"));
    listToReturn.add(new ShoppingItem("Pasta"));
    listToReturn.add(new ShoppingItem("Jabon de ropa"));
    listToReturn.add(new ShoppingItem("Pasta de dientes"));
    listToReturn.add(new ShoppingItem("Cafe"));
    listToReturn.add(new ShoppingItem("Papas"));
    listToReturn.add(new ShoppingItem("Aceite de oliva"));
    listToReturn.add(new ShoppingItem("Banana"));
    listToReturn.add(new ShoppingItem("Fresa"));
    listToReturn.add(new ShoppingItem("Tomate"));
    listToReturn.add(new ShoppingItem("Leche"));
    listToReturn.add(new ShoppingItem("Pañales"));
    listToReturn.add(new ShoppingItem("Jabon de Ainara"));
    listToReturn.add(new ShoppingItem("Atun"));
    listToReturn.add(new ShoppingItem("Diablito"));
    listToReturn.add(new ShoppingItem("Zanahorias"));
    listToReturn.add(new ShoppingItem("Cebolla"));
    listToReturn.add(new ShoppingItem("Juegos"));
    listToReturn.add(new ShoppingItem("Jamon"));
    listToReturn.add(new ShoppingItem("Queso crema"));
    listToReturn.add(new ShoppingItem("Pan de sanwich"));
    listToReturn.add(new ShoppingItem("Yogurt"));
    listToReturn.add(new ShoppingItem("Carne molida"));
    listToReturn.add(new ShoppingItem("Pollo"));
    listToReturn.add(new ShoppingItem("Bisteck"));
    listToReturn.add(new ShoppingItem("Shampo"));
    listToReturn.add(new ShoppingItem("Acondicionador"));
    listToReturn.add(new ShoppingItem("Jabon de bañarse"));
    listToReturn.add(new ShoppingItem("Pimenton"));
    listToReturn.add(new ShoppingItem("Harina de cachapa"));
    listToReturn.add(new ShoppingItem("Harina pan"));
    listToReturn.add(new ShoppingItem("Harina de trigo"));
    listToReturn.add(new ShoppingItem("Mantequilla de mani"));
    listToReturn.add(new ShoppingItem("Mantequilla"));
    listToReturn.add(new ShoppingItem("Cereal"));
    listToReturn.add(new ShoppingItem("Compota"));
    listToReturn.add(new ShoppingItem("Mandarina"));
    listToReturn.add(new ShoppingItem("Aguacate"));
    listToReturn.add(new ShoppingItem("Toallitas clorox"));
    listToReturn.add(new ShoppingItem("Desinfectante"));
    return listToReturn;
  }

  void createSchuelde(DateTime selectedDate, List<ShoppingItem> listItem ) {
    ShoppingScheduleItem newShoppingList = (ShoppingScheduleItemBuilder(this.shoppingDates.length +1,selectedDate)..shoppingList = listItem).build();
    dataProvider.createNewShoppingList(newShoppingList);
  }

  void deleteSchuelde(ShoppingScheduleItem shoppingListToDelete) {
    dataProvider.deleteShoppingList(shoppingListToDelete);
  }

}