import 'package:flutter/material.dart';

class SwitchDashBoard extends StatefulWidget {
  @override
  _SwitchDashBoardState createState() => _SwitchDashBoardState();
}

class _SwitchDashBoardState extends State<SwitchDashBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('Dashboard'),
            ),
          ),
        )
    );
  }
}
