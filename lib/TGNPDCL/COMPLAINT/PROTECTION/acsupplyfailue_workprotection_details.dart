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

String? selectedbreaker='LV-I(LV VCB-2)';

final List<String> detailsselectedbreaker = ['LV-I(LV VCB-2)',];

// VCB DETAILS AS PER EBS
String? make='CGL';
final List<String> detailsmake = ['CGL'];
TextEditingController _serailno=TextEditingController();

// VCB DETAILS AS PER FIELD
String? makeFIELD='SELECT';
final List<String> detailsmakeFIELD = ['SELECT','ABB','ALSTOM','BHEL','BIECCO','CGL','Eausun','GR','JYOTHI','Megawin','OLG','S&S','SIEMENS','STELMEC','Sistem contro','VE','Victpry'];
TextEditingController _serailnofield=TextEditingController();

  String? selectedYear;
  List<String> years = [];


  @override
void initState() {
  super.initState();

  int currentYear = DateTime.now().year;
  for (int year = currentYear; year >= 1950; year--) {
    years.add(year.toString());
  }

  selectedYear = currentYear.toString(); // default selected
}
String? batterycondition='SELECT';
final List<String> detailsbatterycharger=['SELECT','OK','NOT OK'];

String? breakertrip='SELECT';
final List<String> detailsbreakertrip=['SELECT','OK','NOT OK'];

String? breakerclose='SELECT';
final List<String> detailsbreakerclose=['SELECT','OK','NOT OK'];
  
  String? vcbmechanism='SELECT';
final List<String> detailsvcbmechanism=['SELECT','OK','NOT OK'];


  String? relaytype='SELECT';
final List<String> detailsrelaytype=['SELECT','Mechanical','Static','Numerical','IED Relay','DAC-BCPU'];

String? relaytestconducted='SELECT';
final List<String> detailsrelaytestconducted =['SELECT','OK','NOT OK'];

String? relayworkingstatus='SELECT';
final List<String> detailsrelayworkingstatus =['SELECT','OK','NOT OK'];

String? availablectratio='SELECT';
  final List<String> detailsavailablectratio =['SELECT','-/1A','5/5A','10/5A','20/5A','40/5A','60/5A','75/5A','100/1A','200/1A','200/5A','125/5A'];

String? connectedctratio= 'SELECT';
final List<String> detailsconnectedctratio=['SELECT','50/1A','100/1A','200/1A','400/1A','300/1A','600/1A','100/5A','200/5A','400/1A',];

String? poleassemblystatus='SELECT';
final List<String> detailspoleassemblystatus =['SELECT','OK','NOT OK'];

String? ctsworkingstatus='SELECT';
final List<String> detailsctsworkingstatus =['SELECT','OK','NOT OK'];
///WORK DETAILS

String? selectnatureofwork='AC Supply Failure';
final List<String> detailsselectnatureofwork=['AC Supply Failure','DC Supply Failure','Vaccum Interrupyer','Drive insulating ROD','pole assembly','Top insulator','Bottom insulator','Mechanism',];


String? selectnatureofworkoptional1='Not Applicable';
final List<String> detailsselectnatureofworkoptional1=['Not Applicable','AC Supply Failure','DC Supply Failure','Vaccum Interrupyer','Drive insulating ROD','pole assembly','Top insulator','Bottom insulator','Mechanism',
'CT failure','primary injection of CTs of VCB','Replacement of Capacitor cells','PT failure','Battery Changes','Relay','Trip coil','Trip circuit problem','Close circuit problem','Closing coil','Auxiliary switch','Hooter (bell)'];

String? selectnatureofworkoptional2='Not Applicable';
final List<String> detailsselectnatureofworkoptional2=['Not Applicable','AC Supply Failure','DC Supply Failure','Vaccum Interrupyer','Drive insulating ROD','pole assembly','Top insulator','Bottom insulator','Mechanism',
'CT failure','primary injection of CTs of VCB','Replacement of Capacitor cells','PT failure','Battery Changes','Relay','Trip coil','Trip circuit problem','Close circuit problem','Closing coil','Auxiliary switch','Hooter (bell)'];
 
 //DATE OF INSPECTION
 TextEditingController _datecontroller =TextEditingController();
