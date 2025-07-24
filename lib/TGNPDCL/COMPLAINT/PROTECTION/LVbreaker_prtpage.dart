import 'package:flutter/material.dart';

class LvbreakerPrtpage extends StatefulWidget {
  const LvbreakerPrtpage({super.key});

  @override
  State<LvbreakerPrtpage> createState() => _LvbreakerPrtpageState();
}

class _LvbreakerPrtpageState extends State<LvbreakerPrtpage> {
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
            Text('#PRT20250723002622',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
            SizedBox(
              height: 3,
            ),
            Text('LV BREAKER',
            style: TextStyle(
              fontSize: 15,
            color:const Color.fromARGB(255, 239, 232, 232)
            ),)
          ],
        ),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildlv('ID','PRT20250723002622'),
              Divider(
              ),
              buildlv('CIRCLE','HANAMKONDA'),
              Divider(),
               buildlv('DESIGNATION','AAE'),
              Divider(),
               buildlv('DIVISION','HANAMKONDA TOWN'),
              Divider(),
               buildlv('SECTION','CHOWRASTHA/HNK'),
              Divider(),
               buildlv('SUBDIVISION','HANAMKONDA'),
              Divider(),
               buildlv('EMP ID','4005853'),
              Divider(),
               buildlv('DATE','23/JUL/2025 13:58'),
              Divider(),
               buildlv('LAT','NULL'),
              Divider(),
               buildlv('LON','NULL'),
              Divider(),
               buildlv('NATURE OF COMPLAINT','BATTERY'),
              Divider(),
               buildlv('NATURE OF WORK 1','NA'),
              Divider(),
              buildlv('NATURE OF WORK 2','NA'),
              Divider(),
              buildlv('SS CODE','NA'),
              Divider(),
              buildlv('SS NAME','NA'),
              Divider(),
              buildlv('FEEDER NAME','NULL'),
              Divider(),
              buildlv('FEEDER CODE','NULL'),
              SizedBox(height: 5,),
              Container(
                width: double.infinity,
                height: 40,
                color: const Color.fromARGB(255, 198, 196, 196),
                child: Center(
                  child: Text('BREAK DETAILS',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              buildbreakdetails('TYPE','LV BREAKER'),
              Divider(),
              buildbreakdetails('MAKE','CGL'),
              Divider(),
              buildbreakdetails('SL.NO','49607'),
              Divider(),
              buildbreakdetails('YEAR MFD','2013'),
              Divider(),
               buildbreakdetails('BATTERY CHARGER CONDITION','OK'),
              Divider(),
               buildbreakdetails('BATTERY TRIP','OK'),
              Divider(),
              buildbreakdetails('BATTERY CLOSE','OK'),
              Divider(),
              buildbreakdetails('VCB MECHANISM STATUS','OK'),
              Divider(),
              buildbreakdetails('POLE ASSEMBLY STATUS','OK'),
              Container(
                width: double.infinity,
                height: 40,
                color: const Color.fromARGB(255, 198, 196, 196),
                child: Center(
                  child: Text('RELAY & CT DETAILS',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              Relayctdetails('RELAY TYPE','IED RELAY'),
              Divider(),
              Relayctdetails('RELAY TEST CONDITION','YES'),
              Divider(),
              Relayctdetails('RELAY WORKING STATUS','OK'),
              Divider(),
              Relayctdetails('AVAILABLE CT RATIO','600-300/1-lA'),
              Divider(),
              Relayctdetails('CONNECTED CT RATIO','300/1A'),
              Divider(),
              Relayctdetails('CTS WORKING STATUS','OK'),
              Divider(),
              Relayctdetails('PRIMARY INJECTION CONDITION','NULL'),
              Divider(),
              Relayctdetails('VCB EQUIPMENT NO','CGL-49607'),
              Divider(),
              Relayctdetails('DATE OF FAILURE','NULL'),
              Divider(),
              Relayctdetails('DATE OF RECTIFICATION','23/JUL/2025 13:58'),
              Divider(),
              Relayctdetails('REMARKS 1','2nos batteries replaced'),
              Divider(),
              SizedBox(
                height: 5,
              ),
              Text('TEST REPORT'),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  //padding: EdgeInsets.all(50),
                  color: Colors.grey,
                  width: double.infinity,
                  height: 200,
                  child: Center(child: Text('image is here')),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              testreport('MONTH YEAR','072025'),
              Divider(),
              testreport('INSPECTION DATE','23/07/2025'),
              Divider(),
              testreport('VCB MAKE AS PER EBS','CGL'),
              Divider(),
              testreport('VCB SLNO AS PER EBS','49607'),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildlv (String labellv ,String datalv){
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(labellv,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15
          ),
          )
        ),
        Container(
          height: 35,
          width: 1,
          color: Colors.grey,
        ),
        Expanded(
          flex: 1,
          child: Align(
              alignment: Alignment.centerRight,
            child: Text(datalv,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
              fontWeight: FontWeight.bold
            ),),
          )),
      ],
    );
  }
  Widget buildbreakdetails (String labelbreak ,String databreak){
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(labelbreak,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15
          ),
          )
        ),
        Container(
          height: 35,
          width: 1,
          color: Colors.grey,
        ),
        Expanded(
          flex: 1,
          child: Align(
              alignment: Alignment.centerRight,
            child: Text(databreak,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
              fontWeight: FontWeight.bold
            ),),
          )),
      ],
    );
  }
   Widget  Relayctdetails (String labelrelay ,String datarelay){
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(labelrelay,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15
          ),
          )
        ),
        Container(
          height: 35,
          width: 1,
          color: Colors.grey,
        ),
        Expanded(
          flex: 1,
          child: Align(
              alignment: Alignment.centerRight,
            child: Text(datarelay,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
              fontWeight: FontWeight.bold
            ),),
          )),
      ],
    );
  }
  Widget  testreport (String labeltestreprt ,String datatestreport){
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(labeltestreprt,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15
          ),
          )
        ),
        Container(
          height: 35,
          width: 1,
          color: Colors.grey,
        ),
        Expanded(
          flex: 1,
          child: Align(
              alignment: Alignment.centerRight,
            child: Text(datatestreport,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
              fontWeight: FontWeight.bold
            ),),
          )),
      ],
    );
  }
}