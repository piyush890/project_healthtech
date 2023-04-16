import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:native_screenshot/native_screenshot.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';


class QRCode extends StatefulWidget {
  var id;
   QRCode({super.key,required this.id});

  @override
  State<QRCode> createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  ScreenshotController screenshotController = ScreenshotController(); 

    Uint8List? _imageFile;
  String im = 'assets/images/Appointment.png';
Future<void> screen() async {
final path = await screenshotController.capture();
  setState(() {
   print(path);
  });
}
@override
  void initState() {
    screen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(im),fit: BoxFit.cover,)
        ),
        width: Size.infinite.height,
        height: Size.infinite.height,
        child: Column(
          children: [
              Expanded(
                flex: 0,

                child: LottieBuilder.asset('assets/images/leave_animation.json')),
             Container(
              child: QrImage(
                data: widget.id,
                size: 300,
                )
             )
             
          ],
        ),
      ),
    );
  }
}