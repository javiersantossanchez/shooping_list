import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoopinglist/ui/ProductCatalogManagementScreen.dart';

import 'ShoppingScheduleFormScreen.dart';
import 'ShoppingSchedulerListingWidget.dart';


enum AdminOptions { Product_CATALOG_MANAGEMENT, }

class ShoppingSchedulerCatalogScreen extends StatefulWidget {
  @override
  ShoppingSchedulerCatalogScreenState createState() => ShoppingSchedulerCatalogScreenState();
}

class ShoppingSchedulerCatalogScreenState extends State<ShoppingSchedulerCatalogScreen> {
    AdminOptions _adminSelection;


  Widget getAdminMenu(BuildContext context){
     return
       PopupMenuButton<AdminOptions>(
         onSelected: (AdminOptions result) {
           onClickGoToManagementProductCatalog(context);

         },
         itemBuilder: (BuildContext context) => <PopupMenuEntry<AdminOptions>>[
           const PopupMenuItem<AdminOptions>(
             value: AdminOptions.Product_CATALOG_MANAGEMENT,
             child: Text('Product Catalog Management'),
           ),
         ],
       );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping list catalog'),
        actions: <Widget>[
          getAdminMenu(context),
        ],

      ),
      body: ShoppingSchedulerListingWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => this.onClickAddButton(context),
      ),
    );
  }


  void onClickGoToManagementProductCatalog(BuildContext context) {
    print('The user click on to go management button');
    ProductCatalogManagementScreen widget = new ProductCatalogManagementScreen();
    MaterialPageRoute router = new MaterialPageRoute(builder: (ctxt) => widget);
    Navigator.push(context, router);
  }

  void onClickAddButton(BuildContext context) {
    print('The user click on add button');
    ShoppingScheduleFormScreen widget = new ShoppingScheduleFormScreen();
    MaterialPageRoute router = new MaterialPageRoute(builder: (ctxt) => widget);
    Navigator.push(context, router);
  }
}
