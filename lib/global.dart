import './models/user.dart';

class G {
  static List<User> dummyUsersList;

  static User loggedInUser;
  static User toChatUser;

  static void initiateDummyUsers() {
    dummyUsersList = [];
    User A =
        User(username: 'A', name: 'DummyUserA', email: 'dummyusera@gmail.com');
    User B =
        User(username: 'B', name: 'DummyUserB', email: 'dummyuserb@gmail.com');

    dummyUsersList.add(A);
    dummyUsersList.add(B);
  }

  static List<User> getUsers(User u) {
    return dummyUsersList
        .where(
          (element) => !(element.name
              .toString()
              .toLowerCase()
              .contains(u.name.toString().toLowerCase())),
        )
        .toList();
  }
}
