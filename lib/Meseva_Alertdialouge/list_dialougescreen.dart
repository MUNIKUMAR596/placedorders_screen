import 'package:flutter/material.dart';
import 'package:purchase_orderscreen/main.dart';
void main() {
  runApp(const MyApp());
}

class ListDialougescreen extends StatefulWidget {
  const ListDialougescreen({super.key});

  @override
  State<ListDialougescreen> createState() => _ListDialougescreenState();
}

class _ListDialougescreenState extends State<ListDialougescreen> {
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _opendialog();
    });
  }
  void _opendialog(){
    showDialog(context: context, 
    builder: (context)=> AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      title: Text('Opps Error!!'),
      content: Text('No Data found'),
actions: [
  IconButton(onPressed: (){
    Navigator.pop(context);
  }, icon: Text('Ok',
  style: TextStyle(
    color: Colors.pinkAccent,
    fontWeight: FontWeight.bold
  ),))
],
    ));
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
        title: Row(
          children: [
            Text(
              'List',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 143.5,
            ),
            IconButton(onPressed: (){}, 
            icon: Icon(Icons.sync)),
            SizedBox(
              width: 3,
            ),
            IconButton(onPressed: (){}, 
            icon: Icon(Icons.search))
          ],
        ),
      ),
      //body: 
    );
  }
}