import 'dart:ui';

import 'package:chatify/screens/login_page.dart';
import 'package:chatify/widgets/chat_title.dart';

import '../models/user.dart';
import '../models/chat_message_model.dart';
import '../global.dart';
import 'package:flutter/material.dart';
import '../widgets/send_message.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  static const route = './ChatPage';
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessageModel> _chatMessages;
  User _toChatUser;
  UserOnlineStatus _userOnlineStatus;
  TextEditingController _chatTextFieldController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chatMessages = [];
    _chatTextFieldController = TextEditingController();
    _toChatUser = G.toChatUser;
    _userOnlineStatus = UserOnlineStatus.connecting;
    //_chatMessages = G.getUsers(G.loggedInUser);
  }

  void sendMessage() {
    print("Send Message");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: ChatTitle(
            toChatUser: G.toChatUser,
            userOnlineStatus: _userOnlineStatus,
          ),
          backgroundColor: Colors.green,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _chatMessages.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_chatMessages[index].message),
                    );
                  },
                ),
              ),
              SendMessage(
                chatTextFieldController: _chatTextFieldController,
                sendMsg: sendMessage,
              ),
            ],
          ),
        ));
  }
}
