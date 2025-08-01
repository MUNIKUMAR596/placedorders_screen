import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MonthYearInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (text.length > 6) {
      text = text.substring(0, 6);
    }

    String formatted = '';
    if (text.length >= 2) {
      formatted = text.substring(0, 2);
      if (text.length > 2) {
        formatted += '/' + text.substring(2);
      }
    } else {
      formatted = text;
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}



class NewserviceHtmeters extends StatefulWidget {
  const NewserviceHtmeters({super.key});

  @override
  State<NewserviceHtmeters> createState() => _NewserviceHtmetersState();
}

class _NewserviceHtmetersState extends State<NewserviceHtmeters> {
   TextEditingController _newmeterpomonthyear = TextEditingController();

  Future<void> _showcalender(BuildContext context) async {
    DateTime? choosedate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());

    if (choosedate != null) {
      String dateformat =
          "${choosedate.day}/${choosedate.month}/${choosedate.year}";
      setState(() {
        _newmeterpomonthyear.text = dateformat;
         selection: TextSelection.collapsed(offset: dateformat.length);
      });
    }
  }

  // SECTION DETAILS
  String? division = 'SELECT';
  String? subdivision ='SELECT';
  String? section = 'SELECT';
  String? premises = 'SELECT';

  final List<String> selectdivision = [
    'SELECT',
    'HANAMKONDA TOWN',
    'HANAMKONDA RURAL'
  ];
  final List<String> selectsubdivision = [
    'SELECT',
    'KAZIPET',
    'HANAMKONDA',
    'NAYEEMNAGAR'
  ];
  final List<String> selecsection = [
    'SELECT',
    'NIT',
    'MADIKONDA',
    'KAZIPET',
    'KADIPIKONDA',
    'WADDEPALLY'
  ];
  final List<String> selectpremises = [
    'SELECT',
    'Consumer Service',
    'SubStation Service'
  ];
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

  bool _showdata = false;
  String? satisfactory='SELECT';
  final List<String> metersatisfactory=['SELECT','YES','No'];


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
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 248, 50, 39),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              'NEW_SERVICE',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Divider(),
                      const SizedBox(height: 2),
                      const Text(
                        'SELECT DIVISION',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
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
                          });
                        },
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'SELECT SUB DIVISION',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      DropdownButton<String>(
                        isExpanded: true,
                        value: subdivision,
                        hint: const Text("Select Sub Division"),
                        icon: const Icon(Icons.arrow_drop_down),
                        items: selectsubdivision.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            subdivision = newValue;
                          });
                        },
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'SELECT SECTION',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      DropdownButton<String>(
                        isExpanded: true,
                        value: section,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: selecsection.map((String newselection) {
                          return DropdownMenuItem(
                              value: newselection, child: Text(newselection));
                        }).toList(),
                        onChanged: (String? updateselected) {
                          setState(() {
                            section = updateselected;
                          });
                        },
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Select Date of Release',
                        style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                      ),
                      SizedBox(height: 4),
                      TextField(
                        controller: _newmeterpomonthyear,
                        readOnly: true,
                        onTap: () {
                          _showcalender(context);
                        },
                        decoration: InputDecoration(
                          labelText:
                              _newmeterpomonthyear.text.isEmpty ? "TAP HERE" : null,
                              labelStyle: TextStyle(
                                color: _newmeterpomonthyear.text.isEmpty ? Colors.red : null
                              )
                        ),
                        
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'NATURE OF PREMISES',
                        style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                      ),
                      SizedBox(height: 4),
                      DropdownButton<String>(
                        isExpanded: true,
                        value: premises,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: selectpremises.map((String newpremises) {
                          return DropdownMenuItem(
                              value: newpremises, child: Text(newpremises));
                        }).toList(),
                        onChanged: (String? updatepremises) {
                          setState(() {
                            premises = updatepremises;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height:30,
              ),
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
              maxLength: 45,
              controller: _meterserialo,
              decoration: InputDecoration(
                counterText: ''
              ),              
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
                      controller: _newmetermf,
                      decoration: InputDecoration(
                        counterText: '',
                      ),
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
                      maxLines: 1,
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
          child:TextField(
  controller: _newmeterpomonthyear,
  inputFormatters: [
    MonthYearInputFormatter()],
  keyboardType: TextInputType.number,
  decoration: InputDecoration(
    hintText: 'MM/YYYY', // Use hintText instead of hint
    hintStyle: TextStyle(color: Colors.grey),
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text('REGISTRATION DETAILS',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),),
            ),
            Divider(),
            Text('REG NUMBER',
            style: TextStyle(
              color: const Color.fromARGB(255, 216, 3, 3),           
            ),),
            SizedBox(
              height: 6,
            ),
            TextField(
              decoration: InputDecoration(
                counterText: ''
              ),
              maxLength: 42,
            ),
            SizedBox(
              height: 2,
            ),Text('SERVICE NAME',
            style: TextStyle(
              color: const Color.fromARGB(255, 216, 3, 3),
            ),),
            SizedBox(
              height: 6,
            ),
            TextField(
              maxLength: 10,
              decoration: InputDecoration(
                counterText: ''
              ),
            ),
              SizedBox(
              height: 2,
            ),Text('LOAD(KW)',
            style: TextStyle(
              color: const Color.fromARGB(255, 216, 3, 3),
            ),),
            SizedBox(
              height: 6,
            ),
            TextField(
              maxLength: 10,
              decoration: InputDecoration(
                counterText: ''
              ),
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
          maxLength: 27,
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
          maxLength: 15,
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
  child: ElevatedButton(onPressed: (){}, 
  
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero
    ),
  ),
  
  child: Text('SUBMIT')),
)
         ],
          ),
        ),
      ),
    );
  }
}
