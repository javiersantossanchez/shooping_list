import 'package:path_provider/path_provider.dart';
import 'package:shoopinglist/dtos/Product.dart';
import 'dart:io';
import 'dart:convert';

import 'package:shoopinglist/dtos/ShoppingScheduler.dart';
import 'package:shoopinglist/parsers/FileParser.dart'; //to convert json to maps and vice versa

abstract class ProductCatalogProvider {

  Future<void> createNewProduct(String newItemName);

  Future<List<Product>> getProductCatalog() ;
}