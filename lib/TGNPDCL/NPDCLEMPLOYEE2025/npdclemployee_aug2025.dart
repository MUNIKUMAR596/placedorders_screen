import 'package:flutter/material.dart';
import 'package:purchase_orderscreen/TGNPDCL/NPDCLEMPLOYEE2025/detailsofcustmare/details_ragavendrabnily_silky.dart';
import 'package:purchase_orderscreen/TGNPDCL/NPDCLEMPLOYEE2025/detailsofcustmare/s_anreedyseeds.dart';

class NpdclemployeeAug2025 extends StatefulWidget {
  const NpdclemployeeAug2025({super.key});

  @override
  State<NpdclemployeeAug2025> createState() => _NpdclemployeeAug2025State();
}

class _NpdclemployeeAug2025State extends State<NpdclemployeeAug2025> {
  bool _isNumeric(String str) {
  return RegExp(r'^[\d\s/-]+$').hasMatch(str.trim());
}
var details=['NATURE OF WORK','SCNO','NAME',"SECTION"];
var detailsdata=['PERIODICAL','22 7304806/13088584','M/S A.N REDDY SEEDS','MADIKONDA'];
var detailsdata1=['PERIODICAL','22 7302704/13088506','M/S RAGAVENDRA BINNY SILKY','MADIKONDA'];
var detailsdata2=['PERIODICAL','22 7302304/13088493','M/S.SRI VENKATESHWARA','MADIKONDA'];
var detailsdata3=['PERIODICAL','12806-139038/1610 986','SSS COIR INDUSTRIES','MADIKONDA'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon( Icons.arrow_back,color: Colors.white,)),
        backgroundColor: const Color.fromARGB(255, 30, 172, 155),
        title: Row(
          children: [
            Text('NPDCL EMPLOYEE',
            style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15
            ),),
            SizedBox(width: 70,),
            Text('AUG 2025',
                  style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12
            ),)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text('#CTMT20250803003897(03/08/2025)',
                            style: TextStyle(color: Colors.indigo,
                            fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 6,),
                          ...List.generate(details.length, (index){
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    children: [
                                      Expanded(child: Text(details[index],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                      ),)),
                                      Container(
                                        width: 1,
                                        height: 25,
                                        color: Colors.grey,
                                      ),
                                      Expanded(child: Text(detailsdata[index],
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        color: _isNumeric(detailsdata[index]) ? Colors.pink :Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13
                                      ),)),                                
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Divider(thickness: 1,)
                              ],
                            );
                          })       
                         ],
                      ),
                    ),
                    Positioned(
                      right: 1,top: 0,bottom: 0,
                      child: IconButton(onPressed: (){
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) => detailsanreedyseeds()));
                      }, 
                      icon: Icon(Icons.navigate_next_sharp,color: Colors.black,size: 20,)))                        
                  ],
                ),
              ),
              SizedBox(height: 6,),
               Card(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text('#CTMT20250803003896(03/08/2025)',
                            style: TextStyle(color: Colors.indigo,
                            fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 6,),
                          ...List.generate(details.length, (index){
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    children: [
                                      Expanded(child: Text(details[index],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                      ),)),
                                      Container(
                                        height: 25,
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                      Expanded(
                                        child: Text(detailsdata1[index],
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: _isNumeric(detailsdata1[index]) ? Colors.pink : Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13
                                        ),))                                     
                                    ],
                                  ),
                                  
                                ),
                                SizedBox(height: 10,),
                                Divider()
                              ],
                            );
                          })                              
                        ],
                      ),
                    ),
                    Positioned(
                      right: 1,top: 0,bottom: 0,
                      child: IconButton(onPressed: (){
                        Navigator.push(context,
                         MaterialPageRoute(builder: (context)=> DetailsRagavendrabnilySilky()));
                      }, 
                      icon: Icon(Icons.navigate_next_sharp,color: Colors.black,size: 20,)))                        
                  ],
                ),
              ),
               SizedBox(height: 6,),
               Card(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text('#CTMT20250803003895(03/08/2025)',
                            style: TextStyle(color: Colors.indigo,
                            fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 6,),
                          ...List.generate(details.length, (index){
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    children: [
                                      Expanded(child: Text(details[index],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                      ),)),
                                      Container(
                                        height: 25,
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                      Expanded(
                                        child: Text(detailsdata2[index],
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: _isNumeric(detailsdata2[index]) ? Colors.pink : Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13
                                        ),))                                     
                                    ],
                                  ),
                                  
                                ),
                                SizedBox(height: 10,),
                                Divider()
                              ],
                            );
                          })                              
                        ],
                      ),
                    ),
                    Positioned(
                      right: 1,top: 0,bottom: 0,
                      child: IconButton(onPressed: (){
                        Navigator.push(context,
                         MaterialPageRoute(builder: (context)=> DetailsRagavendrabnilySilky()));
                      }, 
                      icon: Icon(Icons.navigate_next_sharp,color: Colors.black,size: 20,)))                        
                  ],
                ),
              ),
              SizedBox(height: 6,),
               Card(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text('#CTMT20250803003894(03/08/2025)',
                            style: TextStyle(color: Colors.indigo,
                            fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 6,),
                          ...List.generate(details.length, (index){
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    children: [
                                      Expanded(child: Text(details[index],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                      ),)),
                                      Container(
                                        height: 25,
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                      Expanded(
                                        child: Text(detailsdata3[index],
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: _isNumeric(detailsdata2[index]) ? Colors.pink : Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13
                                        ),))                                     
                                    ],
                                  ),
                                  
                                ),
                                SizedBox(height: 10,),
                                Divider()
                              ],
                            );
                          })                              
                        ],
                      ),
                    ),
                    Positioned(
                      right: 1,top: 0,bottom: 0,
                      child: IconButton(onPressed: (){
                        Navigator.push(context,
                         MaterialPageRoute(builder: (context)=> DetailsRagavendrabnilySilky()));
                      }, 
                      icon: Icon(Icons.navigate_next_sharp,color: Colors.black,size: 20,)))                        
                  ],
                ),
              ),
             
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        shape: CircleBorder(),
        child: 
        Icon(Icons.electric_meter,color: Colors.white,),
        onPressed: (){}),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

