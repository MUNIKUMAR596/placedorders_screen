import 'package:flutter/material.dart';


class UpdateFirmdetails extends StatefulWidget {
  const UpdateFirmdetails({super.key});

  @override
  State<UpdateFirmdetails> createState() => _UpdateFirmdetailsState();
  
}

class _UpdateFirmdetailsState extends State<UpdateFirmdetails> {   


  
    TextEditingController _suppliername=TextEditingController();
  TextEditingController _frimname=TextEditingController();
  TextEditingController _phone=TextEditingController();
  TextEditingController _sapvendor=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _license=TextEditingController();
  bool _isBlacklisted = false;

  
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
          'Update firm details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text('Enter Supplier Name',
                  style: TextStyle(fontSize: 15, 
                  color: const Color.fromARGB(255, 0, 0, 0),
                   fontWeight: FontWeight.bold
                  ),
                  ),
                   SizedBox(
                    height: 1,
                  ),
                  TextField(
                    controller: _suppliername,
                    decoration: InputDecoration(
                      iconColor: Colors.white,
                      
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Firm Name',
                  style: TextStyle(fontSize: 15, 
                  color: const Color.fromARGB(255, 0, 0, 0),
                   fontWeight: FontWeight.bold
                  ),
                  ),
                   SizedBox(
                    height: 1,
                  ),
                  TextField(
                    controller: _frimname,
                    decoration: InputDecoration(
                      iconColor: Colors.white,
                      
                    ),
                  ),
                   SizedBox(
                    height: 10,
                  ),
                  Text('Phone',
                  style: TextStyle(fontSize: 15, 
                  color: const Color.fromARGB(255, 0, 0, 0),
                   fontWeight: FontWeight.bold
                  ),
                  ),
                   SizedBox(
                    height: 1,
                  ),
                  TextField(
                    controller: _phone,
                    decoration: InputDecoration(
                      iconColor: Colors.white,
                      
                    ),
                  ),
                   SizedBox(
                    height: 10,
                  ),
                  Text('SAP Vendor No',
                  style: TextStyle(fontSize: 15, 
                  color: const Color.fromARGB(255, 0, 0, 0),
                   fontWeight: FontWeight.bold
                  ),
                  ),
                   SizedBox(
                    height: 1,
                  ),
                  TextField(
                    controller: _sapvendor,
                    decoration: InputDecoration(
                      iconColor: Colors.white,
                      
                    ),
                  ),
                   SizedBox(
                    height: 10,
                  ),
                  Text('Email Address (Optional)',
                  style: TextStyle(fontSize: 15, 
                  color: const Color.fromARGB(255, 0, 0, 0),
                   fontWeight: FontWeight.bold
                  ),
                  ),
                   SizedBox(
                    height: 1,
                  ),
                  TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      iconColor: Colors.white,
                      
                    ),
                  ),
                   SizedBox(
                    height: 10,
                  ),
                  Text('License No(Optional)',
                  style: TextStyle(fontSize: 15, 
                  color: const Color.fromARGB(255, 0, 0, 0),
                   fontWeight: FontWeight.bold
                  ),
                  ),
                   SizedBox(
                    height: 1,
                  ),
                  TextField(
                    controller: _license,
                    decoration: InputDecoration(
                      iconColor: Colors.white,
                      
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                 Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      'BLACK LIST SUPPLIER?',
      style: TextStyle(
        color: Colors.deepOrange,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
    Switch(
      value: _isBlacklisted,
      activeColor: Colors.deepOrange,
      onChanged: (value) {
        showDialog(
  context: context,
  builder: (context) => Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: Colors.amber,
          child: Center(
            child: Text(
             'BLACK LIST?',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
           ' You are about to blacklist this \n Firm(M/S LAXMI CEMENT PRODUCTS). \n when firm is blacklisted, Firm user \n cannot acess mobile app',
           style: TextStyle(
            color: Colors. grey,
            fontWeight: FontWeight.bold,
            fontSize: 15,
           ),
            textAlign: TextAlign.center,
          ),
        ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Row(
           children: [
             Expanded(
               child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder( // 👈 This makes it square
    borderRadius: BorderRadius.zero,
  ),
            
          ),
          child: const Text(
            'YES. BLACKLIST',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
               ),
             ),
             const SizedBox(width: 10), // spacing between buttons
             Expanded(
               child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder( // 👈 This makes it square
    borderRadius: BorderRadius.zero,
  ),
          ),
          child: const Text(
            'CANCEL',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
               ),
             ),
           ],
         ),
       ),

      ],
    ),
  ),
);

      },
    ),
  ],
),

                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){},
                     child: Text('SAVE'),
                     style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white
                     ),),
                  )
            ],
          ),
        ),
      ),
    );
  }
}