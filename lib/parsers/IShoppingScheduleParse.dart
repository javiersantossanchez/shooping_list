import 'package:shoopinglist/dtos/ShoppingScheduleItem.dart';

abstract class IShoppingScheduleParse {

  List<ShoppingScheduleItem> parser (String text);

}
