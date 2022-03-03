import 'package:flutter/cupertino.dart';

class user{
  String Fullname;
  String phone;

  user(this.Fullname, this.phone);

  Map<String, dynamic> toMap() {
    return {
      'Fullname': Fullname,
      'phone': phone,
    };
  }
}


class UserProvider with ChangeNotifier {

  user user_info = new user('', '');
  List<user> users=[];

  getUser() => user_info;
  getUsers() => users;


  void setUserInfo(user info) {
    user_info= user(info.Fullname,info.phone);
    users.add(info);
    notifyListeners();
  }


  void DeletedUser(int index) {
    users.removeAt(index);
    notifyListeners();
  }

}