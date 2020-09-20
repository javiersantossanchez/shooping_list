import 'package:shoopinglist/dtos/ShoppingScheduler.dart';

abstract class IShoppingScheduleParse {

  List<ShoppingScheduler> parser (String text);

}
