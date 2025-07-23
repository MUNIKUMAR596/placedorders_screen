import 'package:flutter/material.dart';

class HtMetersupdate extends StatefulWidget {
  const HtMetersupdate({super.key});

  @override
  State<HtMetersupdate> createState() => HtMetersupdatesState();
}

class HtMetersupdatesState extends State<HtMetersupdate> {
    TextEditingController _dateController = TextEditingController();

  // This method shows the calendar
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),         // current date
      firstDate: DateTime(2000),           // lower bound
      lastDate: DateTime(2100),            // upper bound
    );

    if (pickedDate != null) {
      String formattedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      setState(() {
        _dateController.text = formattedDate; // set date in TextField
      });
    }
  }
// SECTION DETAILS
  String? division='SELECT';
  String? subdivision='SELECT';
  String? section='SELECT';
  String? premises='SELECT';

  final List<String> selectdivision = ['SELECT', 'HANAMKONDA TOWN', 'HANAMKONDA RURAL'];
  final List<String> selectsubdivision = ['SELECT', 'KAZIPET', 'HANAMKONDA', 'NAYEEMNAGAR'];
    final List<String> selecsection = ['SELECT', 'SUBEDARI', 'CHOWRASTHA/HNK', 'NAKKALAGUTTA','MACHILIBAZAR'];
    final List<String> selectpremises = ['SELECT','Consumer Service', 'SubStation Service'];
    // SERVICE DETAILS
    String? service=' HNK439 HNK439';
    final List<String> serviceno=[' HNK439 HNK439','NKH 132 NKH 132'];

  // WORK DETAILS
  String? selectedWork='Cable Change';

List<String> workdetails = [
  'Cable Change',
  'Phase down Rectification',
  'Phase down-Meter Replaced',
  'No Display-Meter Replaced',
  'Meter Burnt-Meter Replaced',
  'Meter Burnt-Meter(NO Display) Replaced',
  'Meter Defective-Meter Replaced',
  'CTPT Defective-CTOT Replaced',
];


  //METER DETAILS AS PER EBS
  String? make='SELECT';
  final List<String> metermake=['SELECT','SECURI'];
  TextEditingController _METERSERIALNO = TextEditingController();

    //METER DETAILS AS PER FIELD
String? meterfield='SELECT';
final List<String> meterfileddetails=['SELECT','DUKE Arnics', 'Elster','GENUS','HE','HPL','L&G','L&T','SECURE','UTL'];
  TextEditingController _METERSERIALNOfiled = TextEditingController();
  String? meterct='SELECT';
  final List<String> meterctratio =['SELECT','-/1A','5/5A','10/5A','20/5A','40/5A','60/5A','75/5A','100/1A','200/1A','200/5A','125/5A'];
  String? meterpt='SELECT';
  final List<String> meterptratio =['SELECT','-/110V','11KV/110V','33KV/110V','132KV/110V'];
    TextEditingController _METERMF = TextEditingController();
String? waranty='SELECT';
  final List<String> meterwarranty =['SELECT','WGP','RGP','BGP',];
      TextEditingController _METERpono = TextEditingController();
            TextEditingController _pomonthyear = TextEditingController();

