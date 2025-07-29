import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class MonthYearInputFormatter extends TextInputFormatter{
  @override
  TextEditingValue  formatEditUpdate(
    TextEditingValue oldvalue,
    TextEditingValue newvalue,
  ) {
    String text = newvalue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (text.length>6){
      text =  text.substring(0,6);
    }

      String formated='';
      if (text.length>=2){
        formated = text.substring(0,2);
        if (text.length >2){
          formated +='/' + text.substring(2); 
        }
        } else{
          formated=text;
        }
        return TextEditingValue(
          text: formated,
          selection: TextSelection.collapsed(offset: formated.length)
        );
      }
    }
    class newmonthyear extends TextInputFormatter{
      @override
      TextEditingValue formatEditUpdate(
        TextEditingValue oldvalue,
        TextEditingValue newdate,
      ){
        String textdate= newdate.text.replaceAll(RegExp((r'[^0-9]')), '');
        if(textdate.length > 6){
          textdate=textdate.substring(0,6);
        }
        String format='';
        if (textdate.length >= 2){
          format=textdate.substring(0,2);
        }
        if(textdate.length >2){
          format += '/' + textdate.substring(2);
        } else{
          format=textdate;
        }
        return TextEditingValue(
          text: format
        );
      }
    }
  


class HtmetersHtconvTosolar extends StatefulWidget {
  const HtmetersHtconvTosolar({super.key});

  @override
  State<HtmetersHtconvTosolar> createState() => HtMetersupdatesState();
}

class HtMetersupdatesState extends State<HtmetersHtconvTosolar> {
  
    TextEditingController _dateController = TextEditingController();
    

  // This method shows the calendar
  Future<void> _selectDate(BuildContext context) async {
  DateTime today = DateTime.now();

  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: today,                // 👈 Current date when picker opens
    firstDate: DateTime(1950),         // 👈 Earliest date allowed
    lastDate: today,                   // ✅ Block future dates (today is max)
  );

