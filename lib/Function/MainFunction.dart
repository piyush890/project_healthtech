import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_healthtech/Function/BaseURL.dart';
class Brain{
    Future<String> appointmentNode(name,phone,age,deparment,address,email,ipaddress,date) async {
    dynamic response;
    response = await http.post(
         Uri.parse(BaseUrl.appointment),
         body: jsonEncode(
          {
           "name":name.toString(),
           "phone":phone.toString(),
           "age":age.toString(),
           "address":address.toString(),
           "email":email.toString(),
           "auth_key":"DES!K!@F(ILES<@>::{}/////FILESNULLVA:L",
           "department":deparment.toString(),
           "ip_address":ipaddress.toString(),
           "regisdate":date


   }
         
         )
        );

        String res = response.body;
        
    return res;
  }
    Future<String> getdepartment() async {
    dynamic response;
    response = await http.get(
         Uri.parse(BaseUrl.department),
         
        );

        String res = response.body;
        
    return res;
  }
}