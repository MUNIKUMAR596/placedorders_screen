import 'package:flutter/material.dart';

class Onetimeregistration extends StatefulWidget {
  const Onetimeregistration({super.key});

  @override
  State<Onetimeregistration> createState() => _OnetimeregistrationState();
}

class _OnetimeregistrationState extends State<Onetimeregistration> {
  TextEditingController _employeename=TextEditingController();
  TextEditingController _designation=TextEditingController();
   TextEditingController _phone =TextEditingController();
    TextEditingController _password =TextEditingController();
     TextEditingController _confirmpassword =TextEditingController();
/// SELECT WING
  final List<String> _wingData = [
  'OPERATION', 'MRT', 'TRE', 'PROJECTION', 'CONSTRUCTION','CIVIL', 'STORE', 'SPM', 'DPE', 'ACCOUNTS'];
  TextEditingController _wingController = TextEditingController(); 
 Future<void> _showwingdialouge() async{
  TextEditingController _wingsearch =TextEditingController();
   List<String> _dataFilter = List.from(_wingData);
  {
               final selectedwing = await showDialog<String>(
                  context: context, 
                  builder: (BuildContext context){
                    return StatefulBuilder(
                      builder: (context, setState){
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
                            controller: _wingsearch,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey,
                              prefixIcon: Icon(Icons.search,
                               color: Colors.white),
                              hint: Text('Search Wing',
                              style: TextStyle(
                                color: Colors.white
                              ),)
                            ),
                            onChanged: (value) {
                              setState(() {
                                _dataFilter = _wingData.where((item) => 
                                item.toLowerCase().contains(value.toLowerCase())).toList();
                              });
                            },
                          )
                        ],
                      ),
                      content: SizedBox(
                        width: double.infinity,
                        height: 500,
                        child: ListView.builder(itemCount: _dataFilter.length,
                          itemBuilder:(context, index) {
                            return ListTile(
                                title: Text(_dataFilter[index]),
                                onTap: () {
                                  Navigator.pop(context,_dataFilter[index]);
                                },
                            );
                          },),
                      ),

                    );
                      });
                  });
                  if (selectedwing != null){
                    setState(() {
                      _wingController.text=selectedwing;
                    });
                  }
             }
 }

 /// SELECT CIRCLE
 final List<String> _selectcircle=['ACCOUNTS LOGIN','CORPORATE OFC','KHAMMAM','HANAMKONDA','WARANGAL',
 'KARIMNAGAR','ADILABAD','NIZAMABAD','BHADRADRI KOTHAGUDEM','JANGAON'];
 TextEditingController _searchController=TextEditingController();
 TextEditingController _searchcircle=TextEditingController();
Future<void> _showselectcircle() async {
  TextEditingController _searchcircle = TextEditingController();
   List<String> _filtercircle = List.from(_selectcircle);
  final selectedcircle = await showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {         
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.zero
            ),
            titlePadding: EdgeInsets.all(0),
            contentPadding: EdgeInsets.symmetric(horizontal: 4),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _searchcircle,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: 'Search Circle',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _filtercircle = _selectcircle
                          .where((item) => item
                              .toLowerCase()
                              .contains(value.toLowerCase()))
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
                itemCount: _filtercircle.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filtercircle[index]),
                    onTap: () {
                      Navigator.pop(context, _filtercircle[index]);
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

  if (selectedcircle != null) {
    setState(() {
      _searchController.text=selectedcircle;
    });
  }
}

/// SELECT DIVISION
final List<String> _selectdivision = ['SATHUPALLY','KHAMMAM RURAL','DE/CIVIL/KHAMMAM','DE/CON/KHAMMAM','DE/MRT/KHAMMA','KHAMMAM',
'WYRA','DE/TECH/KHAMMAM','DE/MRT/KHAMMAM'];
TextEditingController _serachdivision=TextEditingController();
TextEditingController _serachdivisioncontroller=TextEditingController();

