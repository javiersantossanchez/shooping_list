import 'package:shoopinglist/dtos/Product.dart';

import 'package:shoopinglist/providers/ProductCatalogProvider.dart';
import 'package:uuid/uuid.dart';



class StaticDefaultShoppingListDataProvider implements ProductCatalogProvider{

  static final StaticDefaultShoppingListDataProvider _instance = new StaticDefaultShoppingListDataProvider._internal();

  factory StaticDefaultShoppingListDataProvider() {
    return _instance;
  }

  StaticDefaultShoppingListDataProvider._internal();

  @override
  Future<List<Product>> getProductCatalog() async {
    List<Product> listToReturn = new List();
    var uuid = Uuid();
    listToReturn.add(new Product("Arroz",false,uuid.v1()));
    listToReturn.add(new Product("Pasta",false,uuid.v1()));
    listToReturn.add(new Product("Jabon de ropa",false,uuid.v1()));
    listToReturn.add(new Product("Pasta de dientes",false,uuid.v1()));
    listToReturn.add(new Product("Cafe",false,uuid.v1()));
    listToReturn.add(new Product("Papas",false,uuid.v1()));
    listToReturn.add(new Product("Aceite de oliva",false,uuid.v1()));
    listToReturn.add(new Product("Banana",false,uuid.v1()));
    listToReturn.add(new Product("Fresa",false,uuid.v1()));
    listToReturn.add(new Product("Tomate",false,uuid.v1()));
    listToReturn.add(new Product("Leche",false,uuid.v1()));
    listToReturn.add(new Product("Pañales",false,uuid.v1()));
    listToReturn.add(new Product("Jabon de Ainara",false,uuid.v1()));
    listToReturn.add(new Product("Atun",false,uuid.v1()));
    listToReturn.add(new Product("Diablito",false,uuid.v1()));
    listToReturn.add(new Product("Zanahorias",false,uuid.v1()));
    listToReturn.add(new Product("Cebolla",false,uuid.v1()));
    listToReturn.add(new Product("Juegos",false,uuid.v1()));
    listToReturn.add(new Product("Jamon",false,uuid.v1()));
    listToReturn.add(new Product("Queso crema",false,uuid.v1()));
    listToReturn.add(new Product("Pan de sanwich",false,uuid.v1()));
    listToReturn.add(new Product("Yogurt",false,uuid.v1()));
    listToReturn.add(new Product("Carne molida",false,uuid.v1()));
    listToReturn.add(new Product("Pollo",false,uuid.v1()));
    listToReturn.add(new Product("Bisteck",false,uuid.v1()));
    listToReturn.add(new Product("Shampo",false,uuid.v1()));
    listToReturn.add(new Product("Acondicionador",false,uuid.v1()));
    listToReturn.add(new Product("Jabon de bañarse",false,uuid.v1()));
    listToReturn.add(new Product("Pimenton",false,uuid.v1()));
    listToReturn.add(new Product("Harina de cachapa",false,uuid.v1()));
    listToReturn.add(new Product("Harina pan",false,uuid.v1()));
    listToReturn.add(new Product("Harina de trigo",false,uuid.v1()));
    listToReturn.add(new Product("Mantequilla de mani",false,uuid.v1()));
    listToReturn.add(new Product("Mantequilla",false,uuid.v1()));
    listToReturn.add(new Product("Cereal",false,uuid.v1()));
    listToReturn.add(new Product("Compota",false,uuid.v1()));
    listToReturn.add(new Product("Mandarina",false,uuid.v1()));
    listToReturn.add(new Product("Aguacate",false,uuid.v1()));
    listToReturn.add(new Product("Toallitas clorox",false,uuid.v1()));
    listToReturn.add(new Product("Desinfectante",false,uuid.v1()));
    return listToReturn;
  }

  @override
  Future<void> createNewProduct(String newItemName) {
    // TODO: implement createNewProduct
    return null;
  }

  @override
  Future<bool> deleteProduct(String id) {
    // TODO: implement deletePriduct
    return null;
  }

}
