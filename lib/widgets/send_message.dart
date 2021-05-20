import 'package:flutter/material.dart';

class SendMessage extends StatelessWidget {
  final TextEditingController chatTextFieldController;
  final Function sendMsg;

  SendMessage({
    @required this.chatTextFieldController,
    @required this.sendMsg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          _chatTextArea(),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: sendMsg,
          ),
        ],
      ),
    );
  }

  Widget _chatTextArea() {
    return Expanded(
      child: TextField(
        controller: chatTextFieldController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 0.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.white,
              width: 0.0,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(10.0),
          hintText: 'Type message...',
        ),
      ),
    );
  }
}
