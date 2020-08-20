
import 'CatalogueItem.dart';

class PurchaseList  {

  final int id;

   final DateTime shoppingDate;

   final List<CatalogueItem> shoppingList;


  PurchaseList._builder( ShoppingScheduleItemBuilder builder):
    this.id = builder.id,
    this.shoppingDate = builder.date, //TODO: IN a future is good practice validate a not null for this parameter
    this.shoppingList = builder.shoppingList
  ;

  Map<String, dynamic> toJson() =>
      {
        'shoppingDate': shoppingDate.toIso8601String(),
        'id': this.id,
        'shoppingList':this.shoppingList.map((item) => {"description": item.description, "ready": item.selected}).toList()
      };

}

class ShoppingScheduleItemBuilder{
  int _id;

  DateTime _date;

  List<CatalogueItem> shoppingList;

  int get id => _id;

  DateTime get date => _date;

 ShoppingScheduleItemBuilder(this._id, this._date);

  PurchaseList build(){
      return new PurchaseList._builder(this);
  }


}