
import 'Product.dart';

class ShoppingScheduler  {

  final int id;

   final DateTime shoppingDate;

   final List<Product> shoppingList;


  ShoppingScheduler._builder( ShoppingScheduleItemBuilder builder):
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

  List<Product> shoppingList;

  int get id => _id;

  DateTime get date => _date;

 ShoppingScheduleItemBuilder(this._id, this._date);

  ShoppingScheduler build(){
      return new ShoppingScheduler._builder(this);
  }


}
