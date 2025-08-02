import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class CreatedtrStrucutre extends StatefulWidget {
  const CreatedtrStrucutre({super.key});

  @override
  State<CreatedtrStrucutre> createState() => _CreatedtrStrucutreState();
}

class _CreatedtrStrucutreState extends State<CreatedtrStrucutre> {
  String? locationofdtr='SELECT';
  List<String> selectlocatioofdtr=['SELECT','KHAMMAM STORE','WARANGAL-STORE','KARIMNAGAR-STORE',
  'NIZAMABAD-STORE','NIRMAL-STORE','MANCHERIAL-STORE'];
  bool ischecked=false;
  //DTR DETAILS
  String? make;
  List<String> selectmake=['11KV VCB-AREVA T&D INDIA LTD,NAINI WORKS','ABB(Asea Brown BOveri)','ACRO TRANS CONTROLS,SECUNDRABAD','AKSHAYA',
  'ALSTOM','AMOD(AMOD INDUSTRIES PVT LTD)','APEX','ARK','ASTER','AUREL CONTROLS PVT LTD','ANDHRA PRADESH ELECTRICAL EQUIPMENT CORPORATION'];
  String? capacity;
  List<String> selectcapacity=['SELECT','2500KVA','2000KVA','1600KVA','1000KVA','800KVA','500KVA','400KVA','315KVA','250KVA'];
  String? selectedyears='SELECT';
  List<String> years=[];
@override
  void initState(){
    super.initState();
    generateyears();
  }
  void generateyears(){
    years.add('SELECT');
    years.add('NA');
    int startyear=1952;
    int endyear=DateTime.now().year;
    for (int year=startyear; year <= endyear; year++){
      years.add(year.toString());
    }
  }
//phase
String? phase='SELECT';
List<String> selectphase=['SELECT','Single phase','3-Phase'];
//Ratio
String? ratio='SELECT';
List<String> selectratio=['SELECT','6.6KV/240V','11KV/440V'];
//select type of meter (LV side)
String? typeofmeter='SELECT';
List<String> selecttypeofmeter=['SELECT','Not Available','1Ph Meter','3Ph Meter','CT Meter','HT Meter'];

TextEditingController _serialno=TextEditingController();
TextEditingController _sapdtrequpno=TextEditingController();

  File? _imageFile;

