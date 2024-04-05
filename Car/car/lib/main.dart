import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 250,
              height: 250,
              child: FittedBox(
                child: FloatingActionButton(
                  heroTag: 'black_page_fab', // Unique tag for the first page
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlackPage(title: 'Black Page')),
                    );
                  },
                  tooltip: 'Go to Black Page',
                  child: Image.asset('assets/images/black.png'),
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            SizedBox(
              width: 250,
              height: 250,
              child: FittedBox(
                child: FloatingActionButton(
                  heroTag: 'second_page_fab', // Unique tag for the second page
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SecondPage(title: 'Second Page')),
                    );
                  },
                  tooltip: 'Go to Second Page',
                  child: Image.asset('assets/images/car.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlackPage extends StatefulWidget {
  const BlackPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BlackPage> createState() => _BlackPageState();
}

class _BlackPageState extends State<BlackPage> {
  bool _isImage1Displayed = false; // BlackPage 내부의 상태로 관리

  List<String> _imagePaths = [
    'assets/images/road.jpg',
    'assets/images/road_1.jpg',
    'assets/images/road2.jpg',
    'assets/images/road2_1.jpg',
    'assets/images/road3.jpg',
    'assets/images/road3_1.jpg',
  ];

  int _selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: _isImage1Displayed
                              ? Image.asset(
                                  _imagePaths[_selectedImageIndex + 1],
                                )
                              : Image.asset(
                                  _imagePaths[_selectedImageIndex],
                                ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Execution AI',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          Switch(
                            value: _isImage1Displayed,
                            onChanged: (value) {
                              setState(() {
                                _isImage1Displayed = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedImageIndex = 0;
                      });
                    },
                    child: Image.asset(
                      _imagePaths[0],
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedImageIndex = 2;
                      });
                    },
                    child: Image.asset(
                      _imagePaths[2],
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedImageIndex = 4;
                      });
                    },
                    child: Image.asset(
                      _imagePaths[4],
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool _monsterV1 = true;
  bool _monsterV2 = true;
  bool _excuse = false;
  double _markV1 = 0;
  double _markV2 = 0;
  double _markV3 = 0;
  double _markS1 = 30;
  double _markS2 = 30;
  double _markS3 = 30;

  late CollectionReference<Map<String, dynamic>>
      elementCollection; // 컬렉션 참조를 위한 변수

  @override
  void initState() {
    super.initState();
    elementCollection = FirebaseFirestore.instance
        .collection('Element'); // Firestore의 'Element' 컬렉션에 대한 참조
    elementCollection
        .doc('variable') // 'variable' 문서에 대한 참조
        .update({'monster1': 'true'}) // 필드 업데이트
        .then((_) {
      print("Document successfully updated!");
    }).catchError((error) {
      print("Error updating document: $error");
    });
    elementCollection
        .doc('variable') // 'variable' 문서에 대한 참조
        .update({'monster2': 'true'}) // 필드 업데이트
        .then((_) {
      print("Document successfully updated!");
    }).catchError((error) {
      print("Error updating document: $error");
    });
    elementCollection
        .doc('variable') // 'variable' 문서에 대한 참조
        .update({'execuse': 'false'}) // 필드 업데이트
        .then((_) {
      print("Document successfully updated!");
    }).catchError((error) {
      print("Error updating document: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Stack(
          children: [
            Expanded(
              child: Center(
                child: Expanded(
                  child: Image.asset(
                    'assets/images/road3_2.jpg',
                  ),
                ),
              ),
            ),
            Positioned(
              top: 250,
              left: 300,
              child: Visibility(
                visible: _monsterV1,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _monsterV1 = false;
                    });
                    elementCollection
                        .doc('variable') // 'variable' 문서에 대한 참조
                        .update({'monster1': 'false'}) // 필드 업데이트
                        .then((_) {
                      print("Document successfully updated!");
                    }).catchError((error) {
                      print("Error updating document: $error");
                    });
                  },
                  child: SizedBox(
                    width: 200,
                    child: Image.asset(
                      'assets/images/pac.png',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 190,
              left: 400,
              child: Visibility(
                visible: !(_monsterV1) & !(_monsterV2) & _excuse,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _excuse = false;
                    });
                    elementCollection
                        .doc('variable') // 'variable' 문서에 대한 참조
                        .update({'execuse': 'false'}) // 필드 업데이트
                        .then((_) {
                      print("Document successfully updated!");
                    }).catchError((error) {
                      print("Error updating document: $error");
                    });
                  },
                  child: SizedBox(
                    width: 100,
                    child: Image.asset(
                      'assets/images/Excuse.png',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 350,
              left: 450,
              child: Visibility(
                visible: !(_monsterV1) & !(_monsterV2) & _excuse,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _excuse = false;
                    });
                    elementCollection
                        .doc('variable') // 'variable' 문서에 대한 참조
                        .update({'execuse': 'false'}) // 필드 업데이트
                        .then((_) {
                      print("Document successfully updated!");
                    }).catchError((error) {
                      print("Error updating document: $error");
                    });
                  },
                  child: SizedBox(
                    width: 100,
                    child: Image.asset(
                      'assets/images/Arrow.png',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 280,
              right: 80,
              child: Visibility(
                visible: _monsterV2,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _monsterV2 = false;
                    });
                    elementCollection
                        .doc('variable') // 'variable' 문서에 대한 참조
                        .update({'monster2': 'false'}) // 필드 업데이트
                        .then((_) {
                      print("Document successfully updated!");
                    }).catchError((error) {
                      print("Error updating document: $error");
                    });
                  },
                  child: SizedBox(
                    width: 200,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: Image.asset(
                        'assets/images/pac.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 180,
              left: 340,
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _markV1 = 1;
                    _markS1 = 80;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _markV1 = 0;
                    _markS1 = 30;
                  });
                },
                child: SizedBox(
                  width: _markS1,
                  child: Opacity(
                    opacity: _markV1,
                    child: Image.asset(
                      'assets/images/NOmo.png',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 145,
              left: 565,
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _markV2 = 1;
                    _markS2 = 80;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _markV2 = 0;
                    _markS2 = 30;
                  });
                },
                child: SizedBox(
                  width: _markS2,
                  child: Opacity(
                    opacity: _markV2,
                    child: Image.asset(
                      'assets/images/LSign.png',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 210,
              left: 630,
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _markV3 = 1;
                    _markS3 = 80;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _markV3 = 0;
                    _markS3 = 30;
                    Future.delayed(Duration(seconds: 1), () {
                      _excuse = true;
                    });
                  });
                  _monsterV1
                      ? null
                      : elementCollection
                          .doc('variable') // 'variable' 문서에 대한 참조
                          .update({'execuse': 'true'}) // 필드 업데이트
                          .then((_) {
                          print("Document successfully updated!");
                        }).catchError((error) {
                          print("Error updating document: $error");
                        });
                },
                child: SizedBox(
                  width: _markS3,
                  child: Opacity(
                    opacity: _markV3,
                    child: Image.asset(
                      'assets/images/NoU.png',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Stream<DocumentSnapshot> fetchDataFromFirestore() {
  return FirebaseFirestore.instance
      .collection('your_collection_name')
      .doc('your_document_id')
      .snapshots();
}
