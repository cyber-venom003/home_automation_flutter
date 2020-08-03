import 'package:flutter/material.dart';
import '../Utils/authHandler.dart';
import 'package:firebase_database/firebase_database.dart';

class SwitchDashBoard extends StatefulWidget {
  @override
  _SwitchDashBoardState createState() => _SwitchDashBoardState();
}
class _SwitchDashBoardState extends State<SwitchDashBoard> {
  final AuthHandler AuthService = AuthHandler();
  static final userRef = FirebaseDatabase.instance.reference().child('users/${AuthHandler.user.uid}');
  bool userAuth;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff008f30),
              title: Text('Dashboard'),
              leading: IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    AuthService.signOutUser();
                    Navigator.pop(context);
                  }
              ),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.record_voice_over),
                    onPressed: () {
                      userRef.child('isAuthenticated').onValue.listen((event) {
                        var snapshot = event.snapshot;
                        setState(() {
                          userAuth = snapshot.value;
                        });
                      });
                      print(userAuth);
                    }
                )
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                      'Your Auth Status: ${userAuth == null ? 'Click on listen to see' : userAuth }',
                      style: TextStyle(
                        fontSize: 20,
                      )
                  ),
                FlatButton(
                  onPressed: () {
                    userRef.child('isAuthenticated').set(false);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.0),
                      color: const Color(0xff00690f),
                      border:
                      Border.all(width: 1.0, color: const Color(0xfffcf3ee)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xe6c4ffcd),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          'Revoke RFID Auth ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Segoe UI",
                            fontSize: 25,
                            color:Color(0xffffffff),
                          ),
                        ),
                        SizedBox(width: 7.5),
                        Icon(Icons.remove_circle_outline , size: 25 , color: Color(0xffffffff)),
                      ],
                    ),
                  ),
                ),
                ],
              ),
            )
        )
    );
  }
}
