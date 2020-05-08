
import 'ShoppingItem.dart';

class ShoppingScheduleItem  {

  final int id;

   final DateTime shoppingDate;

   final List<ShoppingItem> shoppingList;


  ShoppingScheduleItem._builder( ShoppingScheduleItemBuilder builder):
    this.id = builder.id,
    this.shoppingDate = builder.date,
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

  List<ShoppingItem> shoppingList;

  int get id => _id;

  DateTime get date => _date;

 ShoppingScheduleItemBuilder(this._id, this._date);

  ShoppingScheduleItem build(){
      return new ShoppingScheduleItem._builder(this);
  }


}