// CTPT DETAILS
String? ctptmake='SELECT';
  final List<String> detailsctptmake =['SELECT','Vishal','GE Electrical', 'Vijay'];
  TextEditingController _ctptserialno = TextEditingController();
  TextEditingController _ctptsapequipmentno = TextEditingController();
  String? ctratio='SELECT';
  final List<String> detailsctratio =['SELECT','-/1A','5/5A','10/5A','20/5A','40/5A','60/5A','75/5A','100/1A','200/1A','200/5A','125/5A'];
    String? ptratio='SELECT';
  final List<String> detailsptratio =['SELECT','-/110V','11KV/110V','33KV/110V','132KV/110V'];

  //METER READING DETAILS
  bool _showdata = false;
  String? satisfactory='SELECT';
  final List<String> metersatisfactory=['SELECT','YES','No'];

  // NEW METER DETAILS
  String? newmetermake='SELECT';
    final List<String> detailsnewmetermake =['SELECT','DUKE Arnics', 'Elster','GENUS','HE','HPL','L&G','L&T','SECURE','UTL'];
  TextEditingController _meterserialo = TextEditingController();
    String? newmeterctratio ='SELECT';
  final List<String> detailsnewmeterctratio =['SELECT','-/1A','5/5A','10/5A','20/5A','40/5A','60/5A','75/5A','100/1A','200/1A','200/5A','125/5A'];
    String? newmeterptratio='SELECT';
  final List<String> newmeterdetailsptratio =['SELECT','-/110V','11KV/110V','33KV/110V','132KV/110V'];

    TextEditingController _newmetermf = TextEditingController();

    String? newmeterwaranty='SELECT';
  final List<String> detailsnewmeterwaranty =['SELECT','WGP','RGP','BGP'];
      TextEditingController _newmeterpono = TextEditingController();
            TextEditingController _newmeterpomonthyear = TextEditingController();

  // NEW METER READING DETAILS
  bool _newmeterdetails=false;
  String? newsatisfactory='SELECT';
  final List<String> newmetersatisfactory=['SELECT','YES','No'];

  //REMARKS

   TextEditingController _remarks = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
  onPressed: () {
    Navigator.pop(context);
  },
  icon: Icon(
    Icons.arrow_back,
    color: Colors.black,
    size: 30,
  ),),
        backgroundColor: const Color.fromARGB(255, 248, 50, 39),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              'HT Meters',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
Text(
  selectedWork ?? 'Cable Change',
  style: TextStyle(fontSize: 16),
),
       ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [

         //  SECTION DETAILS
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80),
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
                          const SizedBox(height: 4),
                      const Text('Select Date of inspection',
                      style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                      SizedBox(
                        height: 4,
                      ),
                     TextField(
                    controller: _dateController,
                    readOnly: true, // prevents keyboard from showing
                    onTap: () {
                      _selectDate(context); // shows calendar
                    },
                    decoration: InputDecoration(
                      labelText: _dateController.text.isEmpty ? "TAP HERE" : null,
                    ),
                  ),
                           const SizedBox(height: 4),
                      const Text('NATURE OF PREMISES',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                      SizedBox(
                        height: 4,
                      ),
                      DropdownButton<String>(
                        isExpanded: true,
                        value: premises,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: (section != null && section !='SELECT')  
                       ? selectpremises.map((String newpremises){
                          return DropdownMenuItem(
                            value: newpremises,
                            child: Text(newpremises));
                        }).toList() :[],
                         onChanged:
                         (section != null && section !='SELECT') 
                          ? (String? updatepremises){
                          setState(() {
                            premises=updatepremises;
                          });
                         }:null),
                       
            ],
          ),
        ),
            ),

            ////SERVICE DETAILS

                SizedBox(
                          height: 12,
                         ),
                         Card(
  elevation: 5,
  child: Padding(
    padding: const EdgeInsets.all(12.0), // uniform padding
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'SERVICE DETAILS',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Divider(),
        SizedBox(height: 8),

        /// SERVICE NO label
        Text(
          'SERVICE NO',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),

        /// Dropdown + Search Icon
        Row(
          children: [
            Expanded(
              child: DropdownButton<String>(
                value: service,
                isExpanded: true,
                items: serviceno.map((String showserviceno) {
                  return DropdownMenuItem(
                    value: showserviceno,
                    child: Text(showserviceno),
                  );
                }).toList(),
                onChanged: (String? updateno) {
                  setState(() {
                    service = updateno!;
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
                onPressed: () {},
                icon: Icon(Icons.search_rounded, size: 20, color: Colors.black87),
              ),
            ),
          ],
        ),

        SizedBox(height: 12),

        /// Reusable Info Row builder
        buildInfoRow('SC.NO/USCNO', 'HNK 439/HNK 439'),
        Divider(),
        buildInfoRow('NAME', 'M/S. VICTORIA RANI'),
        Divider(),
        buildInfoRow('CAT/MF', '1/2'),
        Divider(),
        buildInfoRow('DISTRIBUTION', 'IDA RAMAPUR(v)'),
        Divider(),
        buildInfoRow('CMD', '225.0'),
      ],
    ),
  ),
),

/// WORK DETAILS

SizedBox(
  height: 5,
),
Card(
  elevation: 5,

  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text('WORK DETAILS',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
        ),
          Divider(),
        SizedBox(height: 8),

        /// SERVICE NO label
        Text(
          'SELECT NATURE OF WORK',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
      DropdownButton<String>(
  isExpanded: true,
  value: selectedWork,
 // hint: Text("Select Work Detail"),
  items: workdetails.map((String detail) {
    return DropdownMenuItem(
      value: detail,
      child: Text(detail),
    );
  }).toList(),
  onChanged: (String? newValue) {
    setState(() {
      selectedWork = newValue;
    });
     
  },
),

      ],
    ),
  ),
),

