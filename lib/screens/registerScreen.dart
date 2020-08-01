import 'package:flutter/material.dart';
import '../Utils/authHandler.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({@required this.option});
  final String option;
  @override
  _RegisterScreenState createState() => _RegisterScreenState(option: option);
}

class _RegisterScreenState extends State<RegisterScreen> {
  _RegisterScreenState({@required this.option});
  final String option;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }
  @override
  void deactivate() {
    super.deactivate();
    _emailController.dispose();
    _passwordController.dispose();
  }
  final AuthHandler AuthService = AuthHandler();
  createAlertDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(
              "$option failed!",
              style: TextStyle(
                fontFamily: "Segoe UI",
                fontSize: 20,
                color:Color(0xfff67300),
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Your $option for ${_emailController.text} failed!'),
                  Text('Please try again with this or different email.'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Dismiss',
                  style: TextStyle(
                    color:Color(0xfff67300),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFFCF3EE),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.5 , vertical: 5),
          child: isLoading ? Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xfff67300))
              )
          )
              : new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text(
                "$option here to write your food blog",
                style: TextStyle(
                  fontFamily: "Segoe UI",
                  fontSize: 35.5,
                  color:Color(0xfff67300),
                ),
              ),
              new TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Username",
                  icon: Icon(Icons.alternate_email , color: Color(0xFFF67300) , size: 22.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(17.5)),
                    borderSide: BorderSide(color: Color(0xFFF67300) , width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF67300), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(17.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF67300), width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(17.5)),
                  ),
                ),
              ),
              new TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  icon: Icon(Icons.vpn_key , color: Color(0xFFF67300) , size: 22.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(17.5)),
                    borderSide: BorderSide(color: Color(0xFFF67300) , width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF67300), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(17.5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF67300), width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(17.5)),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () async {
                  if(_emailController.text.isEmpty || _passwordController.text.isEmpty){
                    createAlertDialog(context);
                    return;
                  }
                  else{
                    if(option == "Sign Up"){
                      try{
                        setState(() {
                          isLoading = true;
                        });
                        bool res = await AuthService.createEmailUser(_emailController.text, _passwordController.text);
                        if(!res){
                          setState(() {
                            isLoading = false;
                          });
                          createAlertDialog(context);
                        }
                        else{
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pushNamed(context, 'Regis_Screen');
                        }
                      }
                      catch(error){
                        setState(() {
                          isLoading = false;
                        });
                        createAlertDialog(context);
                      }
                    }
                    else if(option == "Sign In"){
                      try{
                        setState(() {
                          isLoading = true;
                        });
                        bool res = await AuthService.signInEmailUser(_emailController.text, _passwordController.text);
                        if(!res){
                          setState(() {
                            isLoading = false;
                          });
                          createAlertDialog(context);
                        }
                        else{
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.of(context).pushNamedAndRemoveUntil('Item_Screen', (route) => false);
                        }
                      }
                      catch(error){
                        setState(() {
                          isLoading = false;
                        });
                        createAlertDialog(context);
                      }
                    }
                  }
                },
                child: Container(
                  width: 235,
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
                        'Activate Service',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontSize: 25,
                          color:Color(0xffffffff),
                        ),
                      ),
                      SizedBox(width: 7.5),
                      Icon(Icons.check , size: 25 , color: Color(0xffffffff)),
                    ],
                  ),
                ),
              ),
//              new ShadowButton(
//                icon: Icon(Icons.edit , color: Color(0xfff67300) , size: 24.5),
//                text: 'Let\'s write ',
//                textSize: 22.5,
//                width: 210,
//                height: 48,

//              ),
            ],
          )
      ),
    );
  }
}



