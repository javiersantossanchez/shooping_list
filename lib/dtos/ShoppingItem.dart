class ShoppingItem  {

  final String description;

  bool _selected;

  ShoppingItem(String description):
    this.description = description,
    this._selected = false;

  bool get selected => _selected;

  void switchSelectedState(){
    this._selected = !this._selected;
  }
  
  
}