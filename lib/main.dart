import 'package:flutter/material.dart';
import 'package:newsappwassim/home_screen.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';


Future main() async {

   WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    
    options: const FirebaseOptions(
      apiKey: "AIzaSyCOMPb2RbsTegqR4zKfSfgGB28iYv_0dRo", // Your apiKey
      appId: "1:517870258699:android:6ba0fbddbc4b8497e8950e", // Your appId
      messagingSenderId: "XXX", // Your messagingSenderId
      projectId: "newsappwassim-d200c",) // Your projectId
  );
 
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wassim News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