// open the data picker
Future<void> _selectdate(BuildContext context)async{
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
     firstDate: DateTime(1980), 
    lastDate: DateTime(2100));
    if (picked != null){
      setState(() {
       String formattedDate = "${picked.day}/${picked.month}/${picked.year}";
     _datecontroller.text =formattedDate;
      });
    }
}
final List<String> sparesprovided = [
  'Vaccum Interrupter',
  'Drive insulating Rod',
  'Pole assembly',
  'Top insulator',
  'Bottom insulator',
  'Mechanism',
  'CT',
  'PT',
  'Battery',
  'Battery chargers',
  'Relay',
  'Trip coil',
  'Closing coil',
];

Map<int, int> selectedSpares = {};

// Spares reqired

final List<String> sparesreqired = [
  'Vaccum Interrupter',
  'Drive insulating Rod',
  'Pole assembly',
  'Top insulator',
  'Bottom insulator',
  'Mechanism',
  'CT',
  'PT',
  'Battery',
  'Battery chargers',
  'Relay',
  'Trip coil',
  'Closing coil',
];

Map<int, int> selectedsparesreqired = {}; // index: quantity

 
 
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
                                  items: detailsselectedbreaker.map((String datasbreaker){
                                    return DropdownMenuItem(
                                      value: datasbreaker,
                                      child: Text(datasbreaker));
                                  }).toList(), 
                                  onChanged: (String? showbreakers){
                                    setState(() {
                                      selectedbreaker=showbreakers;
                                    });
                                  }),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text("CGL-49591",
                                  style: TextStyle(
                                    color: Colors.brown
                                  ),)
                                 ],
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text('VCB DETAILS AS PER EBS',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                               
                                SizedBox(
                                  height: 6,
                                ),
                                 Divider(),
                                Text('MAKE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),),
                                SizedBox(
                                  height: 6,
                                ),
                                DropdownButton<String>(
                                  isExpanded: true,
                                  value: make,
                                  items: detailsmake.map((String datamake){
                                    return DropdownMenuItem<String>(
                                      value: datamake,
                                      child: Text(datamake));
                                  }).toList(), 
                                  onChanged: (String? showmakes){
                                    setState(() {
                                      make=showmakes;
                                    });
                                  }),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text('SERIAL NO',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  TextField(
                                    controller: _serailno,
                                  )
                              ],
                            ),
                          ),
                           SizedBox(
                            height: 6,
                          ),
                          Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text('VCB DETAILS AS PER FIELD',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                             
                                SizedBox(
                                  height: 6,
                                ),
                                   Divider(),
                                Text('MAKE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),),
                                SizedBox(
                                  height: 6,
                                ),
                                DropdownButton<String>(
                                  isExpanded: true,
                                  value: makeFIELD,
                                  items: detailsmakeFIELD.map((String datamakefield){
                                    return DropdownMenuItem<String>(
                                      value: datamakefield,
                                      child: Text(datamakefield));
                                  }).toList(), 
                                  onChanged: (String? showmakesfield){
                                    setState(() {
                                      makeFIELD=showmakesfield;
                                    });
                                  }),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text('SERIAL NO',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  TextField(
                                    controller: _serailnofield,
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text('Year of manufacture',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  SizedBox(
                                    height: 6,
                                  ),
                                                  DropdownButton<String>(
                                    isExpanded: true,
                                value: selectedYear,
                       items: years.map((String year) {
                            return DropdownMenuItem<String>(
                            value: year,
                            child: Text(year),
                        );
                          }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                   selectedYear = newValue;
                        });
                            },
                         ),
                         SizedBox(
                                    height: 6,
                                  ),
                                  Text('Battery Charger condition',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  SizedBox(
                                    height: 6,
                                  ),
                                                  DropdownButton<String>(
                                    isExpanded: true,
                                value: batterycondition,
                       items: detailsbatterycharger.map((String databattery) {
                            return DropdownMenuItem<String>(
                            value: databattery,
                            child: Text(databattery),
                        );
                          }).toList(),
                onChanged: (String? showbatterycondiiton) {
                  setState(() {
                   batterycondition = showbatterycondiiton;
                        });
                            },
                         ),
                          SizedBox(
                                    height: 6,
                                  ),
                                  Text('Breaker Trip',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  SizedBox(
                                    height: 6,
                                  ),
                                                  DropdownButton<String>(
                                    isExpanded: true,
                                value: breakertrip,
                       items: detailsbreakertrip.map((String databreakertrip) {
                            return DropdownMenuItem<String>(
                            value: databreakertrip,
                            child: Text(databreakertrip),
                        );
                          }).toList(),
                onChanged: (String? showbreakertrip) {
                  setState(() {
                   breakertrip = showbreakertrip;
                        });
                            },
                         ),
                          SizedBox(
                                    height: 6,
                                  ),
                                  Text('Breaker Close',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  SizedBox(
                                    height: 6,
                                  ),
                                                  DropdownButton<String>(
                                    isExpanded: true,
                                value: breakerclose,
                       items: detailsbreakerclose.map((String databreakerclose) {
                            return DropdownMenuItem<String>(
                            value: databreakerclose,
                            child: Text(databreakerclose),
                        );
                          }).toList(),
                onChanged: (String? showbreakeclose) {
                  setState(() {
                   breakerclose = showbreakeclose;
                        });
                            },
                         ),
                          SizedBox(
                                    height: 6,
                                  ),
                                  Text('VCB Mechanism status',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  SizedBox(
                                    height: 6,
                                  ),
                                                  DropdownButton<String>(
                                    isExpanded: true,
                                value: vcbmechanism,
                       items: detailsvcbmechanism.map((String datavcbmechanism) {
                            return DropdownMenuItem<String>(
                            value: datavcbmechanism,
                            child: Text(datavcbmechanism),
                        );
                          }).toList(),
                onChanged: (String? showvcbmechansim) {
                  setState(() {
                   vcbmechanism = showvcbmechansim;
                        });
                            },
                         ),
                         SizedBox(
                                    height: 6,
                                  ),
                                  Text('Relay Type',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  SizedBox(
                                    height: 6,
                                  ),
                                                  DropdownButton<String>(
                                    isExpanded: true,
                                value: relaytype,
                       items: detailsrelaytype.map((String datarelaytype) {
                            return DropdownMenuItem<String>(
                            value: datarelaytype,
                            child: Text(datarelaytype),
                        );
                          }).toList(),
                onChanged: (String? showrelaytype) {
                  setState(() {
                   relaytype = showrelaytype;
                        });
                            },
                         ),
                          SizedBox(
                                    height: 6,
                                  ),
                                  Text('Relay Test Conducted',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  SizedBox(
                                    height: 6,
                                  ),
                                                  DropdownButton<String>(
                                    isExpanded: true,
                                value: relaytestconducted,
                       items: detailsrelaytestconducted.map((String datarelaytest) {
                            return DropdownMenuItem<String>(
                            value: datarelaytest,
                            child: Text(datarelaytest),
                        );
                          }).toList(),
                onChanged: (String? showrelaytest) {
                  setState(() {
                   relaytestconducted = showrelaytest;
                        });
                            },
                         ),
                          SizedBox(
                                    height: 6,
                                  ),
                                  Text('Relay working status',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  SizedBox(
                                    height: 6,
                                  ),
                                                  DropdownButton<String>(
                                    isExpanded: true,
                                value: relayworkingstatus,
                       items: detailsrelayworkingstatus.map((String datarelaywork) {
                            return DropdownMenuItem<String>(
                            value: datarelaywork,
                            child: Text(datarelaywork),
                        );
                          }).toList(),
                onChanged: (String? showrelaywork) {
                  setState(() {
                   relayworkingstatus = showrelaywork;
                        });
                            },
                         ),
                         SizedBox(
                                    height: 6,
                                  ),
                                  Text('Available CT Ratio',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  SizedBox(
                                    height: 6,
                                  ),
                                                  DropdownButton<String>(
                                    isExpanded: true,
                                value: availablectratio,
                       items: detailsavailablectratio.map((String datactratio) {
                            return DropdownMenuItem<String>(
                            value: datactratio,
                            child: Text(datactratio),
                        );
                          }).toList(),
                onChanged: (String? showctratio) {
                  setState(() {
                   availablectratio = showctratio;
                        });
                            },
                         ),
                         SizedBox(
                                    height: 6,
                                  ),
                                  Text('Connected CTs Ratio',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  SizedBox(
                                    height: 6,
                                  ),
                                      DropdownButton<String>(
                                    isExpanded: true,
                                value: connectedctratio,
                       items: detailsconnectedctratio.map((String dataconnectedratio) {
                            return DropdownMenuItem<String>(
                            value: dataconnectedratio,
                            child: Text(dataconnectedratio),
                        );
                          }).toList(),
                onChanged: (String? showconnectedratio) {
                  setState(() {
                   connectedctratio = showconnectedratio;
                        });
                            },
                         ),
                          SizedBox(
                                    height: 6,
                                  ),
                                  Text('Pole Assembly status(Optional)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  SizedBox(
                                    height: 6,
                                  ),
                                      DropdownButton<String>(
                                    isExpanded: true,
                                value: poleassemblystatus,
                       items: detailspoleassemblystatus.map((String datapoleassemblystatus) {
                            return DropdownMenuItem<String>(
                            value: datapoleassemblystatus,
                            child: Text(datapoleassemblystatus),
                        );
                          }).toList(),
                onChanged: (String? showpoleassemblystatus) {
                  setState(() {
                    poleassemblystatus= showpoleassemblystatus;
                        });
                            },
                         ),
                          SizedBox(
                                    height: 6,
                                  ),
                                  Text('CTs Working Status(Optional)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  SizedBox(
                                    height: 6,
                                  ),
                                      DropdownButton<String>(
                                    isExpanded: true,
                                value: ctsworkingstatus,
                       items: detailsctsworkingstatus.map((String datactsworking) {
                            return DropdownMenuItem<String>(
                            value: datactsworking,
                            child: Text(datactsworking),
                        );
                          }).toList(),
                onChanged: (String? showctsratio) {
                  setState(() {
                   ctsworkingstatus = showctsratio;
                        });
                            },
                         ),
                         SizedBox(
                                    height: 6,
                                  ),
                                  Text('Remarks',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  TextField()
                              ],
                            ), 
                          ),
                          SizedBox(
                            height: 6,
                          ),
                    //// WORK DETAILS
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Center(
                          child: Text('WORK DETAILS',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                        Divider(),
                        SizedBox(
                                    height: 6,
                                  ),
                                  Text('SELECT NATURE OF WORK',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  SizedBox(
                                    height: 6,
                                  ),
                                      DropdownButton<String>(
                                    isExpanded: true,
                                value: selectnatureofwork,
                       items: detailsselectnatureofwork.map((String datanatureofwork) {
                            return DropdownMenuItem<String>(
                            value: datanatureofwork,
                            child: Text(datanatureofwork),
                        );
                          }).toList(),
                onChanged: (String? shownatureofwork) {
                  setState(() {
                   selectnatureofwork = shownatureofwork;
                        });
                            },
                         ),         
                          SizedBox(
                                    height: 6,
                                  ),
                                  Text('SELECT NATURE OF WORK(Opitonal)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  SizedBox(
                                    height: 6,
                                  ),
                                      DropdownButton<String>(
                                    isExpanded: true,
                                value: selectnatureofworkoptional1,
                       items: detailsselectnatureofworkoptional1.map((String datanatureofwork1) {
                            return DropdownMenuItem<String>(
                            value: datanatureofwork1,
                            child: Text(datanatureofwork1),
                        );
                          }).toList(),
                onChanged: (String? shownatureofwork1) {
                  setState(() {
                   selectnatureofworkoptional1 = shownatureofwork1;
                        });
                            },
                         ),
                          SizedBox(
                                    height: 6,
                                  ),
                                  Text('SELECT NATURE OF WORK(Optional)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  SizedBox(
                                    height: 6,
                                  ),
                                      DropdownButton<String>(
                                    isExpanded: true,
                                value: selectnatureofworkoptional2,
                       items: detailsselectnatureofworkoptional1.map((String datanatureofwork2) {
                            return DropdownMenuItem<String>(
                            value: datanatureofwork2,
                            child: Text(datanatureofwork2),
                        );
                          }).toList(),
                onChanged: (String? shownatureofwork2) {
                  setState(() {
                   selectnatureofworkoptional2 = shownatureofwork2;
                        });
                            },
                         ),
                         SizedBox(
                          height: 6,
                         ),
                         Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('DATE OF INSPECTION',
                              style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(
                                height: 6,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: TextField(
                                  controller: _datecontroller,
                                  readOnly: true,
                                  textAlign: TextAlign.center,
                                  onTap: ()=> _selectdate(context),
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),
                                  decoration: const InputDecoration(
                                  hintText: 'Select Date',
                                  fillColor: Colors.grey,
                                  filled: true,
                                border: OutlineInputBorder())
                                ),
                              )
                            ],
                          ),
                         ),
                        ],
                      ),
                    ),
                    SizedBox(
                          height: 6,
                         ),
                         Card(
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'DETAILS OF SPARES PROVIDED',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),

       
// DISPLAY SELECTED SPARES
if (selectedSpares.isNotEmpty)
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      
      ...selectedSpares.entries.map((entry) {
        int index = entry.key;
        int quantity = entry.value;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left: spare name in grey
              Text(
                sparesprovided[index],
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  // Quantity input
                  SizedBox(
                    width: 60,
                    height: 30,
                    child: TextField(
                      controller: TextEditingController(text: quantity.toString()),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                        border: UnderlineInputBorder(),
                      ),
                      onChanged: (value) {
                        selectedSpares[index] = int.tryParse(value) ?? 1;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Delete icon
                  GestureDetector(
                    onTap: () {
                      selectedSpares.remove(index);
                      (context as Element).markNeedsBuild();
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    ],
  ),

 //SizedBox(height: 10),

// ADD SPARE BUTTON & DIALOG
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    IconButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: StatefulBuilder(
            builder: (dialogContext, dialogSetState) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Select Spare',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      runSpacing: 10,
                      children: List.generate(sparesprovided.length, (index) {
                        bool isSelected = selectedSpares.containsKey(index);
                        return InkWell(
                          onTap: () {
                            dialogSetState(() {
                              if (isSelected) {
                                selectedSpares.remove(index);
                              } else {
                                selectedSpares[index] = 1;
                              }
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                isSelected
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                color: isSelected ? Colors.pink : Colors.grey,
                                size: 25,
                              ),
                              const SizedBox(width: 7),
                              Text(sparesprovided[index]),
                            ],
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(dialogContext); // just close
                          },
                          child: Text('CANCEL', style: TextStyle(color: Colors.pink)),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(dialogContext);
                            setState(() {}); // ✅ TRIGGER UI rebuild of parent
                          },
                          child: Text('DONE', style: TextStyle(color: Colors.pink)),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  },
  icon: Text(
    '+ ADD SPARE',
    style: TextStyle(
      color: Colors.indigo,
      fontWeight: FontWeight.bold,
    ),
  ),
),

  ],
),

      ],
    ),
  ),
),
                       SizedBox(
                          height: 6,
                         ),
                         Card(
               child: Padding(
       padding: const EdgeInsets.all(12.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               Center(
             child: Text(
            'DETAILS OF SPARES REQUIRED',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),      
// DISPLAY SELECTED SPARES
if (selectedsparesreqired.isNotEmpty)
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ...selectedsparesreqired.entries.map((entry) {
        int index = entry.key;
        int quantity = entry.value;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sparesreqired[index],
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  // Quantity input
                  SizedBox(
                    width: 60,
                    height: 30,
                    child: TextField(
                      controller: TextEditingController(text: quantity.toString()),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                        border: UnderlineInputBorder(),
                      ),
                      onChanged: (value) {
                        selectedsparesreqired[index] = int.tryParse(value) ?? 1;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Delete icon
                  GestureDetector(
                    onTap: () {
                      selectedsparesreqired.remove(index);
                      (context as Element).markNeedsBuild();
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    ],
  ),

 //SizedBox(height: 10),

// ADD SPARE BUTTON & DIALOG
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    IconButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: StatefulBuilder(
            builder: (dialogContext, dialogSetState) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Select Spare',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      runSpacing: 10,
                      children: List.generate(sparesreqired.length, (index) {
                        bool Selected = selectedsparesreqired.containsKey(index);
                        return InkWell(
                          onTap: () {
                            dialogSetState(() {
                              if (Selected) {
                                selectedsparesreqired.remove(index);
                              } else {
                                selectedsparesreqired[index] = 1;
                              }
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                Selected
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                color: Selected ? Colors.pink : Colors.grey,
                                size: 25,
                              ),
                              const SizedBox(width: 7),
                              Text(sparesreqired[index]),
                            ],
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(dialogContext); // just close
                          },
                          child: Text('CANCEL', style: TextStyle(color: Colors.pink)),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(dialogContext);
                            setState(() {}); // ✅ TRIGGER UI rebuild of parent
                          },
                          child: Text('DONE', style: TextStyle(color: Colors.pink)),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  },
  icon: Text(
    '+ ADD REQUIRED SPARE',
    style: TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
    ),
  ),
),

  ],
),

      ],
    ),
  ),
),
SizedBox(
  height: 6,
),
 Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
    
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero
    
          )
        ),
      onPressed: (){}, 
      child: Text('SUBMIT')),
    ),
  )

            ],
          ),
        ),
      ),
    );
    
  }
}