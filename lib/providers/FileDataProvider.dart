import 'package:path_provider/path_provider.dart';
import 'package:shoopinglist/dtos/ShoppingListItem.dart';
import 'dart:io';
import 'dart:convert';

import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart'; //to convert json to maps and vice versa

class FileDataProvider {
  static final FileDataProvider _instance = new FileDataProvider._internal();

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
    return File('$path/counter.txt');
  }

  Future<List<ShoppingScheduleItem>> getScheduler() async {
    final file = await _localFile;
    // Write the file
    Map<String, Object> content = {
      "data": [
        {
          "shoppingDate": "20120227",
          "id":1,
          "shoppingList": [
            {"description": "Arroz", "ready": false},
            {"description": "Pasta", "ready": true}
          ]
        },
        {
          "shoppingDate": "20120224",
          "id":2,
          "shoppingList": [
            {"description": "Queso", "ready": false},
            {"description": "Atun", "ready": true}
          ]
        }
      ]
    };
    file.writeAsStringSync(json.encode(content));
    String contents = await file.readAsString();
    Map<String, Object> jsonFileContent = json.decode(contents);
    List<dynamic> ddd =  jsonFileContent["data"];
    List<ShoppingScheduleItem>  list = ddd.map((item) => ShoppingScheduleItem(item["id"], DateTime.parse(item["shoppingDate"])) ).toList();
    return list;
  }

  Future<List<ShoppingListItem>> getScheduler1111(int id) async {
      final file = await _localFile;
      // Read the file
      String contents = await file.readAsString();

      Map<String, Object> jsonFileContent = json.decode(contents);
      List<dynamic> ddd =  jsonFileContent["data"];
      dynamic v =  ddd.firstWhere((item) => item["id"] == id);
      List<dynamic> sssd = v["shoppingList"];
      List<ShoppingListItem> result = sssd.map((item) => ShoppingListItem(item["description"])).toList();
      // Returning the contents of the file
      return result;
  }
}
