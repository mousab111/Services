import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:service_app/core/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: route,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Test(),
    Rating(),
    Communication(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: GetBuilder(
          builder: (controller) => Row(
            children: [
              Container(
                width: 33,
                height: 33,
                child: FlutterLogo(size: 33),
              ),
              SizedBox(
                width: 60,
                child: Text(
                  "08:56",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.location_on,
                  color: Colors.black,
                ),
                onPressed: () {
                  // Show additional options
                },
              ),
              Text(
                "[Location]",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 50,
          ),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              // Show additional options
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff6DFC3A),
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.calendar_today,
              color: Colors.white,
            ),
            label: 'Rating',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.message,
              color: Colors.white,
            ),
            label: 'Communication',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double _value = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        builder: (controller) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30,
              width: (_value * 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xffd85f1c),
              ),
              child: AnimatedContainer(
                width: (1 - _value / 10),
                height: 50.0,
                duration: Duration(milliseconds: 10),
                color: _value > 7
                    ? Colors.green
                    : _value > 4
                        ? Colors.yellow
                        : Colors.red,
                curve: Curves.easeInOut,
                child: Slider(
                  value: _value,
                  min: 0.0,
                  max: 10.0,
                  onChanged: (double value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Rating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}

class Communication extends StatefulWidget {
  @override
  State<Communication> createState() => _CommunicationState();
}

class _CommunicationState extends State<Communication> {
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (controller) => SliderTheme(
        data: SliderThemeData(
          trackHeight: 8.0,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
          activeTrackColor: _value > 7
              ? Colors.green
              : _value > 4
                  ? Colors.yellow
                  : Colors.red,
          inactiveTrackColor: Colors.white,
          thumbColor: _value > 7
              ? Colors.green
              : _value > 4
                  ? Colors.yellow
                  : Colors.red,
          overlayColor: _value > 7
              ? Colors.green
              : _value > 4
                  ? Colors.yellow
                  : Colors.red,
        ),
        child: Slider(
          autofocus: true,
          value: _value,
          min: 0.0,
          max: 10.0,
          divisions: 10,
          label: '$_value',
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
        ),
      ),
    );
  }
}

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late DateTime _selectedDate;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _textEditingController =
        TextEditingController(text: _selectedDate.toString());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (controller) => Table(
        children: [
          TableRow(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDate = _selectedDate.subtract(Duration(days: 1));
                    _textEditingController.text = _selectedDate.toString();
                  });
                },
                child: Text('<'),
              ),
              Text('Selected Date:'),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDate = _selectedDate.add(Duration(days: 1));
                    _textEditingController.text = _selectedDate.toString();
                  });
                },
                child: Text('>'),
              ),
            ],
          ),
          TableRow(
            children: [
              SizedBox(height: 20.0),
              TextField(
                controller: _textEditingController,
                readOnly: true,
              ),
              SizedBox(height: 20.0),
            ],
          ),
          TableRow(
            children: [
              SizedBox(height: 20.0),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDate = DateTime(
                          _selectedDate.year,
                          _selectedDate.month,
                          index + 1,
                        );
                        _textEditingController.text = _selectedDate.toString();
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _selectedDate.day == index + 1
                            ? Colors.blue
                            : Colors.white,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Text((index + 1).toString()),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ],
      ),
    );
  }
}

// test
class Test extends StatefulWidget {
  @override
  State<Test> createState() => _TestState();
}

List<String> months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

class _TestState extends State<Test> {
  late DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder(
      builder: (controller) => Container(
        color: Colors.white,
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 257,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xff6dfc3a),
                  ),
                ),
                SizedBox(width: 16),
                SizedBox(
                  width: 40,
                  height: 19,
                  child: Text(
                    "7/10",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.86),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    months[DateTime.now().month - 1] +
                        "  " +
                        selectedDate.year.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                              height: 300.0, child: CalendarWidget());
                        },
                      );
                    },
                    icon: Icon(Icons.calendar_today),
                  )
                ],
              ),
            ),
            SizedBox(height: 8.86),
            Container(
              height: 80,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "18",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Sat",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.orange,
                                  width: 5,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "12:00",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Mousab Al Syoufi",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "1 place Rondelet\n34000 Montpelire",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Container(
                              width: 55,
                              height: 19,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0xffd85f1c),
                              ),
                              child: Center(
                                child: Text(
                                  "Family",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
