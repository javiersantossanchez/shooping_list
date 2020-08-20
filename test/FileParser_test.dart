import 'package:flutter_test/flutter_test.dart';
import 'package:shoopinglist/dtos/PurchaseList.dart';
import 'package:shoopinglist/parsers/FileParser.dart';

void main() {
  test('Parser the text in the right way', () {
      FileParser parser = new FileParser();

      String text = '[{'
          '"shoppingDate": "2020-04-15T18:40:41.910651",'
          '"id": 1,'
          '"shoppingList": [{"description": "Item 1","ready": false},{"description": "Item 2","ready": false}]'
          '}]';

      List<PurchaseList> result = parser.parser(text);
      bool allValid = true;
      allValid &= result.length == 1;
      allValid &= result.first.id == 1;
      allValid &= result.first.shoppingDate.toIso8601String() == "2020-04-15T18:40:41.910651";
      allValid &=  result.first.shoppingList.length == 2;

      expect(allValid, true);

  });

  test('Parser the text without shoppingList property', () {
      FileParser parser = new FileParser();
      String text = '[{'
          '"shoppingDate": "2020-04-15T18:40:41.910651",'
          '"id": 1'
          '}]';

      List<PurchaseList> result = parser.parser(text);
      expect(result, null);

  });

  test('Parser the text without shoppingDate property', () {
      FileParser parser = new FileParser();

      String text = '[{'
          '"id": 1,'
          '"shoppingList": [{"description": "Item 1","ready": false},{"description": "Item 2","ready": false}]'
          '}]';

      List<PurchaseList> result = parser.parser(text);
      expect(result, null);

  });

  test('Parser the text with invalid format on shoppingDate property', () {
      FileParser parser = new FileParser();

      String text = '[{'
          '"shoppingDate": "2020-0",'
          '"id": 1,'
          '"shoppingList": [{"description": "Item 1","ready": false},{"description": "Item 2","ready": false}]'
          '}]';

      List<PurchaseList> result = parser.parser(text);
      expect(result, null);

  });

  test('Parser the text with invalid format', () {
      FileParser parser = new FileParser();

      String text = '[{'
          '"shoppingDate": "2020-0",'
          '"id": 1,'
          '"shoppingList": ['
          '}]';

      List<PurchaseList> result = parser.parser(text);
      expect(result, null);

  });

  test('Parser with a empty string', () {
      FileParser parser = new FileParser();
      String text = '';
      List<PurchaseList> result = parser.parser(text);
      expect(result, null);
  });

  test('Parser with null as parameter', () {
      FileParser parser = new FileParser();
      String text;
      List<PurchaseList> result = parser.parser(text);
      expect(result, null);
  });

}