Future<void> _showdivisioncircle()async {
  List<String> divisionfiltered = List.from(_selectcircle);
  final selected_divisions = await showDialog(
    context: context, 
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context,setState){
          
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero
            ),
            titlePadding: EdgeInsets.all(0),
            contentPadding: EdgeInsets.symmetric(horizontal: 4),
            title: Column(
              children: [
                TextField(
                  controller: _serachdivision,
                   decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: 'Search Division',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  onSubmitted: (value) {  
                    setState(() {
                      divisionfiltered=_selectdivision.where((item) => 
                      item.toLowerCase().contains(value.toLowerCase())).toList();
                    },);                  
                  },
                )
              ],
            ),
            content: SizedBox(
              width: double.infinity,
              height: 400,
              child: ListView.builder(
                itemCount: divisionfiltered.length,
                itemBuilder:(context, index) {
                  return ListTile(
                    title: Text(divisionfiltered[index]),
                    onTap: () {
                      Navigator.pop(context, divisionfiltered[index]);
                    },
                  );
                },),
            ),
          );
        });
    });
    if (selected_divisions != null ){
      setState(() {
        _serachdivisioncontroller.text=selected_divisions;
      });
    }
}

/// Search sub Division
final List<String> selectsubdivision=['ADE/CVL/KOTHAGUDEM','ADE/CIVIL/KHAMMAM'];

TextEditingController _searchsubdivision=TextEditingController();
TextEditingController _searchsubdivisioncontroller=TextEditingController();

Future<void> _subdivisiondialouge() async {
  List<String> subdivisionfilterd=List.from(selectsubdivision);
  final selectedsubdivsion = await showDialog(
    context: context,
     builder: (context){
      return StatefulBuilder(
        builder: (context ,setState){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.zero
          ),
          titlePadding: EdgeInsets.all(0),
          contentPadding: EdgeInsets.symmetric(horizontal: 4),
          title: Column(
            children: [
              TextField(
                controller: _searchsubdivision,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: 'Search Division',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.search,color: Colors.white,)
                ),
                onSubmitted: (value) {
                  setState(() {
                    subdivisionfilterd=selectsubdivision.where((item) => 
                    item.toLowerCase().contains(value.toLowerCase())).toList();
                  },);
                },
              ),
            ],
          ),
          content: SizedBox(
            height:400 ,
            child: ListView.builder(
              itemCount: subdivisionfilterd.length,
              itemBuilder:(context, index) {
                return ListTile(
                  title: Text(subdivisionfilterd[index]),
                  onTap: () {
                    Navigator.pop(context,subdivisionfilterd[index]);
                  },
                );
              },),
          ),
        );

        });
     });
     if(selectedsubdivsion != null){
_searchsubdivisioncontroller.text=selectedsubdivsion;
     }
}
/// SEARCH SECTION
final List<String> _selectsection=['AEE CIVIL KOTHAGUDEM','AE CIVIL SR PATNAM','AE CIVIL BHADRACHALAM'];
TextEditingController _selectsectioncontroller=TextEditingController();

