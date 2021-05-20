import 'package:flutter/material.dart';
import '../models/user.dart';

enum UserOnlineStatus { connecting, online, not_online }

class ChatTitle extends StatelessWidget {
  final User toChatUser;
  final UserOnlineStatus userOnlineStatus;

  ChatTitle({
    Key key,
    @required this.toChatUser,
    @required this.userOnlineStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(toChatUser.name),
          Text(
            _userOnlineText(),
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  String _userOnlineText() {
    if (userOnlineStatus == UserOnlineStatus.online) return 'Online';
    if (userOnlineStatus == UserOnlineStatus.not_online) return 'Offline';
    return 'Connecting';
  }
}
