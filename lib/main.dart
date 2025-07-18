import 'package:flutter/material.dart';
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
      
     
      home:
      PoleSuppliers()
     // AutoDialogScreen()
      // PurchaseOrders()
      //  PurchaseOrderscreen()
    );
  }
}


