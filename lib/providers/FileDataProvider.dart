import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert'; //to convert json to maps and vice versa

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

  void writeContent() async {
    final file = await _localFile;
    // Write the file
    Map<String, Object> content = {
      "data": [
        {
          "shoppingDate": "10-12-2020",
          "id":1,
          "shoppingList": [
            {"description": "Arroz", "ready": false},
            {"description": "Pasta", "ready": true}
          ]
        },
        {
          "shoppingDate": "10-20-2020",
          "id":2,
          "shoppingList": [
            {"description": "Queso", "ready": false},
            {"description": "Atun", "ready": true}
          ]
        }
      ]
    };
    file.writeAsStringSync(json.encode(content));
    String contents = file.readAsStringSync();
    Map<String, Object> jsonFileContent = json.decode(contents);
    List<dynamic> ddd =  jsonFileContent["data"];
    print(ddd);
    var v =  ddd.firstWhere((item) => item["id"] == 1);
    print(v);
    print(content);
  }

  Future<String> getScheduler() async {
    try {
      print("sssssss");
      final file = await _localFile;
      // Read the file
      String contents = file.readAsStringSync();

      Map<String, Object> jsonFileContent = json.decode(contents);
      List<Map<String, Object>> ddd =  jsonFileContent["data"];
      print(ddd);
      var v =  ddd.firstWhere((item) => item["id"] == 1);
      print(v);
      // Returning the contents of the file
      return contents;
    } catch (e) {
      // If encountering an error, return
      return 'Error!';
    }
  }
}
