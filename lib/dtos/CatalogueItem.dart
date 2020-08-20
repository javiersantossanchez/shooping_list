class CatalogueItem  {

  final String description;

  bool _selected;

  CatalogueItem(String description, bool selected):
    this.description = description,
    this._selected = selected;

  bool get selected => _selected;

  void switchSelectedState(){
    this._selected = !this._selected;
  }
  
  
}