Future<void> _showselectsectiondialouge ()async {
  List<String> _filteredsection =List.from(_selectsection);

  TextEditingController _searcsection =TextEditingController();
  final _selectedsearchsection = await showDialog(
    context: context,
     builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.zero,
            ),
            titlePadding: EdgeInsets.all(0),
            contentPadding: EdgeInsets.symmetric(horizontal: 3),
            title: Column(
              children: [
                TextField(
                  controller: _searcsection,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey,
                    hintText: 'Search section',
                   hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.search,color: Colors.white,)
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      _filteredsection=_selectsection.where((item) =>
                      item.toLowerCase().contains(value.toLowerCase())).toList();
                    },);
                  },
                )
              ],
            ),
            content: SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: _filteredsection.length,
                itemBuilder:(context, index) {
                  return ListTile(
                    title: Text(_filteredsection[index]),
                    onTap: () {
                      Navigator.pop(context,_filteredsection[index]);
                    },
                  );
                },),
            ),
          );
        });       
     });
     if (_selectedsearchsection!= null){
      _selectsectioncontroller.text= _selectedsearchsection;
     }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 9, 122, 100),
        title: Row(
          children: [Text('One Time Registeration',
          style: TextStyle(
           color: Colors.white,
           fontSize: 16,
           fontWeight: FontWeight.bold
          ),),
          SizedBox(width: 19,),
          Text('LOG OUT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold
          ),)],
          
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name Of the Employee',
              style: TextStyle(color: const Color.fromARGB(255, 101, 99, 99),
              fontSize: 15),),
              TextField(
                controller: _employeename,
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 15,
                  //fontWeight: FontWeight.bold
                ),
              ),
                 SizedBox(height: 6,),
              Text('Designation',
              style: TextStyle(color: const Color.fromARGB(255, 101, 99, 99),
              fontSize: 15),),
              TextField(
                controller: _designation,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  //fontWeight: FontWeight.bold
                ),
              ),
             SizedBox(height: 6,),
             RichText(text: TextSpan(
              children: [TextSpan(
                text: 'Wing',
                style: TextStyle(color: const Color.fromARGB(255, 101, 99, 99),
              fontSize: 15)
              ),
              TextSpan(
                text: '(*)',
                style: TextStyle(
                  color: const Color.fromARGB(255, 221, 27, 13)
                )
              )]
             )),
             TextField(
              controller: _wingController,
              onTap: _showwingdialouge
             ),
              SizedBox(height: 6,),
             RichText(text: TextSpan(
              children: [TextSpan(
                text: 'Select Circle',
                style: TextStyle(color: const Color.fromARGB(255, 101, 99, 99),
              fontSize: 15)
              ),
              TextSpan(
                text: '(*)',
                style: TextStyle(
                  color: const Color.fromARGB(255, 221, 27, 13)
                )
              )]
             )),
             TextField(
              controller: _searchController,
              onTap: _showselectcircle
             ),
             SizedBox(height: 6,),
             RichText(text: TextSpan(
              children: [TextSpan(
                text: 'Select Division',
                style: TextStyle(color: const Color.fromARGB(255, 101, 99, 99),
              fontSize: 15)
              ),
              TextSpan(
                text: '(*)',
                style: TextStyle(
                  color: const Color.fromARGB(255, 221, 27, 13)
                )
              )]
             )),
             TextField(
              controller: _serachdivisioncontroller,
              onTap: _showdivisioncircle
             ),
             SizedBox(height: 6,),
             RichText(text: TextSpan(
              children: [TextSpan(
                text: 'Select Sub Division',
                style: TextStyle(color: const Color.fromARGB(255, 101, 99, 99),
              fontSize: 15)
              ),
              TextSpan(
                text: '(*)',
                style: TextStyle(
                  color: const Color.fromARGB(255, 221, 27, 13)
                )
              )]
             )),
             TextField(
              controller: _searchsubdivisioncontroller,
              onTap: _subdivisiondialouge
             ),
             SizedBox(height: 6,),
             RichText(text: TextSpan(
              children: [TextSpan(
                text: 'Select Section',
                style: TextStyle(color: const Color.fromARGB(255, 101, 99, 99),
              fontSize: 15)
              ),
              TextSpan(
                text: '(*)',
                style: TextStyle(
                  color: const Color.fromARGB(255, 221, 27, 13)
                )
              )]
             )),
             TextField(
              controller: _selectsectioncontroller,
              onTap: _showselectsectiondialouge
             ),
                 SizedBox(height: 6,),
              Text('Phone',
              style: TextStyle(color: const Color.fromARGB(255, 101, 99, 99),
              fontSize: 15),),
              TextField(
                controller: _phone,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  //fontWeight: FontWeight.bold
                ),
              ),
                  SizedBox(height: 6,),
              Text('Password',
              style: TextStyle(color: const Color.fromARGB(255, 101, 99, 99),
              fontSize: 15),),
              TextField(
                controller: _password,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  //fontWeight: FontWeight.bold
                ),
              ),
                  SizedBox(height: 6,),
              Text('Confirm Password',
              style: TextStyle(color: const Color.fromARGB(255, 101, 99, 99),
              fontSize: 15),),
              TextField(
                controller: _confirmpassword,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  //fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.zero
                    ),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white
                  ),
                  onPressed: (){}, 
                  child: Text('REGISTER')),
              )

            ],
          ),
        ),
      ),
    );
  }
}