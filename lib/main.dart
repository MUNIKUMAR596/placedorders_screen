import 'package:flutter/material.dart';
import 'package:purchase_orderscreen/LOADCHANGE/load_changerequest.dart';
import 'package:purchase_orderscreen/LTMT/LTMT_menu.dart';
import 'package:purchase_orderscreen/Meseva_Alertdialouge/list_dialougescreen.dart';
import 'package:purchase_orderscreen/purchase_scre.dart/create_purchase_order.dart';
import 'package:purchase_orderscreen/purchase_scre.dart/purchase_orders.dart';
import 'package:purchase_orderscreen/view_po_screen.dart/purchase_orders.dart';
import 'package:purchase_orderscreen/view_suppliers/pole_suppliers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'purchasse order screen',
      
     
      home: ListDialougescreen()
      //LoadChangerequest()
     // LtmtMenu()
      //PoleSuppliers()
     // AutoDialogScreen()
      // PurchaseOrders()
      //  PurchaseOrderscreen()
    );
  }
}


