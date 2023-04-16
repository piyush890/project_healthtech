import 'package:shared_preferences/shared_preferences.dart';

class Sharepref{
  Future<void> setID(String name,phone) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name',name);
    prefs.setString('phone',phone);
  }
  Future<String> getname() async {
    final prefs = await SharedPreferences.getInstance();
   String? name =  prefs.getString('name');
    return name.toString();
  }
  Future<String> getphone() async {
    final prefs = await SharedPreferences.getInstance();
    String? phone =  prefs.getString('phone');
    return phone.toString();
  }
  void removeall() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
    prefs.remove('phone');
    
  }
}