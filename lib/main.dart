import 'package:flutter/material.dart';
import './screens/startScreen.dart';
import './screens/dashboard.dart';

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
      home: StartScreen(),
      routes: {
        'Switch_DashBoard': (context) => SwitchDashBoard(),
      }
    );
  }
}

//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//  final String title;
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  bool device1Status = false;
//  bool device2Status = false;
//  bool device3Status = false;
//  final db = FirebaseDatabase.instance;
//  @override
//  Widget build(BuildContext context) {
//    final ref = db.reference();
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            SwitchListTile(
//                title: const Text('Device 1'),
//                value: device1Status,
//                onChanged: (bool value) {
//                  setState(() {
//                    device1Status = value;
//                  });
//                  ref.child('devices/device1').set(device1Status);
//                  print("Device 1 Status = $device1Status");
//                }
//            ),
//            SwitchListTile(
//                title: const Text('Device 2'),
//                value: device2Status,
//                onChanged: (bool value) {
//                  setState(() {
//                    device2Status = value;
//                  });
//                  ref.child('devices/device2').set(device2Status);
//                  print("Device 2 Status = $device2Status");
//                }
//            ),
//            SwitchListTile(
//                title: const Text('Device 3'),
//                value: device3Status,
//                onChanged: (bool value) {
//                  setState(() {
//                    device3Status = value;
//                  });
//                  ref.child('devices/device3').set(device3Status);
//                  print("Device 3 Status = $device3Status");
//                }
//            ),
//          ],
//        ),
//      ),// This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