  Future<void> _pickFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  void _submitform(){
    setState(() {
      ischecked=false;
        _imageFile = null;
       locationofdtr=null;
      make=null;
      capacity=null;
     selectedyears=null;
     phase=null;
     ratio=null;
     typeofmeter=null;
     _serialno.clear();
     _sapdtrequpno.clear(); 
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 5, 181, 163),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.close,color: Colors.white,)),
          title: Row(
            children: [
              Text('Create DTR Structure',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14
              ),
              ),
              SizedBox(width: 22,),
              Text('UPDATE DTR MAKES',
              style: TextStyle(
                fontSize: 10,
                color: Colors.white
              ),)
            ],
          ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Location of DTR',
              style: TextStyle(color: const Color.fromARGB(255, 230, 111, 251),),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
         Checkbox(
          value: ischecked, onChanged: (bool? value){
            setState(() {
              ischecked=value!;
            });
          },
          activeColor: Colors.pink,),
          Text('STORE',style: TextStyle(color: Colors.black),)
            ],),
            Text('Select physical Location Of DTR',
              style: TextStyle(color: const Color.fromARGB(255, 228, 124, 247)),),
              DropdownButton(
                value: locationofdtr,
                isExpanded: true,
                items: selectlocatioofdtr.map((String selectlocation){
                       return DropdownMenuItem(
                        value: selectlocation,
                        child: Text(selectlocation));
                }).toList(), 
                onChanged: (String? updatelocation){
                  setState(() {
                    locationofdtr=updatelocation;
                  });
                }),
                Container(
                  height: 50,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 225, 223, 223),
                  child: Center(child: Text('DTR Details', style: TextStyle(color: const Color.fromARGB(255, 228, 124, 247)),),),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                    children: [
                      Text(
                        'Make',
                        style: TextStyle(
                          color: Color.fromARGB(255, 228, 124, 247),
                          fontSize: 15
                        ),
                      ),
                      SizedBox(width: 8), // Small spacing
                      Expanded(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: make,
                          items: selectmake.map((String choosemake) {
                            return DropdownMenuItem(
                              value: choosemake,
                              child: Text(
                                choosemake,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                          onChanged: (String? options) {
                            setState(() {
                              make = options;
                            });
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context, 
                            builder: (BuildContext context){
                              return Dialog(
                                child: Column(
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey,
                                        prefixIcon: Icon(Icons.search,color: Colors.white,),
                                        hintText: 'Search Make'                                  
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                        },
                        icon: Icon(Icons.search,color: const Color.fromARGB(255, 238, 20, 5),size: 35,),
                      ),
                    ],
                                  ),
                                  Divider(),
                                  Row(
                    children: [
                      Text(
                        'Capacity',
                        style: TextStyle(
                          color: Color.fromARGB(255, 228, 124, 247),
                          fontSize: 15
                        ),
                      ),
                      SizedBox(width: 70), // Small spacing
                      Expanded(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: capacity,
                          items: selectcapacity.map((String chooscapacity) {
                            return DropdownMenuItem(
                              value: chooscapacity,
                              child: Text(
                                chooscapacity,
                                textAlign: TextAlign.end,
                              ),
                            );
                          }).toList(),
                          onChanged: (String? selectedcapacity) {
                            setState(() {
                              capacity = selectedcapacity;
                            });
                          },
                        ),
                      ),
                    ],
                                  ),
                                  Divider(),
                                  Row(
                    children: [
                      Text(
                        'Serail No.',
                        style: TextStyle(
                          color: Color.fromARGB(255, 228, 124, 247),
                          fontSize: 15
                        ),
                      ),
                      SizedBox(width: 70), // Small spacing
                      Expanded(
                        child: TextField(
                          controller: _serialno,
                        )
                      ),
                    ],
                     ), 
                       SizedBox(height: 10,),
                       Text('If Serail No. is not available Please click here',
                    style: TextStyle(color: const Color.fromARGB(255, 202, 18, 4),fontSize: 12),),
                     SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Request Serial No',style: TextStyle(color:const Color.fromARGB(255, 7, 169, 244),fontSize: 12),
                       ),
                      ],
                    ),
                     SizedBox(height: 10,),
                       Text('👉Please Paint the Serail No on the DTR and capture the photo of DTR',
                    style: TextStyle(color: const Color.fromARGB(255, 202, 18, 4),fontSize: 8,fontWeight: FontWeight.bold),), 
                    Divider(),
                       SizedBox(height: 10,),
                                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Year of Mfg',
                          style: TextStyle(
                            color: Color.fromARGB(255, 228, 124, 247),
                            fontSize: 15
                          ),
                        ),
                      ),
                      
                      Expanded(
                        flex: 1,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedyears,
                          items: years.map((String choosyear) {
                            return DropdownMenuItem(
                              value: choosyear,
                              child: Text(
                                choosyear,
    
                              ),
                            );
                          }).toList(),
                          onChanged: (String? selectedyear) {
                            setState(() {
                              selectedyears = selectedyear;
                            });
                          },
                        ),
                      ),
                    ],
                                  ),
                                   Divider(),
                       SizedBox(height: 10,),
                                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Phase',
                          style: TextStyle(
                            color: Color.fromARGB(255, 228, 124, 247),
                            fontSize: 15
                          ),
                        ),
                      ),
                     
                      Expanded(
                        flex: 1,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: phase,
                          items: selectphase.map((String choosphase) {
                            return DropdownMenuItem(
                              value: choosphase,
                              child: Text(
                                choosphase,
    
                              ),
                            );
                          }).toList(),
                          onChanged: (String? selectephase) {
                            setState(() {
                              phase = selectephase;
                            });
                          },
                        ),
                      ),
                    ],
                                  ),
                                   Divider(),
                       SizedBox(height: 10,),
                                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Ratio',
                          style: TextStyle(
                            color: Color.fromARGB(255, 228, 124, 247),
                            fontSize: 15
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: ratio,
                          items: selectratio.map((String choosratio) {
                            return DropdownMenuItem(
                              value: choosratio,
                              child: Text(
                                choosratio,
    
                              ),
                            );
                          }).toList(),
                          onChanged: (String? selectedratio) {
                            setState(() {
                              ratio = selectedratio;
                            });
                          },
                        ),
                      ),
                    ],
                                  ),
                                   Divider(),
                       SizedBox(height: 10,),
                                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Select Type of meter(LV side)',
                          style: TextStyle(
                            color: Color.fromARGB(255, 228, 124, 247),
                            fontSize: 12
                          ),
                        ),
                      ),
                      SizedBox(width: 5), // Small spacing
                      Expanded(
                        flex: 1,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: typeofmeter,
                          items: selecttypeofmeter.map((String choosmeter) {
                            return DropdownMenuItem(
                              value: choosmeter,
                              child: Text(
                                choosmeter,
                                overflow: TextOverflow.ellipsis,
    
                              ),
                            );
                          }).toList(),
                          onChanged: (String? selectedmeters) {
                            setState(() {
                              typeofmeter = selectedmeters;
                            });
                          },
                        ),
                      ),
                    ],
                                  ),
                                         Divider(),
                       SizedBox(height: 10,),
                                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'SAP DTR Equp. No(Painted On DTR)',
                          style: TextStyle(
                            color: Color.fromARGB(255, 228, 124, 247),
                            fontSize: 12
                          ),
                        ),
                      ),
                      SizedBox(width: 5), // Small spacing
                      Expanded(
                        flex: 1,
                        child: TextField(
                          readOnly: true,
                          onTap: () {
                            showDialog(
                              context: context, 
                              builder: (BuildContext context){
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                        Container(
                                    width: double.infinity,
                                    child: TextField(
                                      decoration: InputDecoration(
                                       filled: true,
                                       fillColor: Colors.grey,
                                       prefixIcon: Icon(Icons.search,color: Colors.white,),
                                       hintText: 'Search equipment'
                                      ),
                                    ),
                                  ),
                                    ],

                                ),  

                              );
                              });
                          },
                        )
                      ),
                    ],
                 ),
                   SizedBox(height: 10,),
                   Text('👉Please Paint the Equipment code on the DTR and capture the photo of DTR',
                    style: TextStyle(color: const Color.fromARGB(255, 202, 18, 4),fontSize: 7,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 300,
                      color: const Color.fromARGB(255, 208, 203, 203),
                      child: _imageFile != null
                                      ? Image.file(_imageFile!, height: 300,width: 300,)
                                      : Text(''),
                    ),
                                SizedBox(height: 10),
                                 SizedBox(
                                  width: double.infinity,
                                   child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.deepOrange,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero
                                        )
                                    ),
                           onPressed: _pickFromCamera,
                           child: Text('Capture DTR PHOTO'),
                         ),
                                 )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Center(
              child: Text(
             'Location Accuracy:12.4 mts/53.0mts',
               textAlign: TextAlign.center,
            style: TextStyle(color: Colors.lightGreen),
                 ),
                 ),
                 SizedBox(height: 10,),
                 SizedBox(
                                  width: double.infinity,
                                   child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero
                                        )
                                    ),
                           onPressed: _submitform,
                           child: Text('SUBMIT'),
                         ),
                                 )

            ],
          ),
        ),
      ),
    );
  }
}