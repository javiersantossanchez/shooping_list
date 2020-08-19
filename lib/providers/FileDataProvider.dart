import 'package:path_provider/path_provider.dart';
import 'package:shoopinglist/dtos/ShoppingItem.dart';
import 'dart:io';
import 'dart:convert';

import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';
import 'package:shoopinglist/parsers/FileParser.dart';
import 'package:shoopinglist/parsers/IShoppingScheduleParse.dart';

import 'IDataProvider.dart';

class FileDataProvider extends IDataProvider{

  static final FileDataProvider _instance = new FileDataProvider._internal();

  final String _fileName ="shopping_list.txt";

  final IShoppingScheduleParse _parser =  new FileParser();


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

    if (info == null || info.isEmpty) {
      if( !file.existsSync() ){
        file.createSync();
      }
      String contents = await file.readAsString();
      List<ShoppingScheduleItem> itemsFromFile = _parser.parser(contents);
      if(itemsFromFile != null) {
        info.addAll(itemsFromFile);
      }
    }
    return info;
  }



  Future<void> updateShoppingList() async{
    final file = await _localFile;
    //TODO: I need move this json.encode statement to parse class
    file.writeAsStringSync(json.encode(this.info));
  }
}
