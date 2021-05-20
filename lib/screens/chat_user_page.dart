import 'dart:ui';

import 'package:chatify/screens/chat_page.dart';
import 'package:chatify/screens/login_page.dart';

import '../models/user.dart';
import '../global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatUserPage extends StatefulWidget {
  static const route = './ChatUserPage';
  @override
  _ChatUserPageState createState() => _ChatUserPageState();
}

class _ChatUserPageState extends State<ChatUserPage> {
  List<User> _chatuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chatuser = G.getUsers(G.loggedInUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Users"),
        backgroundColor: Colors.green,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(LoginPage.route);
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: _chatuser.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_chatuser[index].name),
            subtitle: Text(_chatuser[index].email),
            onTap: () {
              G.toChatUser = _chatuser[index];
              Navigator.of(context).pushNamed(ChatPage.route);
            },
          );
        },
      ),
    );
  }
}
