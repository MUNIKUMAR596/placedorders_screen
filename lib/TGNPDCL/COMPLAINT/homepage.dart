import 'package:flutter/material.dart';
import 'package:purchase_orderscreen/TGNPDCL/COMPLAINT/HTMETERS/ht_metersupdate.dart';
import 'package:purchase_orderscreen/TGNPDCL/COMPLAINT/HTMETERS/npdecl_employee.dart';
import 'package:purchase_orderscreen/TGNPDCL/COMPLAINT/PROTECTION/protectonpage.dart';
import 'package:purchase_orderscreen/TGNPDCL/COMPLAINT/htmeters_htconv_tosolar.dart';

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
              'TGNPDCL COMPLAINTS',
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
            }, child: Text('HT Meters')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => Protectonpage()));
            }, child:Text('protection PAGE') ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => HtmetersHtconvTosolar()));
            }, child:Text('HT_CONV_HT_TO_SOLAR ') )
          ],
        ),
      ),

    );

  }
}