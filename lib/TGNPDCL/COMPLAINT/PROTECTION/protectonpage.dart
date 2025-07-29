import 'package:flutter/material.dart';
import 'package:purchase_orderscreen/TGNPDCL/COMPLAINT/PROTECTION/LVbreaker_prtpage.dart';
import 'package:purchase_orderscreen/TGNPDCL/COMPLAINT/PROTECTION/acsupplyfailue_workprotection_details.dart';

class Protectonpage extends StatefulWidget {
  const Protectonpage({super.key});

  @override
  State<Protectonpage> createState() => _ProtectonpageState();
}

class _ProtectonpageState extends State<Protectonpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
  onPressed: () {
    Navigator.pop(context); 
  },
  icon: const Icon(
    Icons.arrow_back,
    color: Colors.white,
    size: 30,
  ),
),

        backgroundColor: const Color.fromARGB(255, 248, 50, 39),
        title: Row(
          children: const [
            Text(
              'Protection',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 28),
            Text(
              "JUL 2025",
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
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
           Card(
  child: Stack(
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 40.0), // leave space for the icon
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '#PRT20250723002622(23/07/202025)',
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            buildprotection('NATURE OF WORK', 'Complaint'),
            Divider(),
            buildprotection('NATURE OF COMPLAINT', 'BATTERY'),
            Divider(),
            buildprotection('SS', 'KV SS-BAL '),
            Divider(),
            buildprotection('BREAKER', 'LV BREAKER'),
            Divider(),
            buildprotection('SECTION', 'CHOWRASTHA'),
              Divider(),
          ],
        ),
      ),
      // 🔽 Right Center IconButton
      Positioned(
       
        right: 1,
        top: 0,
        bottom: 0,
        child: Center(
          child: IconButton(
            icon: Icon(Icons.navigate_next, color: Colors.black, size: 20),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LvbreakerPrtpage()),
              );
            },
          ),
        ),
      ),
    ],
  ),
),   
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        shape: const CircleBorder(),
        
        onPressed: () {
         {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WorkprotectionDetails()));
                }
        },
      child:  Icon(
  Icons.electric_meter,
  color: Colors.white,
  size: 30,
)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
  Widget buildprotection(String label,data){
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(label,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          height: 20,
          width: 1,
          color: Colors.grey,
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 1,
          child: Align(
                      alignment: Alignment.centerRight,

            child: Text(data))
          ),
      ]
    );
  }
}