///METER DETAILS AS PER EBS

SizedBox(
  height: 5,
),
Card(
  elevation: 5,

  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text('METER DETAILS AS PER EBS',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
        ),
          Divider(),
        SizedBox(height: 8),

        /// SERVICE NO label
        Text(
          'METER MAKE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        DropdownButton( 
          isExpanded: true,
          value: make,
          items: metermake.map((String allmeter){
            return DropdownMenuItem(
              value: allmeter,
              child: Text(allmeter));
          }).toList(), 
          onChanged: (String? displymeter){
            setState(() {
              make=displymeter;
            });
          }),
           SizedBox(height: 8),

        /// SERVICE NO label
        Text(
          'METER SERAIL NO',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          controller: _METERSERIALNO,
        )

      ],
    ),
  ),
),

///METER DETAILS AS PER FIELD



SizedBox(
  height: 5,
),
Card(
  elevation: 5,

  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text('METER DETAILS AS PER  FIELD',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
        ),
          Divider(),
        SizedBox(height: 8),

        /// SERVICE NO label
        Text(
          'METER MAKE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        DropdownButton( 
          isExpanded: true,
          value: meterfield,
          items: meterfileddetails.map((String allmeterS){
            return DropdownMenuItem(
              value: allmeterS,
              child: Text(allmeterS));
          }).toList(), 
          onChanged: (String? displymeters){
            setState(() {
              meterfield=displymeters;
            });
          }),
           SizedBox(height: 8),
        Text(
          'METER SERAIL NO',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          controller: _METERSERIALNOfiled,
        ),
        SizedBox(height: 8),
        Text(
          'METER CT Ratio',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        DropdownButton( 
          isExpanded: true,
          value: meterct,
          items: meterctratio.map((String allct){
            return DropdownMenuItem(
              value: allct,
              child: Text(allct));
          }).toList(), 
          onChanged: (String? displayct){
            setState(() {
              meterct=displayct;
            });
          }),
           SizedBox(height: 8),
        Text(
          'METER PT Ratio',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        DropdownButton( 
          isExpanded: true,
          value: meterpt,
          items: meterptratio.map((String allpt){
            return DropdownMenuItem(
              value: allpt,
              child: Text(allpt));
          }).toList(), 
          onChanged: (String? displaypt){
            setState(() {
              meterpt=displaypt;
            });
          }),
        SizedBox(height: 8),
        Row(
  children: [
    Text(
      'METER MF',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    SizedBox(width: 60),
    Expanded( 
      child: TextField(
        controller: _METERMF,
      ),
    ),
  ],
), 
 SizedBox(height: 15),
        Text(
          'METER WARRANTY',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        DropdownButton( 
          isExpanded: true,
          value: waranty,
          items: meterwarranty.map((String allwaranty){
            return DropdownMenuItem(
              value: allwaranty,
              child: Text(allwaranty));
          }).toList(), 
          onChanged: (String? displywarrnty){
            setState(() {
              waranty=displywarrnty;
            });
          }),
          Text(
          'METER PO NO',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        TextField(
          controller: _METERpono,
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Text('PO MONTH YEAR(MM/YY)',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hint: Text('MM/YYYY',
                  textAlign: TextAlign.end,)
                ),
                controller: _pomonthyear,
               // keyboardType: TextInputType.numberWithOptions(),
              )),
          ],
        )
      ],
    ),
  ),
),

