import 'package:flutter/material.dart';
import 'package:purchase_orderscreen/TGNPDCL/COMPLAINT/ht_metersupdate.dart';
import 'package:purchase_orderscreen/TGNPDCL/COMPLAINT/npdecl_employee.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: const Color.fromARGB(255, 248, 50, 39),
        title: Row(
          children: const [
            Text(
              'HOME PAGE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => NpdeclEmployee()));
            }, child: Text('login to npddcl page')),
            SizedBox(
              height: 10,
            ),
            // ElevatedButton(onPressed: (){
            //   Navigator.push(context, 
            //   MaterialPageRoute(builder: (context) => HtMetersupdate()));
            // }, child:Text('HT METERS PAGE') )
          ],
        ),
      ),

    );

  }
}