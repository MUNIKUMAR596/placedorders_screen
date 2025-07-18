import 'package:flutter/material.dart';
import 'package:purchase_orderscreen/main.dart';

void main() {
  runApp(const MyApp());
}

class LoadChangerequest extends StatefulWidget {
  const LoadChangerequest({super.key});

  @override
  State<LoadChangerequest> createState() => _LoadChangerequestState();
}

class _LoadChangerequestState extends State<LoadChangerequest> {
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _showdialog();
    });
    }void _showdialog() {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0)
      ),
      titlePadding: EdgeInsets.zero,
      title: Container(
        width: double.infinity,
        color:const Color.fromARGB(255, 56, 5, 175), 
        padding: const EdgeInsets.all(16),
        child: const Text(
          ' ALERT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Fetched 0 load change \nrequests',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 56, 5, 175), // 🔵 Blue background
                padding: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
                )
              ),
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.black, // ⚪ White text
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
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
        backgroundColor: const Color.fromARGB(255, 28, 162, 137),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Load Change Requests',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Under inspection by staff',
              style: TextStyle(
                color: Color.fromARGB(255, 249, 243, 243),
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
  }
