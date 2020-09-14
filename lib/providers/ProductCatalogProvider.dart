import 'package:shoopinglist/dtos/Product.dart';


abstract class ProductCatalogProvider {

  Future<void> createNewProduct(String newItemName);

  Future<List<Product>> getProductCatalog() ;
}