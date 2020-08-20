import 'package:shoopinglist/dtos/PurchaseList.dart';

abstract class IShoppingScheduleParse {

  List<PurchaseList> parser (String text);

}
