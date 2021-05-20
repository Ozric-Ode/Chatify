import 'dart:core';

import 'dart:io';
import 'package:adhara_socket_io/adhara_socket_io.dart';
import './models/user.dart';
import './models/chat_message_model.dart';

class SocketUtils {
  static String _serverIP =
      Platform.isIOS ? 'http://localhost' : 'http://10.0.2.2';
  static const SERVER_PORT = 6000;
  static String _connectUrl = '$_serverIP:$SERVER_PORT';

  //EVENTS
  static const String _ON_MESSAGE_RECIEVED = 'recieve_message';
  static const String _IS_USER_ONLINE_EVENT = 'check_online';

  //STATUS
  static const STATUS_MESSAGE_NOT_SENT = 10001;
  static const STATUS_MESSAGE_SENT = 10002;

  //TYPE OF CHAT
  static const String SINGLE_CHAT = 'single_chat';

  User _fromUser;

  SocketIO _socket;
  SocketIOManager _manager;

  initSocket(User fromUser) async {
    this._fromUser = fromUser;
    print('Connecting...${fromUser.name}...');
    await _init();
  }

  _init() async {
    _manager = SocketIOManager();
    _socket = await _manager.createInstance(_socketOptions());
  }

  _socketOptions() {
    Map<String, String> userMap = {
      'from': _fromUser.username.toString(),
    };

    return SocketOptions(
      _connectUrl,
      enableLogging: true,
      transports: [Transports.webSocket],
      query: userMap,
    );
  }

  setOnConnectListener(Function onConnect) {
    _socket.onConnect.listen((data) => onConnect(data));
  }

  setOnConnectionErrorTimeoutListener(Function onConnectionTimeout) {
    _socket.onConnectTimeout.listen((data) {
      onConnectionTimeout(data);
    });
  }

  setOnConnectionErrorListener(Function onConnectionError) {
    _socket.onConnectError.listen((data) {
      onConnectionError(data);
    });
  }

  setOnErrorListener(Function onError) {
    _socket.onError.listen((data) {
      onError(data);
    });
  }

  setOnDisconnectListener(Function onDisconnect) {
    _socket.onDisconnect.listen((data) {
      onDisconnect(data);
    });
  }

  closeConnection() {
    if (_socket != null) {
      print('Closing Connection');
      _manager.clearInstance(_socket);
    }
  }
}
