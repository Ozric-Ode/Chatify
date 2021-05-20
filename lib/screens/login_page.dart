import 'package:chatify/models/user.dart';
import 'package:chatify/screens/chat_user_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../global.dart';

class LoginPage extends StatefulWidget {
  static const route = './loginpage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _username;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _username = TextEditingController();
    G.initiateDummyUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatify"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Text(
                    'Chatify',
                    style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.headline4,
                      color: Color(0xFF696969),
                      fontSize: 64,
                      fontWeight: FontWeight.w200,
                      letterSpacing: -5,
                    ),
                  ),
                ),
              ),
            ),
            TextField(
              controller: _username,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "Enter Username",
                labelText: "Username",
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: ElevatedButton(
                onPressed: _loginUser,
                child: Text("Login to Chatify"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _loginUser() {
    if (_username.text.isEmpty) {
      return;
    }

    User me = G.dummyUsersList[0];
    if (_username.text != 'A') {
      print('BBBBB');
      me = G.dummyUsersList[1];
    }

    G.loggedInUser = me;

    print(G.loggedInUser.username);

    Navigator.of(context).pushReplacementNamed(ChatUserPage.route);
  }
}
