import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                    'Home Automation',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff007a12),
                      fontFamily: 'Segoe UI'
                    ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5,),
                Image.asset('assets/images/smart-home-png-2.png'),
                SizedBox(height: 5,),
                FlatButton(
                  onPressed: null,
                  child: Container(
                  width: 180,
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
                      'Register',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Segoe UI",
                        fontSize: 25,
                        color:Color(0xffffffff),
                      ),
                    ),
                    SizedBox(width: 7.5),
                    Icon(Icons.person_add , size: 25 , color: Color(0xffffffff)),
                  ],
                ),
              ),
            ),
                SizedBox(height: 5,),
                GestureDetector(
                  onTap: null,
                  child: Text(
                    'Already have an account? Sign In',
                    style: TextStyle(
                      color: Color(0xff007a12),
                      fontSize: 17.5,
                      fontFamily: 'Segoe UI'
                    )
                  ),
                )
              ],
            )
          )
      ),
    );
  }
}
