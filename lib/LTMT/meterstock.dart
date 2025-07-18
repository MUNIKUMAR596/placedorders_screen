import 'package:flutter/material.dart';

class Meterstock extends StatefulWidget {
  const Meterstock({super.key});

  @override
  State<Meterstock> createState() => _MeterstockState();
}

class _MeterstockState extends State<Meterstock> {
  TextEditingController _search =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: const Color.fromARGB(255, 16, 178, 148),
        title: const Text(
          'Meters Stock',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('74961169'),
            Text('HPL  3PH,3.ph,10-40A'),
            SizedBox(
              height: 3,
            ),
            Row( 
             mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('23/12/2022')
              ]
            ),
            Divider(thickness: 1,),
            SizedBox(
              height: 4,
            ),
            Text('74961169'),
            Text('HPL  3PH,3.ph,10-40A'),
            SizedBox(
              height: 3,
            ),
            Row( 
             mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('23/12/2022')
              ],
            ),
             Divider(thickness: 1,),
            SizedBox(
              height: 4,
            ),
            Text('74961169'),
            Text('HPL  3PH,3.ph,10-40A'),
            SizedBox(
              height: 3,
            ),
            Row( 
             mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('23/12/2022')
              ],
            ),

          ],
        ),
        
      ),
       floatingActionButton: FloatingActionButton(
   shape:CircleBorder() ,
    onPressed: () {
      showDialog(context: context,
       builder: (context) {
        return Dialog( shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10)
        ),
        
          child:  SizedBox(
            width: MediaQuery.of(context).size.width *0.9,
              height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(14),
                  color:const Color.fromARGB(14, 73, 55, 55),
                  child: Row(
                    
                    children: [ SizedBox(
                      width: 20,
                    ),
                      const Icon(Icons.search,
                      color: Colors.white,),
                      SizedBox(width: 5),
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
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text('7496169 | HPL 3PH'),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text('7496169 | GENUS'),
                )            
              ],
            ),
          ),
          
        
        );
       });
    },
    child: Icon(Icons.search,
    color: Colors.white,
    size: 20,),
    backgroundColor: Colors.pink,
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}