class Product  {

  final String description;

  final String id;

  bool _selected;

  Product.Unselected(String description, String id):
    this.description = description,
    this._selected = false,
    this.id = id;

  Product(String description, bool selected, String id):
    this.description = description,
    this._selected = selected,
    this.id = id;

  bool get selected => _selected;

  void switchSelectedState(){
    this._selected = !this._selected;
  }
  
  
}