import 'package:path_provider/path_provider.dart';
import 'package:shoopinglist/dtos/ShoppingItem.dart';
import 'dart:io';
import 'dart:convert';

import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';
import 'package:shoopinglist/parsers/FileParser.dart';
import 'package:shoopinglist/parsers/IShoppingScheduleParse.dart';

import 'IDataProvider.dart';

import 'package:http/http.dart' as http;


class FileDataProvider implements IDataProvider{

  static final FileDataProvider _instance = new FileDataProvider._internal();

  final String _fileName ="shopping_list.txt";

  final IShoppingScheduleParse _parser =  new FileParser();

  List<ShoppingScheduleItem> _info = new List();

  factory FileDataProvider() {
    return _instance;
  }

  FileDataProvider._internal();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_fileName');
  }



  Future<List<ShoppingScheduleItem>> getScheduler() async {
    final file = await _localFile;

    if (_info == null || _info.isEmpty) {
      if( !file.existsSync() ){
        file.createSync();
      }
      String contents = await file.readAsString();
      List<ShoppingScheduleItem> itemsFromFile = _parser.parser(contents);
      if(itemsFromFile != null) {
        _info.addAll(itemsFromFile);
      }
    }



    return _info;
  }

  Future<List<ShoppingItem>> getShoppingList(int id) async {
    ShoppingScheduleItem v = _info.firstWhere((item) => item.id == id);

    return v.shoppingList;
  }

  Future<void> createNewShoppingList(
      ShoppingScheduleItem newShoppingList) async {
    this._info.add(newShoppingList);
    this.updateShoppingList();
  }

  Future<void> deleteShoppingList(ShoppingScheduleItem shoppingListToDelete) async{
    this._info.remove(shoppingListToDelete);
    this.updateShoppingList();
  }

  Future<void> updateShoppingList() async{
    final file = await _localFile;
    //TODO: I need move this json.encode statement to parse class
    file.writeAsStringSync(json.encode(this._info));
  }
}
