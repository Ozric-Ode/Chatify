import 'package:chatify/screens/chat_page.dart';
import 'package:chatify/screens/chat_user_page.dart';

import 'screens/login_page.dart';

class Routes {
  static route() {
    return {
      LoginPage.route: (context) => LoginPage(),
      ChatUserPage.route: (context) => ChatUserPage(),
      ChatPage.route: (context) => ChatPage(),
    };
  }

  static initScreen() {
    return LoginPage.route;
  }
}
