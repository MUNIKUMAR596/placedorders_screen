import 'package:flutter/material.dart';

class TongtesterReadings extends StatefulWidget {
  const TongtesterReadings({super.key});

  @override
  State<TongtesterReadings> createState() => _TongtesterReadingsState();
}

class _TongtesterReadingsState extends State<TongtesterReadings> {
  String? section = 'MACHILIBAZAR';
  final List<String> selectsection = ['MACHILIBAZAR', ];

  String Structurecode = '12289-UJLIBASE-SS-0010';
  final List<String> selectstructurecode = [
    '12289-UJLIBASE-SS-0010',
    
  ];

  void _structuredialoue() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero
        ),
        child: Container(
          height: 300,
          padding: EdgeInsets.all(0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                color: Colors.grey[700],
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.white),
                    SizedBox(width: 6),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Structure Code',
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: selectstructurecode.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(selectstructurecode[index]),
                      onTap: () {
                        setState(() {
                          Structurecode = selectstructurecode[index];
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

var details=['STRUCTURE CODE','LAND MARK','DISTRIBUTION','SS NO','SUB STATION','FEEDER','STRUCTURE CAPACITY','STRUCTURE TYPE','PLINTH TYPE','AB SWITCH TYPE',
'HG FUSE SETS','LT FUSE SETS','LT FUSE TYPE','LOAD PATTERN','STRUCTURE CODE','LONGITUDE','DATE OF CREATION','EMPLOYEE ID',];
var detailsstructure=['12289-ujlibase-ss-010','Nea rana siddique hospital','12289-UJLIBASE','SS-101','1480-01--11KV','1480-01-11KV','1*100','single pole','pillar type',
'vertical','horzintal','available and ok','distribution box','mixed without agl','18.000073555','79.57720662','2023-03-28','4005455',];

int selectindex=-1;
  List<String> breaker = ['Yes', 'No'];// Holds 'yes' or 'no'

  String? location='--SELECT--';
  final List<String> selectlocation=['--SELECT--', 'SUBEDARI', 'CHOWRASTHA/HNK', 'NAKKALAGUTTA','MACHILIBAZAR'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 123, 105),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TONG tester Readings Entry',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'MACHILIBAZAR',
              style: TextStyle(
                fontSize: 15,
                color: const Color.fromARGB(255, 239, 232, 232),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('SELECT SECTION',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 6),
              // 👉 Dropdown in horizontal style (no box)
              DropdownButton<String>(
                isExpanded: true,
                value: section,
                 // remove underline
                items: selectsection.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    section = newValue;
                  });
                },
              ),

              SizedBox(height: 1),
              Text('MACHILIBAZAR|4029111M',
                  style: TextStyle(
                    color: Colors.green
                  ),),
              SizedBox(height: 16),
              Text('SELECT STRUCTURE CODE',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 6),
              InkWell(
                onTap: _structuredialoue,
                child: Row(
               children: [
             Text(
          Structurecode,
           style: TextStyle(fontSize: 16),
            ),
         Spacer(), // Pushes the icon to the far right
       Icon(Icons.arrow_drop_down),
      ],
      )
              ),
              SizedBox(height: 1,),
              Text('12289-ujlibase-0010',
                  style: TextStyle(
                    color: Colors.green
                  ),),
               Container(
                width: double.infinity,
                height: 40,
                color: const Color.fromARGB(255, 198, 196, 196),
                child: Center(
                  child: Text('STRUCTURE DETAILS',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              Column(
  children: List.generate(details.length, (index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  details[index],
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  detailsstructure[index],
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(),
        SizedBox(height: 10),
      ],
    );
  }),
),
SizedBox(
  height: 2,
),
Row(
  children: [
    Container(
      width: 150,
      height: 250,
      color: Colors.grey,
      child: Center(
        child: Text('Image'),
      ),
    ),
    SizedBox(
      width: 6,
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('EQ CODE: 200312605'),
        Text('CAP:100KVA'),
        Text('MAKE:HI-POWER'),
        Text('TRANSFORMERS'),
        Text('SERIAL:10016237')
      ],
    )
  ],
),
SizedBox(
  height: 3,
),
Center(
  child: Text('TONG TESTER READINGS',
  style: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold
  ),),
),
Divider(),
SizedBox(
  height: 6,
),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10),
  child: Text('IS LOAD BALANCING DONE?',
  style: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold
  ),),
),
SizedBox(
  height: 6,
),

 Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: List.generate(breaker.length, (index) {
    bool isSelected = selectindex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectindex = index; // Select this index
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            isSelected ? Icons.check_box : Icons.check_box_outline_blank,
            size: 30,
            color: isSelected ? Colors.pink : Colors.grey,
          ),
          const SizedBox(width: 6),
          Text(
            breaker[index],
            style: TextStyle(
              fontSize: 20,
              color: isSelected ? Colors.pink : Colors.black,
            ),
          ),
          const SizedBox(width: 60),
        ],
      ),
    );
  }),
),
SizedBox(
  height: 6,
),
Padding(
  padding: const EdgeInsets.all(12.0),
  child: Row(
    children: [
      // First TextField
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Rph(Amps)",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                isDense: true, // for compact height
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 10), // space between the two fields
  
      // Second TextField
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Yph(Amps)",
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
),
SizedBox(
  height: 8,
),
Padding(
  padding: const EdgeInsets.all(12.0),
  child: Row(
    children: [
      // First TextField
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bph(Amps)",
            style: TextStyle(
              color: Colors.indigo,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                isDense: true, // for compact height
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 10), // space between the two fields
  
      // Second TextField
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Neutral(Amps)",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
),
SizedBox(
  height: 8,
),
Text("TOTAL CONNECTED LOAD(KVA))",
style: TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold
),),
SizedBox(height: 5),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: SizedBox(
    width: MediaQuery.of(context).size.width * 0.5, // 50% of screen
    child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(10),
      ),
    ),
  ),
),SizedBox(
  height: 6,
),
Row(
  children: [
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Reading Data',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(
            height: 2,
          ),
          TextField(
            
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              contentPadding: EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.grey
            ),
          )
        ],
      ),
    ),
    SizedBox(width: 10,),
    Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reading Time",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                contentPadding: EdgeInsets.all(10),
                fillColor: Colors.grey,
                filled: true

              ),
            ),
          ],
        ),
      ),
  ],
),
SizedBox(
  height: 6,
),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 5),
  child: Text('LOCATION TYPE',
  style: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold
  ),),
),
SizedBox(
  height: 6,
),
DropdownButton(
  isExpanded: true,
  value: location,
  items: selectlocation.map((String showlocation){
    return DropdownMenuItem(
      value: showlocation,
      child: Text(showlocation));

  }).toList(), 
  onChanged: (String? selectedlocation){
    setState(() {
      location=selectedlocation;
    });
  }),
  SizedBox(
    height: 9,
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
