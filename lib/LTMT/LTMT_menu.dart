import 'package:flutter/material.dart';
import 'package:purchase_orderscreen/main.dart';
import 'package:purchase_orderscreen/LTMT/meterstock.dart';
void main() {
  runApp(const MyApp());
}
class LtmtMenu extends StatefulWidget {
  const LtmtMenu({super.key});
  
  @override
  State<LtmtMenu> createState() => _LtmtMenuState();
}

class _LtmtMenuState extends State<LtmtMenu> { 
  bool _isloading = false;
  void _tap() async{
    setState(()  {
      _isloading=true;
    });
   await Future.delayed(const Duration(seconds: 2));
   setState(() {
     _isloading=false;
     Navigator.push(context, 
     MaterialPageRoute(builder: (context) => Meterstock()));
   });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: const Color.fromARGB(255, 16, 178, 148),
        title: const Text(
          'Create Supplier',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'meter issued to me'
            ),
            onTap: _tap
          ),
          SizedBox(
            height: 100,
          ),
          if(_isloading)
          CircularProgressIndicator()
        ],
      ),
      
      ),
      
    );
  }
}