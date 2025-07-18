import 'package:flutter/material.dart';
import 'package:purchase_orderscreen/view_suppliers/update_firmdetails.dart';
//import '../view_suppliers.dart/view_suppliers/update_firmdetails.dart';
//import 'package:purchase_orderscreen/view_suppliers/update_firmdetails.dart';



class PoleSuppliers extends StatefulWidget {
  const PoleSuppliers({super.key});

  @override
  State<PoleSuppliers> createState() => _PoleSuppliersState();
}

class _PoleSuppliersState extends State<PoleSuppliers> {
  TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: const Color.fromARGB(255, 28, 162, 137),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Pole Suppliers',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Showing 7 Firm(s)',
              style: TextStyle(
                color: Color.fromARGB(255, 249, 243, 243),
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all( 5), // ✅ FIXED
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.search),
                const SizedBox(width: 2),
                Expanded(
                  child: TextField(
                    controller: _search,
                    decoration: const InputDecoration(
                      hintText: 'Search firms...',
                    ),
                  ),
                ),
              ],
            ),
           SizedBox(
            height: 10,
           ),
           Column(
            mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Text('M/S LAXMI CEMENT PRODUCTS',
               style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15
               ),),
             ],
           ),
           SizedBox(
             height: 8,
           ),
           Text('Laxma reddy',
           style: TextStyle(
            color: Colors.grey,
            fontSize: 20
           ),),
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: 
                (context) => UpdateFirmdetails()));
              },
               icon: Icon(Icons.arrow_forward_ios,
               size: 13,)),
            ],
           ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  SizedBox(height: 1), // spacing between texts
                  Text(
                    '9396458215',
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 16,
                      decoration: TextDecoration.none, // remove Flutter's default underline
                    ),
                  ),
                  Container(
                  height: 2, // thickness of the underline
                    width: 100, // adjust to match text width or use double.infinity
                    color: Colors.pinkAccent,
                  ),
                ],
              ),
              SizedBox(
                width: 150,
              ),
              Text('ACTIVE',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),)
            ],
          ) 
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
   shape:CircleBorder() ,
    onPressed: () {
      // Action when button is pressed
    },
    child: Icon(Icons.add,
    color: Colors.lightGreen,
    size: 20,),
    backgroundColor: Colors.pink,
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