  if (pickedDate != null) {
    String formattedDate =
        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    setState(() {
      _dateController.text = formattedDate; // set selected date in TextField
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
 String? service = '12203-15116816517705';
  final List<String> serviceno = [
    '12203-15116816517705',
    '22 23 70791 15753842',
    '22 26 95604 15881233',
    'HNK391 HNK391',
    'HNK422 HNK422',
    'HNK313 HNK313',
    'HNK035 HNK035',
    'HNK172 HNK172',
    'HNK483 HNK483',
    'HNK095 HNK095',
  ];

    final List<String> _dataList = [
    "12203-151168(16517705) M/S DIRECTOR",
    "222370791(15753842) M/S Reliance Retall..",
    "222695604(15881233) M/S Katkuri Jaya",
    "HNK391(HNK391) M/S.MANIKANTA DEVELO..",
    "HNK422(HNK422) M/S.RAVIPATI VENKATES..",
    "HNK313(HNK313) M/S.RAVIPATI VENKATES..",
    "HNK035(HNK035) M/S DIRECTOR,",
    "HNK172(HNK172) M/S RELIANCE JIO INFOC..",
    "HNK483(HNK483) M/S.KAKATIYA INFRA",
    "HNK095(HNK095) M/S.ST.ANNS HOSPITALS..",
    "HNK190(HNK190) M/S HANMAKONDA CONS..",
    "HNK445(HNK445) M/S.EXECUTIVE ENGINEE..",
    "HNK466(HNK466) M/S.KAKATIYA INFRA",
  ];

  void _showSearchDialog() {
    TextEditingController _searchController = TextEditingController();
    List<String> _filteredData = List.from(_dataList);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog( 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.zero
              ),
              titlePadding: EdgeInsets.all(0),
              contentPadding: EdgeInsets.symmetric(horizontal: 6),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisSize: MainAxisSize.max,
                children: [
                  TextField( 
                    controller: _searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      hintText: 'Search CT Service',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _filteredData = _dataList
                            .where((item) =>
                                item.toLowerCase().contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                ],
              ),
              content: SizedBox(
                width: double.maxFinite,
                height: 500,
                child: ListView.builder(
                  itemCount: _filteredData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_filteredData[index]),
                      onTap: () {
                        // Optional: handle item tap
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  //METER DETAILS AS PER EBS
  String? make='HPL';
  final List<String> metermake=['HPL'];
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
// Custom Input Formatter: MM/YYYY





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



// NEW CTPT DETAILS
String? ctptmakenew='SELECT';
  final List<String> detailsctptmakenew =['SELECT','Vishal','GE Electrical', 'Vijay'];
  TextEditingController _ctptserialnonew = TextEditingController();
  TextEditingController _ctptsapequipmentnonew = TextEditingController();
  String? ctrationew='SELECT';
  final List<String> detailsctrationew =['SELECT','-/1A','5/5A','10/5A','20/5A','40/5A','60/5A','75/5A','100/1A','200/1A','200/5A','125/5A'];
    String? ptrationew='SELECT';
  final List<String> detailsptrationew =['SELECT','-/110V','11KV/110V','33KV/110V','132KV/110V'];

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
  'HT_CONV_HT_TO_SOLAR',
  style: TextStyle(fontSize: 16),
),
       ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
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
               onPressed: _showSearchDialog,

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
          readOnly: true,
          decoration: InputDecoration(
            hint: Text('TSN00673',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            
          ),
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
          maxLength: 5,
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
        maxLength: 5,
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
          maxLines: 2,
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
  controller: _pomonthyear,
  keyboardType: TextInputType.number,
  inputFormatters: [
    LengthLimitingTextInputFormatter(7), // Format is MM/YYYY
    MonthYearInputFormatter(),
  ],
  decoration: InputDecoration(
    hintText: 'MM/YYYY',
    hintStyle: TextStyle(color: Colors.grey),
   // border: OutlineInputBorder(),
  ),
),
            )
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
          maxLength: 24,
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
          maxLength: 15,
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
 Column(
   children: [
     Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('IMPORT KWH',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            
          ),)),
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                counterText: ''
              ),
              maxLength: 15,
            )
            )
        ],
     
      ),
       Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('EXPORT KWH',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            
          ),)),
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                counterText: ''
              ),
              maxLength: 2,
            )
            )
        ],
     
      ),
       Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('IMPORT KVAIH',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            
          ),)),
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                counterText: ''
              ),
              maxLength: 2,
            )
            )
        ],
     
      ),
       Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('EXPORT KVAIH',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            
          ),)),
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                counterText: ''
              ),
              maxLength: 2,
            )
            )
        ],
     
      ),
       Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('IMPORT MD ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            
          ),)),
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                counterText: ''
              ),
              maxLength: 2,
            )
            )
        ],
     
      ),
       Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('EXPORT MD',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            
          ),)),
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                counterText: ''
              ),
              maxLength: 2,
            )
            )
        ],
     
      ),
       Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('TOD 1 KVAH',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            
          ),)),
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                counterText: ''
              ),
              maxLength: 2,
            )
            )
        ],
     
      ),
      
      
   ],
 ),
        
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
          Column(
            children: [
              Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('KWH',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            
          ),)),
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                counterText: ''
              ),
              maxLength: 2,
            )
            )
        ],
     
      ),
       Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('KVAH',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            
          ),)),
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                counterText: ''
              ),
              maxLength: 15,
            )
            )
        ],
     
      ),
       Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('MD',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            
          ),)),
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                counterText: ''
              ),
              maxLength: 2,
            )
            )
        ],
     
      ),
       Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('TOD 1 KVAH',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            
          ),)),
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                counterText: ''
              ),
              maxLength: 2,
            )
            )
        ],
     
      ),
       Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('KWH ERROR % ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            
          ),)),
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                counterText: ''
              ),
              maxLength: 2,
            )
            )
        ],
      ),
            ],
          ),
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
Column(
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
              maxLength: 11,
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
                      maxLength: 5,
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
            inputFormatters: [
              newmonthyear()
            ],
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
  height: 6,
),
Card(
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(' NEW CTPT DETAILS',
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
          value: ctptmakenew,
          items: detailsctptmakenew.map((String allctptnew){
            return DropdownMenuItem(
              value: allctptnew,
              child: Text(allctptnew));
          }).toList(), 
          onChanged: (String? displctptnew){
            setState(() {
              ctptmakenew=displctptnew;
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
          controller: _ctptserialnonew,
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
          controller: _ctptsapequipmentnonew,
        ),
        SizedBox(height: 8),
        Text(
          'CT Ratio',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        DropdownButton( 
          isExpanded: true,
          value: ctrationew,
          items: detailsctrationew.map((String allctrationew){
            return DropdownMenuItem(
              value: allctrationew,
              child: Text(allctrationew));
          }).toList(), 
          onChanged: (String? displctrationew){
            setState(() {
              ctrationew=displctrationew;
            });
          }),
           SizedBox(height: 8),
        Text(
          'PT Ratio',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        DropdownButton( 
          isExpanded: true,
          value: ptrationew,
          items: detailsptrationew.map((String allptrationew){
            return DropdownMenuItem(
              value: allptrationew,
              child: Text(allptrationew));
          }).toList(), 
          onChanged: (String? displptrationew){
            setState(() {
              ptrationew=displptrationew;
            });
          }),
          SizedBox(
            height: 8,  
          ),
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
        Column(
          children: [
             Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'IMPORT KWH',
            style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.indigo,
            ),
          ),
        ),
        SizedBox(width: 40),
        Expanded
        (
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
              counterText: ''
            ),
            maxLength: 15,
          )),
      ],
    ),
     Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'EXPORT KWH',
            style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.indigo,
            ),
          ),
        ),
        SizedBox(width: 40),
        Expanded
        (
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
              counterText: ''
            ),
            maxLength: 2,
          )),
      ],
    ), Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'IMPORT KVAIH',
            style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.indigo,
            ),
          ),
        ),
        SizedBox(width: 40),
        Expanded
        (
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
              counterText: ''
            ),
            maxLength: 15,
          )),
      ],
    ), Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'EXPORT KVAIH',
            style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.indigo,
            ),
          ),
        ),
        SizedBox(width: 40),
        Expanded
        (
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
              counterText: ''
            ),
            maxLength: 15,
          )),
      ],
    ), Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'IMPORT MD',
            style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.indigo,
            ),
          ),
        ),
        SizedBox(width: 40),
        Expanded
        (
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
              counterText: ''
            ),
            maxLength: 15,
          )),
      ],
    ), Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'EXPORT MD',
            style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.indigo,
            ),
          ),
        ),
        SizedBox(width: 40),
        Expanded
        (
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
              counterText: ''
            ),
            maxLength: 15,
          )),
      ],
    ), Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'TOD 1 KVAH',
            style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.indigo,
            ),
          ),
        ),
        SizedBox(width: 40),
        Expanded
        (
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
              counterText: ''
            ),
            maxLength: 15,
          )),
      ],
    ),
          ],
        ),
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
        Column(
          children: [
             Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            ' KWH',
            style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.indigo,
            ),
          ),
        ),
        SizedBox(width: 40),
        Expanded
        (
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
              counterText: ''
            ),
            maxLength: 2,
          )),
      ],
    ), Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'KVAH',
            style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.indigo,
            ),
          ),
        ),
        SizedBox(width: 40),
        Expanded
        (
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
              counterText: ''
            ),
            maxLength: 15,
          )),
      ],
    ), Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'MD',
            style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.indigo,
            ),
          ),
        ),
        SizedBox(width: 40),
        Expanded
        (
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
              counterText: ''
            ),
            maxLength: 2,
          )),
      ],
    ), Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'TOD 1 KVAH',
            style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.indigo,
            ),
          ),
        ),
        SizedBox(width: 40),
        Expanded
        (
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
              counterText: ''
            ),
            maxLength: 2,
          )),
      ],
    ), Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'KWH ERROR %',
            style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.indigo,
            ),
          ),
        ),
        SizedBox(width: 40),
        Expanded
        (
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
              counterText: ''
            ),
            maxLength: 2,
          )),
      ],
    ),
          ],
        ),
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
}
