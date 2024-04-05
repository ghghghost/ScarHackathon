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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Navigator Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: StreamBuilder(
        stream: fetchDataFromFirestore(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // 데이터가 성공적으로 로드되면 이미지를 표시합니다.
            final data = snapshot.data!.data() as Map<bool, dynamic>;
            return Stack(
              children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 80,
                    child: Image.asset(
                      'assets/images/app_1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Visibility(
                  visible: data['monster1'],
                  child: Positioned(
                    top: 320,
                    left: 70,
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/images/pac.png',
                        fit: BoxFit
                            .cover, // Image will cover the entire container
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: data['monster2'],
                  child: Positioned(
                    top: 220,
                    right: 0,
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: Image.asset(
                          'assets/images/pac.png',
                          fit: BoxFit
                              .cover, // Image will cover the entire container
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: data['excuse'],
                  child: Positioned(
                    top: 240,
                    left: 140,
                    child: Container(
                      width: 60,
                      height: 60,
                      child: Image.asset(
                        'assets/images/Excuse.png',
                        fit: BoxFit
                            .cover, // Image will cover the entire container
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: data['excuse'],
                  child: Positioned(
                    top: 300,
                    left: 160,
                    child: Container(
                      width: 50,
                      child: Image.asset(
                        'assets/images/Arrow.png',
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Stream<DocumentSnapshot> fetchDataFromFirestore() {
    // Firestore에서 데이터를 가져오는 스트림
    return FirebaseFirestore.instance
        .collection('Element')
        .doc('variable')
        .snapshots();
  }
}
