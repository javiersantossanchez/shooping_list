import 'package:path_provider/path_provider.dart';
import 'package:shoopinglist/dtos/ShoppingListItem.dart';
import 'dart:io';
import 'dart:convert';

import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';
import 'package:shoopinglist/providers/FileParser.dart'; //to convert json to maps and vice versa

class FileDataProvider {
  static final FileDataProvider _instance = new FileDataProvider._internal();

  final String _fileName ="shopping_list.txt";

  List<ShoppingScheduleItem> _info = new List();

  factory FileDataProvider() {
    return _instance;
  }

  FileDataProvider._internal();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
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
      FileParser parser = new FileParser();
      List<ShoppingScheduleItem> itemsFromFile = parser.parser(contents);
      if(itemsFromFile != null) {
        _info.addAll(itemsFromFile);
      }
    }
    return _info;
  }

  Future<List<ShoppingListItem>> getShoppingList(int id) async {
    ShoppingScheduleItem v = _info.firstWhere((item) => item.id == id);

    return v.shoppingList;
  }

  Future<void> createNewShoppingList(
      ShoppingScheduleItem newShoppingList) async {
    newShoppingList.id = _info.length + 1;
    this._info.add(newShoppingList);

    final file = await _localFile;
    file.writeAsStringSync(json.encode(this._info));
  }
}
