import 'package:flutter/material.dart';

class FrimDetails extends StatefulWidget {
  const FrimDetails({super.key});

  @override
  State<FrimDetails> createState() => _FrimDetailsState();
}

class _FrimDetailsState extends State<FrimDetails> {
  TextEditingController _suppliername=TextEditingController();
  TextEditingController _frimname=TextEditingController();
  TextEditingController _phone=TextEditingController();
  TextEditingController _sapvendor=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _license=TextEditingController();
  
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
          'Create Supplier',
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
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){},
                     child: Text('CREATE FIRM'),
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