import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoopinglist/dtos/Product.dart';
import 'package:shoopinglist/services/ShoppingListService.dart';

class ProductCatalogManagementScreen extends StatefulWidget {
  @override
  ProductCatalogManagementScreenState createState() =>
      ProductCatalogManagementScreenState();
}

class ProductCatalogManagementScreenState
    extends State<ProductCatalogManagementScreen> {

  final ShoppingListService _service = ShoppingListService();


  Future<List<Product>> _futureOfItems;


  // of the TextField.
  final myController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    ShoppingListService service = ShoppingListService();
    _futureOfItems = service.getDefaultShoppingList();
  }

  Widget _buildListingView(List<Product> productLst) {
    //TODO: Verify, is this validation necessary now??  The FutureBuilder is used to build the widget
    if (productLst == null) {
      // This is what we show while we're loading
      return new Container();
    }
    Divider div = new Divider(
      color: Colors.blue,
    );
    return new Expanded(
        child: ListView.separated(
            separatorBuilder: (context, index) => div,
            padding: const EdgeInsets.all(16.0),
            itemCount: productLst.length,
            itemBuilder: (context, index) =>
                _buildRow(productLst[index], context)));
  }

  // #docregion _buildRow
  Widget _buildRow(Product pair, BuildContext context) {
    return ListTile(
      title: Text(
        pair.description == null ? '' : pair.description,
      ),
      trailing: Icon(
        pair.selected ? Icons.check_circle : Icons.radio_button_unchecked,
        color: Colors.blue,
        size: 30,
      ),
      onTap: () {},
    );
  }

  Widget _buildBody() {
    return Column(children: <Widget>[
      FutureBuilder<List<Product>>(
          future: _futureOfItems,
          builder:
              (BuildContext context, AsyncSnapshot<List<Product>> productList) {
            if (productList.hasData) {
              return _buildListingView(productList.data);
            } else {
              return _buildSplash();
            } // end else
          }),
    ]);
  }

  Widget _buildSplash() {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            ),
            Center(
              child: Text('Loading Products...'),
            )
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTime Picker'),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => this.onClickAddButton(context),
      ),
    );
  }


  void onClickAddButton(BuildContext context) {
    print('The user click on delete icon');
    showDialogToCreateNewProduct(context);
  }

  Widget  _buildDialogBody(){

  }

  void showDialogToCreateNewProduct(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
          return SimpleDialog(
          title: const Text('Create a new item'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: SizedBox(width: 100,
            child: TextField(
              autofocus: true,
              controller: myController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Type the new item\'s name',
              ),
            ),
            ),
          ),
            Row(
            children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                _service.createNewItemOnShoppingList(myController.text);
                myController.clear();
                Navigator.pop(context, true);
              },
              child: Text(
                "Save",
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                myController.clear();
                Navigator.pop(context, true);
              },
              child: Text(
                "Close",
              ),
            ),
            ])
          ],
        );
      },
    );
  }
}
