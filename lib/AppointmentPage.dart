import 'dart:convert';

import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:project_healthtech/Function/MainFunction.dart';
import 'package:project_healthtech/QRCode.dart';
import 'package:project_healthtech/SharePref.dart';
import 'package:project_healthtech/check.dart';
import 'package:project_healthtech/colors.dart';
import 'package:project_healthtech/showdialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  List Deaprtment = [
  'department of general medicine',
  'department of surgery department'
  ];
  String ip_address = '';
 String userid  ='';
 List departlist = [];

 Future<void> getdepartment() async {
 
    dynamic response = await Brain().getdepartment();
    print(response);
    var data = jsonDecode(response);
     setState(() {
       departlist = data;
     });
    }
  @override
  void initState() {
    selfIP();
    getdepartment();
    super.initState();
  }
   void selfIP()  async { 
    final ipv4 = await Ipify.ipv4();
  setState(() {
    ip_address = ipv4;
  });
}
void appointmentfun(BuildContext context) async {
  Load().data(context);
   if (email.text.toString().isEmpty) {
    Navigator.pop(context);
     return;
   }
   if (age.text.toString().isEmpty) {
    Navigator.pop(context);
     return;
   }
   if (address.text.toString().isEmpty) {
    Navigator.pop(context);
     return;
   }
   if (department.text.toString().isEmpty) {
    Navigator.pop(context);
     return;
   }
  
   else{
    
    var name = await Sharepref().getname();
   var phone = await Sharepref().getphone();
    dynamic response = await Brain().appointmentNode(name.toString(), phone.toString(),age.text.toString(), department.text.toString(), address.text.toString(),email.text.toString(),ip_address.toString(),date.text.toString());
    print(name);
    var data = jsonDecode(response);
      String status = data['status'];
      String message = data['message'];
      var id = data['userid'];
      if(status.contains("0")){
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>QRCode(id: id.toString())));
      }
      
   }
  }
         Future<void> From_date() async {
    var datetime = await showDatePicker(
                    context: context, 
                    initialDate: DateTime.now(), 
                    firstDate: DateTime(1100),
                    lastDate: DateTime(2101));
     setState(() {
     String dateo = datetime!.day.toString()+"-"+datetime.month.toString()+"-"+datetime.year.toString();
     date.text = dateo.toString();
     });   

    
 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/Appointment.png'),fit: BoxFit.cover,)
        ),
        width: Size.infinite.height,
        height: Size.infinite.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
                Container(
                  width: 300,
                  child: LottieBuilder.asset('assets/images/leave_animation.json')),
                Container(
                        padding: EdgeInsets.all(10),
                         child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: impColor)),
                            label: Text("Enter Email"),
                            hintText: "Enter Email"),
                      ),
                       ),
                Container(
                        padding: EdgeInsets.all(10),
                         child: TextField(
                          controller: age,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: impColor)),
                            label: Text("Enter age"),
                            hintText: "Enter age"),
                      ),
                       ),
                Container(
                        padding: EdgeInsets.all(10),
                         child: TextField(
                          controller: date,
                          
                          keyboardType: TextInputType.number,
                          
                          decoration: InputDecoration(
                          suffixIcon: IconButton(onPressed: ()=>{
                            From_date()
                          },icon: Icon(Icons.date_range),),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: impColor)),
                            label: Text("Select Date"),
                            hintText: "Enter Date"),
                          
                      ),
                       ),
                Container(
                        padding: EdgeInsets.all(10),
                         child: TextField(
                          controller: address,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: impColor)),
                            label: Text("Enter Your Address"),
                            hintText: "Enter Address"),
                      ),
                       ),
           
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: Size.infinite.width,
                    padding: EdgeInsets.all(8),
                      decoration:  BoxDecoration(
              
                         border: Border.all(width: 1, color: Color.fromARGB(255, 65, 64, 64)),
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
               
                      child:DropdownButtonFormField(
                        decoration:  InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white))),
                         hint: Text("Select Department"),
                        items: departlist.map((e){
                          return DropdownMenuItem(
                            
                            value: e['id'],
                            child: Text(e['department_name']));
                        }).toList(), onChanged: (value) { 
                          setState(() {
                            department.text = value.toString();
                            
        
                          });
                         },
                        
                      
                      )
                    ),
                  ),
                
                        Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(top: 10),
                         child: FloatingActionButton(
                          onPressed: () {
                            appointmentfun(context);
                            },
                          heroTag: "First Appointment Screen",
                          backgroundColor: impColor,
                          child: Icon(Icons.keyboard_arrow_right,size: 35,),
                          
                          )
                       ),
            ],
          ),
        ),
      ),
    );
  }
  TextEditingController age = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController date = TextEditingController();
}