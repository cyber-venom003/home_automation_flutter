import 'package:flutter/material.dart';
import './screens/startScreen.dart';
import './screens/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthCheck(),
      routes: {
        'Switch_DashBoard': (context) => SwitchDashBoard(),
      }
    );
  }
}

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context , AsyncSnapshot<FirebaseUser> snapshot){
        print(snapshot.hasData);
        if(snapshot.hasData){
          print(snapshot.data.email);
          return SwitchDashBoard(uid: snapshot.data.uid);
        }
        else {
          return StartScreen();
        }
      },
    );
  }
}