//// CTPT DETAILS

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
          child: Text('CTPT DETAILS',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
        ),
         Divider(),
        SizedBox(height: 8),
        Text(
          'CTPT MAKE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        DropdownButton( 
          isExpanded: true,
          value: ctptmake,
          items: detailsctptmake.map((String allctpt){
            return DropdownMenuItem(
              value: allctpt,
              child: Text(allctpt));
          }).toList(), 
          onChanged: (String? displctpt){
            setState(() {
              ctptmake=displctpt;
            });
          }),
           SizedBox(height: 8),

        /// SERVICE NO label
        Text(
          'CTPT SERAIL NO',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          controller: _ctptserialno,
        ),
        SizedBox(height: 8),
        Text(
          'CTPT SAP EQUIPMENT NO',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 6,
        ),
        TextField(
          controller: _ctptsapequipmentno,
        ),
        SizedBox(height: 8),
        Text(
          'CT Ratio',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        DropdownButton( 
          isExpanded: true,
          value: ctratio,
          items: detailsctratio.map((String allctratio){
            return DropdownMenuItem(
              value: allctratio,
              child: Text(allctratio));
          }).toList(), 
          onChanged: (String? displctratio){
            setState(() {
              ctratio=displctratio;
            });
          }),
           SizedBox(height: 8),
        Text(
          'PT Ratio',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        DropdownButton( 
          isExpanded: true,
          value: ptratio,
          items: detailsptratio.map((String allptratio){
            return DropdownMenuItem(
              value: allptratio,
              child: Text(allptratio));
          }).toList(), 
          onChanged: (String? displptratio){
            setState(() {
              ptratio=displptratio;
            });
          }),
          SizedBox(
            height: 8,
          ),
      ],
    ),
  ),
),

