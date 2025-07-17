import 'package:flutter/material.dart';

class PurchaseOrderscreen extends StatefulWidget {
  const PurchaseOrderscreen({super.key});

  @override
  State<PurchaseOrderscreen> createState() => _PurchaseOrderscreenState();
}

class _PurchaseOrderscreenState extends State<PurchaseOrderscreen> {

  TextEditingController _sapno=TextEditingController();
  TextEditingController _poles=TextEditingController();
  TextEditingController _alredysupplied=TextEditingController();
  TextEditingController _podescrption=TextEditingController();
  TextEditingController _remarks=TextEditingController();

  String? selectedyear="2025-2026";
  String? supplierfirm ='M/S LAXMI CEMENT PRODUCTS';
  String? selct='Select';
  String? type='select';
  final List<String> years=[ "2025-2026","2024-2024","2023-2024","2022-2023","2021-2022","2020-2021","2019-2020"];
  final List<String> Supplier=['M/S LAXMI CEMENT PRODUCTS','M/S SAI INDUSTRIES','TEST FIRM'];
  final List<String> states=['Select','Khammam','Warangal','Karimnagar'];
  final List<String> poles=['select','8m/140','9.10m/280','11.0m/365'];
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: const Color.fromARGB(255, 7, 207, 171),
        title: const Text(
          'create Purchase Order',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Financial Year',
              style: TextStyle(fontSize: 15,
              color: const Color.fromARGB(255, 0, 0, 0), 
              fontWeight: FontWeight.bold),),
              SizedBox(
                height: 1,
              ),
          
              Container(
                  width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                   icon: Icon(Icons.arrow_drop_down),
                   value: selectedyear,
                     underline: const SizedBox(),
                  items:  years.map((String year) {
                  return DropdownMenuItem<String>(
                    
                    value: year,
                    child: Text(year),
                  );
                }).toList(),
                 onChanged:  (String? newValue) {
                  setState(() {
                    selectedyear = newValue!;
                  });
                },),
                
              ),
              SizedBox(
                height: 2,
              ),
               Text('Select Supplier Firm',
              style: TextStyle(fontSize: 15, 
              color: const Color.fromARGB(255, 0, 0, 0),
               fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(
                height: 1,
              ),
             Container(
  width: double.infinity,
  padding: const EdgeInsets.symmetric(horizontal: 12),
  child: Row(
    children: [
      Expanded(
        child: DropdownButton<String>(
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down),
          value: supplierfirm,
          underline: const SizedBox(),
          items: Supplier.map((String firms) {
            return DropdownMenuItem<String>(
              value: firms,
              child: Text(firms),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              supplierfirm = newValue!;
            });
          },
        ),
      ),
      Container(
        width: 40,
  height: 40,
  decoration: BoxDecoration(
    border: Border.all(color: const Color.fromARGB(255, 114, 112, 112),),
    borderRadius: BorderRadius.circular(6),
    color: const Color.fromARGB(56, 104, 102, 102),
    ),
        child: IconButton(
          icon: const Icon(Icons.search_rounded,
          color: Color.fromARGB(255, 30, 30, 30),),
          onPressed: () {
            // Optional: Add your search logic here
            print('Searching for $supplierfirm');
          },
        ),
      )
    ],
  ),
),

               SizedBox(
                height: 2,
              ),
               Text('Select Circle',
              style: TextStyle(fontSize: 15, 
              color: const Color.fromARGB(255, 0, 0, 0),
               fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                  width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                   icon: Icon(Icons.arrow_drop_down),
                   value: selct,
                     underline: const SizedBox(),
                  items:  states.map((String city) {
                  return DropdownMenuItem<String>(
                    
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                 onChanged:  (String? newValue) {
                  setState(() {
                    selct = newValue!;
                  });
                },),
                
              ),
              SizedBox(
                height: 2,
              ),
               Text('SAP PO NUM',
              style: TextStyle(fontSize: 15, 
              color: const Color.fromARGB(255, 0, 0, 0),
               fontWeight: FontWeight.bold
              ),
              ),
               SizedBox(
                height: 1,
              ),
              TextField(
                controller: _sapno,
                decoration: InputDecoration(
                  iconColor: Colors.white,
                  
                ),
              ),
              SizedBox(
                height: 10,
              ),
               Text('Poles Qty In P.O',
              style: TextStyle(fontSize: 15, 
              color: const Color.fromARGB(255, 0, 0, 0),
               fontWeight: FontWeight.bold
              ),
              ),
               SizedBox(
                height: 1,
              ),
              TextField(
                controller: _poles,
                decoration: InputDecoration(
                  iconColor: Colors.white,
                  
                ),
              ),
              SizedBox(
                height: 10,
              ),
               Text('Alredy Supplied Qty(if any)',
              style: TextStyle(fontSize: 15, 
              color: const Color.fromARGB(255, 0, 0, 0),
               fontWeight: FontWeight.bold
              ),
              ),
               SizedBox(
                height: 1,
              ),
              TextField(
                controller: _alredysupplied,
                decoration: InputDecoration(
                  iconColor: Colors.white,
                  
                ),
              ),
               SizedBox(
                height: 10,
              ),
               Row(
                 children: [
                   Text('Balance Qty',
                                 style: TextStyle(
                                  fontSize: 15, 
                                 color: const Color.fromARGB(255, 0, 0, 0),
                   fontWeight: FontWeight.bold
                                 ),
                                 ),
                                 SizedBox(
                                  width: 290,
                                 ),
                                 Text('0',
                                 style: TextStyle(
                                  color: Colors.red,
                                   fontSize: 20,
                                   fontWeight: FontWeight.bold 
                                 ),)
                 ],
               ),
              SizedBox(
                height: 10,
              ),
               Text('Poles Type',
              style: TextStyle(fontSize: 15, 
              color: const Color.fromARGB(255, 0, 0, 0),
               fontWeight: FontWeight.bold
              ),
              ),
               SizedBox(
                height: 1,
              ),
          
              Container(
                  width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                   icon: Icon(Icons.arrow_drop_down),
                   value: type,
                     underline: const SizedBox(),
                  items:  poles.map((String data) {
                  return DropdownMenuItem<String>(
                    
                    value: data,
                    child: Text(data),
                  );
                }).toList(),
                 onChanged:  (String? newValue) {
                  setState(() {
                    type = newValue!;
                  });
                },),
                
              ),
              SizedBox(
                height: 2,
              ),
               Text('PO Description',
              style: TextStyle(fontSize: 15, 
              color: const Color.fromARGB(255, 0, 0, 0),
               fontWeight: FontWeight.bold
              ),
              ),
               SizedBox(
                height: 20,
              ),
              TextField(
                controller: _podescrption,
                decoration: InputDecoration(
                  iconColor: Colors.white,
                  
                ),
              ),
              SizedBox(
                height: 5,
              ),
               Text('Remarks',
              style: TextStyle(fontSize: 15, 
              color: const Color.fromARGB(255, 0, 0, 0),
               fontWeight: FontWeight.bold
              ),
              ),
               SizedBox(
                height: 20,
              ),
              TextField(
                controller: _remarks,
                decoration: InputDecoration(
                  iconColor: Colors.white,
                  
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
               // height: 10,
                width: double.infinity,
                child:  ElevatedButton(
    onPressed: () {
      
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,      // Blue background
      foregroundColor: Colors.white,     // White text
      padding: const EdgeInsets.symmetric(vertical: 10), // Vertical padding
    ),
    child: const Text(
      'CREATE PO',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
              ),
              ],
          ),
        ),
      ),
    );

  }
}