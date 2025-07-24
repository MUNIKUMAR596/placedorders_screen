//import 'dart:ffi';

import 'package:flutter/material.dart';

class WorkprotectionDetails extends StatefulWidget {
  const WorkprotectionDetails({super.key});

  @override
  State<WorkprotectionDetails> createState() => _WorkprotectionDetailsState();
}

class _WorkprotectionDetailsState extends State<WorkprotectionDetails> {
  
  // sELECT DETAILS

  String? division='SELECT';
  String? subdivision='SELECT';
  String? section='SELECT';
 

  final List<String> selectdivision = ['SELECT', 'HANAMKONDA TOWN', 'HANAMKONDA RURAL'];
  final List<String> selectsubdivision = ['SELECT', 'KAZIPET', 'HANAMKONDA', 'NAYEEMNAGAR'];
  final List<String> selecsection = ['SELECT', 'NIT', 'MADIKONDA', 'KAZIPET','KADIPIKONDA','WADDEPALLY'];

    //SUB STATION & BREAKER DETAILS
String? selectss;
final List<String> detailsselectss=['SELECT','0004-33KV SS-REC'];

int selectedindex=-1; //Nothing selected intially
final List<String> breaker=['33 KV BREAKER','LV BREAKER','CAPACITOR BANK','11KV BREAKER'];

String? selectedbreaker;
final List<String> detailsselectedbreaker=[''];
    



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: const Color.fromARGB(255, 31, 123, 105),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(
    Icons.arrow_back,
    color: Colors.white,
    size: 30,
  ),),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Protection',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
            SizedBox(
              height: 3,
            ),
            Text('AC Supply Failure',
            style: TextStyle(
              fontSize: 15,
            color:const Color.fromARGB(255, 239, 232, 232)
            ),)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'SECTION DETAILS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 2),
                    const Text('SELECT DIVISION',
                    style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                    const SizedBox(height: 5),
                    DropdownButton<String>(
                      isExpanded: true,
                      value: division,
                      icon: const Icon(Icons.arrow_drop_down),
                      hint: const Text("Select Division"),
                      items: selectdivision.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          division = newValue;
                          subdivision = null; // reset subdivision when division changes
                        });
                      },
                    ),
                    const SizedBox(height: 4),
                    const Text('SELECT SUB DIVISION',
                    style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                    const SizedBox(height: 5),
                    // Enable only if valid division is selected
                    DropdownButton<String>(
                      isExpanded: true,
                      value: subdivision,
                      hint: const Text("Select Sub Division"),
                      icon: const Icon(Icons.arrow_drop_down),
                      items: (division != null && division != 'SELECT')
                          ? selectsubdivision.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()
                          : [],
                      onChanged: (division != null && division != 'SELECT')
                          ? (String? newValue) {
                              setState(() {
                                subdivision = newValue;
                              });
                            }
                          : null, // disable dropdown
                    ),
                    const SizedBox(height: 4),
                    const Text('SELECT SECTION',style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                    SizedBox(
                      height: 4,
                    ),
                    DropdownButton<String>(
                      isExpanded: true,
                      value: section,
                      icon: const Icon(Icons.arrow_drop_down),
                      items: (subdivision != null && subdivision !='SELECT')  
                     ? selecsection.map((String newselection){
                        return DropdownMenuItem(
                          value: newselection,
                          child: Text(newselection));
                      }).toList() :[],
                       onChanged:
                       (subdivision != null && subdivision !='SELECT') 
                        ? (String? updateselected){
                        setState(() {
                          section=updateselected;
                        });
                       }:null),         
                            ],
                          ),
                          ),
                          SizedBox(
                            height: 6,
                          ),

                          //SUB STATION & BREAKER DETAILS

                          Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text('SUB STATION & BREAKER DETAILS',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text('SELECT SS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),),
                                SizedBox(
                                  height: 6,
                                ),
                                DropdownButton(
                                  isExpanded: true,
                                  value: selectss,
                                  items: detailsselectss.map((String dataselectss){
                                    return DropdownMenuItem(
                                      value: dataselectss,
                                      child: Text(dataselectss));
                                  }).toList(), 
                                  onChanged: (String? showselectss){
                                    setState(() {
                                      selectss=showselectss;
                                    });
                                  }),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text('BREAKER',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Wrap(
                                    runSpacing: 15,
                                    children: [
                                       ...List.generate(breaker.length, (index){
                                      bool isselected = selectedindex == index;
                                      return  InkWell(
                                      onTap: () {
                                         if (selectss == null || selectss == 'SELECT' ){
                                          showDialog(
                                            context: context,
                                             builder: (context) => AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(0),
                                              ),
                                              titlePadding: EdgeInsets.zero,
                                              title:Container(
                                                padding: EdgeInsets.all(15),
                                                width: double.infinity,
                                                color: const Color.fromARGB(255, 255, 34, 34),
                                                child: Center(
                                                  child: Text('ALERT',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),),
                                                ),
                                              ),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text('Please Select SubStation first'),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: const Color.fromARGB(255, 244, 54, 54),
                                                        foregroundColor: Colors.black,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.zero 
                                                        )
                                                      ),
                                                      onPressed: (){
                                                      Navigator.pop(context);
                                                    }, child: Text('ok',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold
                                                    ),)),
                                                  )
                                                ],                                               
                                              ),                                         
                                             ));
                                        }
                                        setState(() {
                                          selectedindex=index;
                                        });
                                      },                                      
                                       child: Row(
                                         children: [
                                           Icon(
                                               isselected ? Icons.check_box : Icons.check_box_outline_blank,
                                              color: isselected ? Colors.pink : Colors.grey,
                                                 size: 25,
                                                ),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Text(breaker[index])
                                         ],
                                       ),
                                    );
                                    }),
                                    ],
                                  ),
                                    SizedBox(
                                      height:6 ,
                                    ),
                                    Text('SELECT BREAKER',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(
                                      height: 6,
                                    ),
                                     DropdownButton(
                                  isExpanded: true,
                                  value: selectedbreaker,
                                  items: detailsselectedbreaker.map((String databreaker){
                                    return DropdownMenuItem(
                                      value: databreaker,
                                      child: Text(databreaker));
                                  }).toList(), 
                                  onChanged: (String? showbreaker){
                                    setState(() {
                                      selectss=showbreaker;
                                    });
                                  }),
                              ],
                            ),
                          )
            ],
          ),
        ),
      ),
    );
    
  }
}