import 'package:flutter/material.dart';

class PurchaseOrders extends StatefulWidget {
  const PurchaseOrders({super.key});

  @override
  State<PurchaseOrders> createState() => _PurchaseOrdersState();
}

class _PurchaseOrdersState extends State<PurchaseOrders> {
  @override
  void initState() {
    super.initState();

    // Ensures the dialog runs after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showLoaderThenDialog();
    });
  }

 void _showLoaderThenDialog() async {
  // Show loading dialog first
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return const Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    },
  );

  // Wait for 2 seconds (simulate loading)
  await Future.delayed(const Duration(seconds: 2));

  // Close the loader
  Navigator.of(context).pop();

  // Then show the actual dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    color: const Color.fromARGB(255, 67, 65, 184),
                    child: const Text(
                      'Empty folder',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Oops! It looks like we couldn\'t find \n any purchase orders for the FY: \n 2025-2026',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 45, 43, 127),
                          foregroundColor: Colors.black,
                        ),
                        child: const Text(
                          'OK',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    TextEditingController _search = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: const Color.fromARGB(255, 7, 207, 171),
        title: const Text(
          ' Purchase Orders',
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
    children: [
      Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          const SizedBox(width: 2),
          Expanded( // 👈 Fix: Add this
            child: TextField(
              controller: _search,
              decoration: const InputDecoration(
                hintText: 'Search purchase orders...',
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 300),
      const Center(
        child: Text('It\'s empty here!',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15
        ),),
      ),
    ],
  ),
  
),
 floatingActionButton: FloatingActionButton(
   shape:CircleBorder() ,
  //  RoundedRectangleBorder(
  //   borderRadius: BorderRadius.circular(8), // 🟩 Rounded square
  // ),
    onPressed: () {
      // Action when button is pressed
    },
    child: Icon(Icons.filter_alt,
    color: Colors.white,
    size: 20,),
    backgroundColor: Colors.pink,
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
