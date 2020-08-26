import 'package:shoopinglist/dtos/Product.dart';

import 'package:shoopinglist/providers/ProductCatalogProvider.dart';



class StaticDefaultShoppingListDataProvider implements ProductCatalogProvider{

  static final StaticDefaultShoppingListDataProvider _instance = new StaticDefaultShoppingListDataProvider._internal();

  factory StaticDefaultShoppingListDataProvider() {
    return _instance;
  }

  StaticDefaultShoppingListDataProvider._internal();

  @override
  Future<List<Product>> getProductCatalog() async {
    List<Product> listToReturn = new List();
    listToReturn.add(new Product("Arroz",false));
    listToReturn.add(new Product("Pasta",false));
    listToReturn.add(new Product("Jabon de ropa",false));
    listToReturn.add(new Product("Pasta de dientes",false));
    listToReturn.add(new Product("Cafe",false));
    listToReturn.add(new Product("Papas",false));
    listToReturn.add(new Product("Aceite de oliva",false));
    listToReturn.add(new Product("Banana",false));
    listToReturn.add(new Product("Fresa",false));
    listToReturn.add(new Product("Tomate",false));
    listToReturn.add(new Product("Leche",false));
    listToReturn.add(new Product("Pañales",false));
    listToReturn.add(new Product("Jabon de Ainara",false));
    listToReturn.add(new Product("Atun",false));
    listToReturn.add(new Product("Diablito",false));
    listToReturn.add(new Product("Zanahorias",false));
    listToReturn.add(new Product("Cebolla",false));
    listToReturn.add(new Product("Juegos",false));
    listToReturn.add(new Product("Jamon",false));
    listToReturn.add(new Product("Queso crema",false));
    listToReturn.add(new Product("Pan de sanwich",false));
    listToReturn.add(new Product("Yogurt",false));
    listToReturn.add(new Product("Carne molida",false));
    listToReturn.add(new Product("Pollo",false));
    listToReturn.add(new Product("Bisteck",false));
    listToReturn.add(new Product("Shampo",false));
    listToReturn.add(new Product("Acondicionador",false));
    listToReturn.add(new Product("Jabon de bañarse",false));
    listToReturn.add(new Product("Pimenton",false));
    listToReturn.add(new Product("Harina de cachapa",false));
    listToReturn.add(new Product("Harina pan",false));
    listToReturn.add(new Product("Harina de trigo",false));
    listToReturn.add(new Product("Mantequilla de mani",false));
    listToReturn.add(new Product("Mantequilla",false));
    listToReturn.add(new Product("Cereal",false));
    listToReturn.add(new Product("Compota",false));
    listToReturn.add(new Product("Mandarina",false));
    listToReturn.add(new Product("Aguacate",false));
    listToReturn.add(new Product("Toallitas clorox",false));
    listToReturn.add(new Product("Desinfectante",false));
    return listToReturn;
  }

  @override
  Future<void> createNewProduct(String newItemName) {
    // TODO: implement createNewProduct
    return null;
  }

}
