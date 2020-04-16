import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shoopinglist/dtos/ShoppingListItem.dart';
import 'dart:io';
import 'dart:convert';

import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart'; //to convert json to maps and vice versa

class FileDataProvider {
  static final FileDataProvider _instance = new FileDataProvider._internal();

  List<ShoppingScheduleItem>  _info;

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

    if(_info == null) {
        this.update();

      //file.writeAsStringSync(json.encode(content));
      String contents = await file.readAsString();

      List<dynamic> jsonFileContent = json.decode(contents);

      _info = jsonFileContent.map((item) {

        List<dynamic> sssd = item["shoppingList"];
        List<ShoppingListItem> result = sssd.map((item) => ShoppingListItem(item["description"])).toList();
        // Returning the contents of the file

        return ShoppingScheduleItem(item["id"],
              DateTime.parse(item["shoppingDate"]),
            result
          );
          }
      ).toList();
    }
      return _info;
    }

    Future<List<ShoppingListItem>> getScheduler1111(int id) async {

      ShoppingScheduleItem v =  _info.firstWhere((item) => item.id == id);

      return v.shoppingList;
    }

  Future<void> updateddd(ShoppingScheduleItem va) async{
    ShoppingListItem litsItem = new ShoppingListItem("prueba");
    List<ShoppingListItem> list = new List();
    list.add(litsItem);
    va.shoppingList.add(litsItem);
    va.id = _info.length +1;
    this._info.add( va);

    final file = await _localFile;
    file.writeAsStringSync(json.encode(this._info));
  }

    void update() async{
      ShoppingListItem litsItem = new ShoppingListItem("prueba");
      List<ShoppingListItem> list = new List();
      list.add(litsItem);
      this._info = new List();
      this._info.add( new ShoppingScheduleItem(4, DateTime.now(), list));

       final file = await _localFile;
       bool c = await file.exists();
       if( !c) {
         file.writeAsStringSync(json.encode(this._info));
       }
    }


}
