import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_healthtech/HomePage.dart';
import 'package:project_healthtech/SharePref.dart';
import 'package:project_healthtech/colors.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainPage(),
  ));
}
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void login(){
    if(nameController.text.toString().isEmpty && phoneController.text.toString().isEmpty){
      print("Data is Empty");
    }
    else{
      Sharepref().setID(nameController.text.toString(), phoneController.text.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/Next_Page.png'),fit: BoxFit.cover,)
        ),
        width: Size.infinite.height,
        height: Size.infinite.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 0,
              child: LottieBuilder.asset('assets/images/leave_animation.json')),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                                    
                     GestureDetector(
                      onTap: () {
                        Sharepref().removeall();
                      },
                       child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(top: 50),
                         child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: impColor)),
                            label: Text("Enter Name"),
                            hintText: "Enter Name"),
                                         ),
                       ),
                     ),
                                    
                     Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(top: 10),
                       child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide(
                            color: impColor
                          )),
                          label: Text("Enter Phone"),
                          hintText: "Enter Phone"),
                    ),
                     ),
                     
                     Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(top: 10),
                       child: FloatingActionButton(
                        onPressed: () {
                         login();
                          },
                        heroTag: "First Screen Tag",
                        backgroundColor: impColor,
                        child: Icon(Icons.keyboard_arrow_right,size: 35,),
                        
                        )
                     ),
                  
                ],
              )),
          
          ],
        ),
      ),
    );
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
}
