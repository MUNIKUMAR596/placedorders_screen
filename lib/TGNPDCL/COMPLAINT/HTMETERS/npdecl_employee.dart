import 'package:flutter/material.dart';
import 'package:purchase_orderscreen/TGNPDCL/COMPLAINT/ht_metersupdate.dart';
import 'package:purchase_orderscreen/TGNPDCL/ht_meters.dart';
import 'package:purchase_orderscreen/main.dart';

void main() {
  runApp(const MyApp());
}

class NpdeclEmployee extends StatefulWidget {
  const NpdeclEmployee({super.key});

  @override
  State<NpdeclEmployee> createState() => _NpdeclEmployeeState();
}

class _NpdeclEmployeeState extends State<NpdeclEmployee> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _opendialog();
    });
  }

  void _opendialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        titlePadding: EdgeInsets.zero,
        title: Container(
          width: double.infinity,
          color: const Color.fromARGB(255, 56, 5, 175),
          padding: const EdgeInsets.all(16),
          child: const Text(
            'ALERT',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Fetched 0 HT inspections'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 56, 5, 175),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'OK',
                  style: TextStyle(fontWeight: FontWeight.bold),
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
        backgroundColor: const Color.fromARGB(255, 248, 50, 39),
        title: Row(
          children: const [
            Text(
              'NPDCL EMPLOYEE',
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

      // ✅ Correct usage of FloatingActionButton
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        shape: const CircleBorder(),
        
        onPressed: () {
         {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HtMetersupdate()));
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
}
