import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:project_healthtech/AppointmentPage.dart';
import 'package:project_healthtech/SharePref.dart';
import 'package:project_healthtech/colors.dart';
import 'package:project_healthtech/show_popul.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
      String name = '';
      String phone = '';
  Future<void> getsavedata() async {
     final String nameget = await Sharepref().getname();
     final String phoneget = await Sharepref().getphone();
     setState(() {
       name = nameget;
       phone = phoneget;
     });
    
  }    

  @override 
  void initState() {
    getsavedata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/Home_Page.png'),fit: BoxFit.cover,)
        ),
        width: Size.infinite.height,
        height: Size.infinite.height,
        child: Column(
          children: [
             Expanded(
              
              child: Column(
                mainAxisAlignment:  MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 70),
                  alignment: Alignment.centerLeft,
                  child: Text("Welcome",style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w500),)),
                Container(
                  padding: EdgeInsets.all(5),
                             alignment: Alignment.centerLeft,
                  child: Text(name,style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w800),)),

              ],
             )),
          Expanded(
            flex: 2,
            child:  Container(
            padding: EdgeInsets.all(10),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,          
              children: [
               
                  GestureDetector(
                    onTap: () async =>
                    {
                     Navigator.push(context, new MaterialPageRoute(builder: (context)=>AppointmentPage()))
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(25),
                          
                          decoration: BoxDecoration(
                            color: impColor,
                            borderRadius: BorderRadius.circular(20)),
                          child: Image.asset('assets/images/health.png'),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                         
                          child: Text("Make \nAppointment",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  ),
                
           GestureDetector(
                    onTap: ()=>{print("object")},
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(25),
                          
                          decoration: BoxDecoration(
                            color: impColor,
                            borderRadius: BorderRadius.circular(20)),
                          child: Image.asset('assets/images/handshake.png'),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(bottom: 28),
                          child: Text("Help",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  ),
                
              ],
             ),
           ),
           ),
          
          ],
        ),
      ),
    );
  }
}