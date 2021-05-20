import 'routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_auth/email_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatify',
      debugShowCheckedModeBanner: false,
      routes: Routes.route(),
      initialRoute: Routes.initScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _otp = TextEditingController();

  void _sendOtp() async {
    EmailAuth.sessionName = "Chatify";
    var res = await EmailAuth.sendOtp(receiverMail: _email.text);
    print('Helloooo');
    print(res);
    if (res) {
      print('OTP Sent');
    } else {
      print('OTP not Sent');
    }
  }

  void _verifyOtp() async {
    var res =
        await EmailAuth.validate(receiverMail: _email.text, userOTP: _otp.text);
    if (res) {
      print('OTP Verified');
      _email.clear();
      _otp.clear();
      return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Icon(
            Icons.verified,
            color: Colors.green,
          ),
          content: Text('Email Verified !'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            )
          ],
        ),
      );
    } else {
      print('OTP Not Verified');
      _otp.clear();
      return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Icon(
            Icons.not_interested,
            color: Colors.red,
          ),
          content: Text('Email Not Verified !'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            )
          ],
        ),
      );
    }
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
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "Enter Email",
                  labelText: "Email",
                  suffixIcon: TextButton(
                    child: Text("SEND OTP"),
                    onPressed: _sendOtp,
                  )),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: _otp,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Enter OTP",
                labelText: "OTP",
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: RaisedButton(
                onPressed: () {
                  _verifyOtp();
                },
                child: Text("Verify Email"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