/// METER READING DETAILS


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
            'METER READING DETAILS',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Divider(),
        SizedBox(height: 4),
        Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _showdata = !_showdata;
                });
              },
              child: Icon(
                _showdata ? Icons.check_box : Icons.check_box_outline_blank,
                color: _showdata ? Colors.blue : Colors.grey,
                size: 25,
              ),
            ),
            SizedBox(width: 3),
            Text('SOLAR METER'),
          ],
        ),

        SizedBox(height: 10),

        // ✅ If checkbox is selected, show solar meter data only
        
         if (_showdata) ...[
          buildMeterRow('IMPORT KWH'),
          buildMeterRow('EXPORT KWH'),
          buildMeterRow('IMPORT KVAH'),
          buildMeterRow('EXPORT KVAH'),
          buildMeterRow('IMPORT MD'),
          buildMeterRow('EXPORT MD'),
          buildMeterRow('TOD 1 KVAH'),
          buildMeterRow('KWH ERROR %'),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'METER SATISFACTORY',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 1,
                child: DropdownButton(
                  isExpanded: true,
                  value: satisfactory,
                  items: metersatisfactory.map((String allsatisfactory) {
                    return DropdownMenuItem<String>(
                      value: allsatisfactory,
                      child: Text(allsatisfactory),
                    );
                  }).toList(),
                  onChanged: (String? updatesatisfactory) {
                    setState(() {
                      satisfactory = updatesatisfactory;
                    });
                  },
                ),
              ),
            ],
          ),
        ],

        // ✅ If checkbox is not selected, show regular meter details
        if (!_showdata) ...[
          buildmeterreadingdetails('KWH'),
          buildmeterreadingdetails('KVAH'),
          buildmeterreadingdetails('MD'),
          buildmeterreadingdetails('TOD 1 KVAH'),
          buildmeterreadingdetails('KWH ERROR %'),
          SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'METER SATISFACTORY',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 1,
                child: DropdownButton(
                  isExpanded: true,
                  value: satisfactory,
                  items: metersatisfactory.map((String allsatisfactory) {
                    return DropdownMenuItem<String>(
                      value: allsatisfactory,
                      child: Text(allsatisfactory),
                    );
                  }).toList(),
                  onChanged: (String? updatesatisfactory) {
                    setState(() {
                      satisfactory = updatesatisfactory;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ],
    ),
  ),
),

//NEW METER  DETAILS
SizedBox(
  height: 6,
),
Visibility(
    visible: selectedWork!= null && selectedWork!.contains("Replaced"),

  child: Column(
    children: [
      Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text('NEW METER DETAILS',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
              ),
               Divider(),
              SizedBox(height: 8),
              Text(
                'NEW METER MAKE ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              DropdownButton( 
                isExpanded: true,
                value: newmetermake,
                items: detailsnewmetermake.map((String newmeterdetails){
                  return DropdownMenuItem(
                    value: newmeterdetails,
                    child: Text(newmeterdetails));
                }).toList(), 
                onChanged: (String? displynewdetails){
                  setState(() {
                    newmetermake=displynewdetails;
                  });
                }),
                 SizedBox(height: 8),
              Text(
                'METER SERAIL NO',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _METERSERIALNO,
              ),
              SizedBox(height: 8),
              Text(
                'METER CT Ratio',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
               SizedBox(height: 8),
              DropdownButton( 
                isExpanded: true,
                value: newmeterctratio,
                items: detailsnewmeterctratio.map((String newctdetails){
                  return DropdownMenuItem(
                    value: newctdetails,
                    child: Text(newctdetails));
                }).toList(), 
                onChanged: (String? displynewctdetails){
                  setState(() {
                    newmeterctratio=displynewctdetails;
                  });
                }),
                SizedBox(height: 8),
              Text(
                'METER PT Ratio',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
               SizedBox(height: 8),
              DropdownButton( 
                isExpanded: true,
                value: newmeterptratio,
                items: newmeterdetailsptratio.map((String newptdetails){
                  return DropdownMenuItem(
                    value: newptdetails,
                    child: Text(newptdetails));
                }).toList(), 
                onChanged: (String? displynewptdetails){
                  setState(() {
                    newmeterptratio=displynewptdetails;
                  });
                }),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('METER MF',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: _METERMF,
                      ))
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Text('METER WARRANTY',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                       SizedBox(height: 8),
              DropdownButton( 
                isExpanded: true,
                value: newmeterwaranty,
                items: detailsnewmeterwaranty.map((String showwaranty){
                  return DropdownMenuItem(
                    value: showwaranty,
                    child: Text(showwaranty));
                }).toList(), 
                onChanged: (String? displywaranty){
                  setState(() {
                    newmeterwaranty=displywaranty;
                  });
                }),
                SizedBox(
                  height: 6,
                ),
                Text('METER PO NO',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                      SizedBox(
                        height: 6,
                      ),
                      TextField(
                        controller: _newmeterpono,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
        children: [
          Text(
            'PO MONTH YEAR(MM/YY)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10), // Add spacing
          Expanded(
            child: TextField(
              controller: _newmeterpomonthyear,
              decoration: InputDecoration(
                hint: Text('DD/YYY',
                textAlign: TextAlign.end,),
              ),
            ),
          ),
        ],
      )   
            ],
          ),
        ),
      ),
      
SizedBox(
  height: 10,
),
Card(
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'NEW METER READING DETAILS',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Divider(),
        SizedBox(height: 4),

        // Checkbox Row
        Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _newmeterdetails = !_newmeterdetails;
                });
              },
              child: Icon(
                _newmeterdetails ? Icons.check_box : Icons.check_box_outline_blank,
                color: _newmeterdetails ? Colors.blue : Colors.grey,
                size: 25,
              ),
            ),
            SizedBox(width: 3),
            Text('SOLAR METER'),
          ],
        ),

        SizedBox(height: 10),

        // ✅ If checkbox is selected, show solar meter data only
        if (_newmeterdetails) ...[
          buildnewMeterRow('IMPORT KWH'),
          buildnewMeterRow('EXPORT KWH'),
          buildnewMeterRow('IMPORT KVAH'),
          buildnewMeterRow('EXPORT KVAH'),
          buildnewMeterRow('IMPORT MD'),
          buildnewMeterRow('EXPORT MD'),
          buildnewMeterRow('TOD 1 KVAH'),
          buildnewMeterRow('KWH ERROR %'),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'METER SATISFACTORY',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.indigo
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: DropdownButton(
                  isExpanded: true,
                  value: satisfactory,
                  items: metersatisfactory.map((String allsatisfactory) {
                    return DropdownMenuItem<String>(
                      value: allsatisfactory,
                      child: Text(allsatisfactory),
                    );
                  }).toList(),
                  onChanged: (String? updatesatisfactory) {
                    setState(() {
                      satisfactory = updatesatisfactory;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
        // ✅ If checkbox is not selected, show regular meter details
        if (!_newmeterdetails) ...[
          buildnewmeterreadingdetails('KWH'),
          buildnewmeterreadingdetails('KVAH'),
          buildnewmeterreadingdetails('MD'),
          buildnewmeterreadingdetails('TOD 1 KVAH'),
          buildnewmeterreadingdetails('KWH ERROR %'),
          SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'METER SATISFACTORY',
                  style: TextStyle(fontWeight: FontWeight.bold,
                 color:Colors.indigo
                 ),
                ),
                
              ),
              Expanded(
                flex: 1,
                child: DropdownButton(
                  isExpanded: true,
                  value: newsatisfactory,
                  items: newmetersatisfactory.map((String allsatisfactorys) {
                    return DropdownMenuItem<String>(
                      value: allsatisfactorys,
                      child: Text(allsatisfactorys),
                    );
                  }).toList(),
                  onChanged: (String? updatesatisfactorys) {
                    setState(() {
                      newsatisfactory = updatesatisfactorys;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ],
    ),
  ),
),
    ],
  ),
),

//NEW METER READING DETAILS
SizedBox(
  height: 6,
),

// REMARKS

Card(
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text('REMARKS',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
        ),
        Divider(),
        SizedBox(
          height: 6,
        ),
        Text('REMARKS',
        style: TextStyle(
           fontWeight: FontWeight.bold ,
         color:  Colors.indigo
        ),),
        SizedBox(
          height: 6,
        ),
        TextField(
          controller: _remarks,
  decoration: InputDecoration(
    hintText: 'Enter remarks...',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
  ),
  minLines: 5, // Minimum height (like 4 lines tall)
  maxLines: null, // Allows it to grow if needed
  keyboardType: TextInputType.multiline,
),
  ],
    ),
  ),
),
SizedBox(
  height: 10,
),
SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 38, 26, 205),
      foregroundColor: Colors.white
    ),
    
    onPressed: (){}, 
  child: Text('SUBMIT',
  style: TextStyle(
    fontWeight: FontWeight.bold
  ),)),
)
   ],
    ),
    ),
    ),
      
   );     
  }
  Widget buildInfoRow(String label, String value) {
  return Row(
    children: [
      /// Label (left-aligned)
      Expanded(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),

      /// Vertical line
      Container(
        height: 20,
        width: 1,
        color: Colors.grey,
      ),
      SizedBox(
        width: 10,
      ),

      /// Value (right-aligned)
      Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    ],
  );
}
Widget buildMeterRow(String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold,
           // color: Colors.indigo
         
            ),
          ),
        ),
        SizedBox(width: 40),
        Expanded
        (
          flex: 1,
          child: TextField()),
      ],
    ),
  );
}
Widget buildmeterreadingdetails(String label){
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Text(label,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        
      ),)),
      Expanded(
        flex: 1,
        child: TextField())
    ],

  );
}
Widget buildnewMeterRow(String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.indigo,
            ),
          ),
        ),
        SizedBox(width: 40),
        Expanded
        (
          flex: 1,
          child: TextField()),
      ],
    ),
  );
}
Widget buildnewmeterreadingdetails(String label){
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Text(label,
      style: TextStyle(
       color: Colors.indigo,
        fontWeight: FontWeight.bold
      ),)),
      Expanded(
        flex: 1,
        child: TextField())
    ],

  );
}
}
