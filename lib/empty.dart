import 'package:flutter/material.dart';

class process extends StatefulWidget {
  const process({super.key});

  @override
  State<process> createState() => _processState();
}

class _processState extends State<process> {
   List<String> years = [];
String? selectedyear;

@override
void initState() {
  super.initState();

  int currentYear = DateTime.now().year;

  for (int i = currentYear; i >= 1995; i--) {
    years.add('${i}-${i+1}');
  }

  years.insert(0, '--SELECT--'); // Add placeholder
  selectedyear = years[0]; // Safely set value from list
}

  var options=['Issue D.I','Reject indent'];  
  int? iselectedindex;
  bool get isRejectSelected => iselectedindex == 1;

  


String? serviceordrs;
final List<String> selectserviceorders=['22/1147(7632|RDY Qty:0|8m/140)','2200001156(7669)|Rdy Qty:0|9.10m/280',
'2200001155(7633)|Rdy Qty:0|8m/140','6666666666666|Rdy Qty:40|8m/140'];


TextEditingController approveQtyController = TextEditingController();
bool showRemarks = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('single indendet'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: (){
              showDialog(
                context: context, 
                builder: (context){
                  return Dialog(
                     shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
                                 ),
                                 child: SingleChildScrollView(
                                   child: Column(
                                                     crossAxisAlignment: CrossAxisAlignment.start,
                                                     mainAxisSize: MainAxisSize.max,
                                                     children: [
                                                       Container(
                                                         width: double.infinity,
                                                         color: Colors.indigo,
                                                         padding: EdgeInsets.all(25),
                                                         child: Center(
                                                           child: Text('Issue D.I or Reject',
                                                           style: TextStyle(color: Colors.white,
                                                           fontWeight: FontWeight.bold),),
                                                         ),
                                                       ),
                                                       SizedBox(
                                                         height: 4,
                                                       ),
                                                       Padding(
                                                         padding: const EdgeInsets.symmetric(horizontal: 10),
                                                         child: Text('choose Option',
                                                         style: TextStyle(
                                                           color: Colors.black,
                                                           fontSize: 15
                                                         ),),
                                                       ),
                                                       SizedBox(
                                                         height: 4,
                                                       ),                  
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                                        child: Row(
                                                          children: [
                                                            Wrap(
                                                              spacing: 20, // horizontal space between options
                                                              children: List.generate(options.length, (index) {
                                                                bool isSelected = iselectedindex == index;
                                                                return InkWell(
                                                                  onTap: () {
                                                               setState(() {
                                                        iselectedindex = index;
                                                              });
                                                                  },
                                                                  child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                                    children: [
                                                             Icon(
                                              isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                                                             color: isSelected ? Colors.pink : Colors.grey,
                                                                      ),
 
                                                    SizedBox(width: 4), // space between icon and text
                                                         Text(options[index]),
                                                                    ],
                                                                  ),
                                                                );
                                                              }),                                                            
                                                            ), 
                                                                                                                     
                                                          ],
                                                        ),
                                                      ),
                                                    if (iselectedindex != null && isRejectSelected)...[
                                                         
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal:15),
                                                        child: Row(
                                                         children: [
                                                           Text('Indent Quantity',
                                                           style: TextStyle(color: const Color.fromARGB(255, 186, 19, 7)),),
                                                           SizedBox(width: 116),
                                                           Text('25',
                                                           style: TextStyle(color: Colors.black),)
                                                         ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 10,),
                                                       Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal:15),
                                                         child: Row(
                                                         
                                                         children: [
                                                           Text('Balance Quantity',
                                                           style: TextStyle(color: const Color.fromARGB(255, 180, 19, 7)),),
                                                            SizedBox(width: 105),
                                                           Text('25',
                                                           style: TextStyle(color: Colors.black),)
                                                           
                                                         ],
                                           ),
                                                       ),
                                                      SizedBox(height: 10,),
                                                       Padding(
                                                         padding: const EdgeInsets.symmetric(horizontal:15),
                                                         child: Row(
                                                         children: [
                                                           Text('AE/OD Recommended QTY',
                                                           style: TextStyle(color: const Color.fromARGB(255, 180, 19, 7)),),
                                                           SizedBox(width: 34,),
                                                           Text('31',
                                                           style: TextStyle(color: Colors.black),)
                                                         ],
                                           ),
                                                       ),
                                                       SizedBox(height: 10,),
                                                       Text('Remarks/Reason', style: TextStyle(color: Colors.black)),
                                                              SizedBox(height: 4),
                                                              TextField(
                                                                maxLines: 3,
                                                                decoration: InputDecoration(
                                                                  hintText: 'Please enter reason for not approving total indent quantity',
                                                                ),
                                                              ),
                                                               SizedBox(height: 6,),
                                                               Padding(
                                                                 padding: const EdgeInsets.all(8.0),
                                                                 child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child: ElevatedButton(
                                                                        onPressed: () {},
                                                                 style: ElevatedButton.styleFrom(
                                                                backgroundColor: Colors.grey,
                                                              foregroundColor: Colors.black,
                                                         shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.zero,
                                                           ),
                                                                      ),
                                                                 child: Text('CANCEL'),
                                                                     ),
                                                                    ),
                                                                     SizedBox(width: 5,),
                                                                  Expanded(
                                                            child: ElevatedButton(
                                                                   onPressed: () {},
                                                               style: ElevatedButton.styleFrom(
                                                             backgroundColor: Colors.red,
                                                  foregroundColor: const Color.fromARGB(255, 168, 5, 5),
                                                              shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.zero,
                                                               ),
                                                                        ),
                                                               child: Text('REJECT'),
                                                                      ),
                                                            ),
                                                          
                                                                  ],
                                                             ),
                                                               )
                                                              
                                                            
                                                      ],
                                                     if (iselectedindex != null && !isRejectSelected)...[

                                                         SizedBox(
                                                       height: 6,
                                                      ),
                                                      Divider(thickness: 2,),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal:15),
                                                        child: Row(
                                                         children: [
                                                           Text('Indent Quantity',
                                                           style: TextStyle(color: const Color.fromARGB(255, 186, 19, 7)),),
                                                           SizedBox(width: 116),
                                                           Text('25',
                                                           style: TextStyle(color: Colors.black),)
                                                         ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 10,),
                                                       Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal:15),
                                                         child: Row(
                                                         
                                                         children: [
                                                           Text('Balance Quantity',
                                                           style: TextStyle(color: const Color.fromARGB(255, 180, 19, 7)),),
                                                            SizedBox(width: 105),
                                                           Text('25',
                                                           style: TextStyle(color: Colors.black),)
                                                         ],
                                           ),
                                                       ),
                                                      SizedBox(height: 10,),
                                                       Padding(
                                                         padding: const EdgeInsets.symmetric(horizontal:15),
                                                         child: Row(
                                                         children: [
                                                           Text('AE/OD Recommended QTY',
                                                           style: TextStyle(color: const Color.fromARGB(255, 180, 19, 7)),),
                                                           SizedBox(width: 34,),
                                                           Text('31',
                                                           style: TextStyle(color: Colors.black),)
                                                         ],
                                           ),
                                                       ),
                                                       SizedBox(height: 10,),
                                                       Divider(thickness: 2,),
                                                       SizedBox(
                                                         height: 8,
                                                       ),
                                                       Padding(
                                                         padding: const EdgeInsets.symmetric(horizontal: 10),
                                                         child: Column(
                                                           crossAxisAlignment: CrossAxisAlignment.start,
                                                           children: [
                                                             Text('Financial Year',
                                                             style: TextStyle(color: Colors.black),),
                                                             SizedBox(height: 4,),
                                                             DropdownButton<String>(
                                                             isExpanded: true,
                                                            value: selectedyear,
                                                      items: years.map((String yearselect) {
                                                         return DropdownMenuItem(
                                                             value: yearselect,
                                                           child: Text(yearselect),
                                                            );
                                                       }).toList(),
                                                    onChanged: (String? displayyear) {
                                                     setState(() {
                                                                   selectedyear = displayyear!;
                                                         });
                                                          },
                                                         ),
                                                         SizedBox(height: 4,),
                                                              Text('Purchase Order',
                                                             style: TextStyle(color: Colors.black),),
                                                             SizedBox(height: 4,),
                                                             Row(
                                                              children: [
                                                                Expanded(
                                                                  child: DropdownButton<String>(
                                   value: serviceordrs,
                                   isExpanded: true,
                                   items: selectserviceorders.map((String showserviceno) {
                                                     return DropdownMenuItem(
                                                       value: showserviceno,
                                                       child: Text(showserviceno,
                                                       overflow: TextOverflow.ellipsis, // Handles overflow with ...
                                             maxLines: 1, ),
                                                     );
                                   }).toList(),
                                   onChanged: (String? updateno) {
                                                     setState(() {
                                                       serviceordrs = updateno!;
                                                     });
                                   },
                                                                  ),
                                                                ),
                                                                SizedBox(width: 8),
                                                                Container(
                                                                  width: 40,
                                                                  height: 40,
                                                                  decoration: BoxDecoration(
                                   color: const Color.fromARGB(255, 104, 103, 103),
                                   borderRadius: BorderRadius.circular(8),
                                                                  ),
                                                                  child: IconButton(
                                                                   onPressed: (){},
                                                    
                                   icon: Icon(Icons.search_rounded, size: 20, color: Colors.black87),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Text('firm Name:M/s VINAYAKA PSCC POLES',
                                                            style: TextStyle(color: Colors.green,
                                                            fontSize: 10),),
                                                            Text('Read Qty:0 pole Type:9.10m/280',
                                                            style: TextStyle(color: Colors.green,
                                                            fontSize: 10),),
                                                            SizedBox(height: 6,),
                                                            Divider(thickness: 2,),
                                                            SizedBox(height:4 ,),
                                                            Text('Approve Qty', style: TextStyle(color: Colors.black)),
                                                            SizedBox(height: 4),
                                                            TextField(
                                                              controller: approveQtyController,
                                                              maxLength: 1,
                                                              keyboardType: TextInputType.number,
                                                            ),
                                                            
                                                          
                                                              Text('Remarks/Reason', style: TextStyle(color: Colors.black)),
                                                              SizedBox(height: 4),
                                                              TextField(
                                                                maxLines: 3,
                                                                decoration: InputDecoration(
                                                                  hintText: 'Please enter reason for not approving total indent quantity',
                                                                ),
                                                              ),
                                                            

                                                               SizedBox(height: 6,),
                                                               Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: ElevatedButton(
                                                                      onPressed: () {},
                                                               style: ElevatedButton.styleFrom(
                                                            backgroundColor: Colors.grey,
                                                    foregroundColor: Colors.black,
                                                 shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.zero,
                                                       ),
                                                            ),
                                                            child: Text('CANCEL'),
                                                            ),
                                                                  ),
                                                  SizedBox(width: 5,),
                                                    Expanded(
                                                      child: ElevatedButton(
                                                              onPressed: () {},
                                                       style: ElevatedButton.styleFrom(
                                                       backgroundColor: Colors.indigo,
                                                       foregroundColor: Colors.white,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.zero,
                                                          ),
                                                             ),
                                                      child: Text('FORWARD'),
                                                                                                        ),
                                                    ),

                                                                ],
                                                             )
                                   
                                                            ],
                                                         ),
                                                       )
                                                      ]
                                                      
                                                     
                                                     ],
                                   ),
                                 ),
                               
                               );

                  
                });
            }, 
            child: Text('process single indent'))
        ],
      ),
      );

  }
}