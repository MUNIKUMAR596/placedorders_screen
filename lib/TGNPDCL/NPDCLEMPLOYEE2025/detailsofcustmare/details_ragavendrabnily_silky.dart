import 'package:flutter/material.dart';

class DetailsRagavendrabnilySilky extends StatelessWidget {
  const DetailsRagavendrabnilySilky({super.key});

  @override
  Widget build(BuildContext context) {

    bool _isNumeric(String str) {
  String trimmed = str.trim();
  return trimmed.length > 4 &&
      RegExp(r'^-?[\d\s/.-]+$').hasMatch(trimmed) &&
      RegExp(r'\d').hasMatch(trimmed); // ensures at least one digit
}


  var details=['ID','EMP ID','DESIGNATION','DATE','CIRCLE','DIVISION','SUBDIVISION','SECTION','NATURE OF WORK','NATURE OF COMPLAINT',
  'SC NO','USCNO','SERVICE NAME','CAT','CMD'];
  var data=['CTMT20250803003897','4005251','AAE','03/Aug/2025 11:20','HANAMKONDA','HANAMKONDA TOWN','KAZIPET','MADIKONDA','PERIODICAL','NO_COMPLAINTS',
  '22 73 04806','13088584','M/S.A.N.REDDY SEEDS','3','30.0'];

  var meterdetails=['MAKE','SL.NO','CT RATIO','PO NO','PO MONTH/YEAR'];
  var meterdetialsdata=['UTL','apn00012','200/5A',"3894",'07/12'];

  var meterreadings=['METER KWH','METER KVAH','METER MD'];
  var meterreadingsdata=['445551.0','465599.0','15.2'];

  var existingoldsolarmeter=['IMPORT KWH','EXPORT KWH','IMPORT KVAH','EXPORT KVAH','EXPORT MD','IMPORT MD','KWH ERROR %','SATISFIED'];
  var existingoldsolarmeterdata=['0.0','0.0','0.0','0.0','0.0','0.0','1.52','Yes'];

  var newmeterdetails=['NEW METER MAKE','NEW METER SL NO','NEW METER CT RATIO','NEW METER PO NO','NEW METER PO DATE','NEW METER KWH',
  'NEW METER KVAH','NEW METER MD','NEW METER KWH ERROR %'];
  var newmeterdetailsdata=['00','NULL','00','NULL','NULL','0.0','0.0','0.0','NULL'];

  var newsolarmeter=['NEW METER IMPORT KWH','NEW METER EXPORT KWH','NEW METER EXPORT KVAH','NEW METER EXPORT KVAH',
  'NEW METER EXPORT MD','NEW METER IMPORT MD'];
  var newsolarmeterdata=['0.0','0.0','0.0','0.0','0.0','0.0',];

  var testreport=['LAT','LON','NEW METER SATISFACTORY','MONTH YEAR','IS OLD METER SOLAR?','NEW METER SOLAR?','REMARKS','AREA CODE',
  'AREA NAME','NEW CON. REG NUM','OLD METER WARRANTY','NEW METER WARRANTY','INSPECTION DATE','COMPLAINT-2','COMPLAINT-3','MAKE AS PER EBS','SL NO AS PER EBS'];
  var testreportdata=['17.9876033','79.5438','Yes','082025','N','N','NULL','12126',
  'MADIKONDA','NULL','BGP','NULL','02/08/2025','NA','NA','NULL','APE551177'];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon( Icons.arrow_back,color: Colors.white,)),
        backgroundColor: const Color.fromARGB(255, 30, 172, 155),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CTMT20250803003896',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
            Text('M/S RAGAVENDRA BINNY SILKY ',style: TextStyle(color: Colors.white,fontSize: 14),)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ...List.generate(data.length, (index){
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Expanded(               
                          child: Text(details[index],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),)),
                          Container(
                            width: 1,
                            height: 20,
                            color: Colors.grey,
                          ),                    
                          Expanded(
                            child: Text(data[index],
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: _isNumeric(data[index]) ? Colors.pink : Colors.black,
                              fontWeight: FontWeight.bold,
                             fontSize: 13),))
                      ],
                    ),
                  ),
                  
                  Divider(thickness: 1,),
                  SizedBox(height: 15,)

                ],
              );
            }),
            
            Container(
              width: double.infinity,
              color:const Color.fromARGB(255, 204, 200, 200),
              height: 40,
              child: Center(
                child: Text('EXISTING METER DETAILS',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),),
              ),
            ),
            SizedBox(height: 6,),
            ...List.generate(meterdetails.length, (index){
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Expanded(child: Text(meterdetails[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),)),
                        Container(
                              width: 1,
                              height: 20,
                              color: Colors.grey,
                            ),
                            Expanded(child: Text(meterdetialsdata[index],
                            textAlign: TextAlign.end,
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))
                      ],
                    ),
                  ),
                  Divider(thickness: 1,),
                  SizedBox(height: 10,)
                ],
              );
            }),
            Container(
              width: double.infinity,
              color:const Color.fromARGB(255, 204, 200, 200),
              height: 40,
              child: Center(
                child: Text('EXISTING METER READINGS',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),),
              ),
            ),
            SizedBox(height: 2,),
            ...List.generate(meterreadings.length, (index){
              return Column(
                children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5),
                     child: Row(
                      children: [
                        Expanded(child: Text(meterreadings[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),)),
                        Container(
                              width: 1,
                              height: 20,
                              color: Colors.grey,
                            ),
                            Expanded(child: Text(meterreadingsdata[index],
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color:_isNumeric(meterreadingsdata[index]) ? Colors.pink : Colors.black,
                              fontWeight: FontWeight.bold),))
                      ],
                                       ),
                   ),
                  Divider(thickness: 1,),
                  SizedBox(height: 10,)

                ],
              );
            }),
            Container(
              width: double.infinity,
              color:const Color.fromARGB(255, 204, 200, 200),
              height: 40,
              child: Center(
                child: Text('EXISTING/OLD SOLAR METER',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),),
              ),
            ),
            SizedBox(height: 2,),
            ...List.generate(existingoldsolarmeter.length, (index){
              return Column(
                children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5),
                     child: Row(
                      children: [
                        Expanded(child: Text(existingoldsolarmeter[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),)),
                        Container(
                              width: 1,
                              height: 20,
                              color: Colors.grey,
                            ),
                            Expanded(child: Text(existingoldsolarmeterdata[index],
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),))
                      ],
                                       ),
                   ),
                  Divider(thickness: 1,),
                  SizedBox(height: 10,)

                ],
              );
            }),
             Container(
              width: double.infinity,
              color:const Color.fromARGB(255, 204, 200, 200),
              height: 40,
              child: Center(
                child: Text('NEW METER DETAILS',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),),
              ),
            ),
            SizedBox(height: 2,),
            ...List.generate(newmeterdetails.length, (index){
              return Column(
                children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5),
                     child: Row(
                      children: [
                        Expanded(child: Text(newmeterdetails[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),)),
                        Container(
                              width: 1,
                              height: 20,
                              color: Colors.grey,
                            ),
                            Expanded(child: Text(newmeterdetailsdata[index],
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),))
                      ],
                                       ),
                   ),
                  Divider(thickness: 1,),
                  SizedBox(height: 10,)

                ],
              );
            }),
             Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 204, 200, 200),
              height: 40,
              child: Center(
                child: Text('NEW SOLAR METER',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),),
              ),
            ),
            SizedBox(height: 2,),
            ...List.generate(newsolarmeter.length, (index){
              return Column(
                children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5),
                     child: Row(
                      children: [
                        Expanded(child: Text(newsolarmeter[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),)),
                        Container(
                              width: 1,
                              height: 20,
                              color: Colors.grey,
                            ),
                            Expanded(child: Text(newsolarmeterdata[index],
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),))
                      ],
                                       ),
                   ),
                  Divider(thickness: 1,),
                  SizedBox(height: 10,)

                ],
              );
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text('TEST REPORT',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(height: 6,),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey,
              child: Center(
                child:Text('image is Here') ,),
            ),
            ...List.generate(testreport.length, (index){
              return Column(
                children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5),
                     child: Row(
                      children: [
                        Expanded(child: Text(testreport[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),)),
                        Container(
                              width: 1,
                              height: 20,
                              color: Colors.grey,
                            ),
                            Expanded(child: Text(testreportdata[index],
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color:_isNumeric(testreportdata[index]) ? Colors.pink : Colors.black,
                              fontWeight: FontWeight.bold),))
                      ],
                                       ),
                   ),
                  Divider(thickness: 1,),
                  SizedBox(height: 10,)

                ],
              );
            }),
            ],
          ),
        ),
      ),
    );
  }
}