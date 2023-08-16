import 'package:flutter/material.dart';

import '../face_detection_screen/face_detection.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Padding(
        padding: const EdgeInsets.symmetric( vertical: 70.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset('assets/images/face.png',
                height: 250
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text('Welcome !',
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 25.0,
                 fontFamily: 'Lilita One',
               ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal : 15.0),
                child: Text('Face Detection App can help you to know how many Faces in photo using Ai .  ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.5,
                    fontFamily: 'Lilita One',
                  ),
                ),
              ),
               SizedBox(
                 height: 35.0,
               ),
               MaterialButton(
                 onPressed: ()
                 {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) =>  FaceDetectionScreen()),
                   );
                 },
                 child: Container(
                   decoration: BoxDecoration(
                     color: Colors.cyanAccent,

                     borderRadius: BorderRadius.circular(40.0),
                   ),
                  width: 110,
                  height: 65.0,
                  child: Center(
                      child: Text(
                        'let\'s go',
                        style: TextStyle(
                            fontFamily: 'Lilita One',

                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
              ),
               ),


            ],
          ),
        ),
      ),
      // body: Stack(
      //   children: [
      //     Container(
      //       height: double.infinity,
      //       width: double.infinity,
      //
      //       child: Image.asset('assets/images/faceDetection.jpg',
      //         fit: BoxFit.cover,
      //       ),
      //
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(vertical : 70.0 , horizontal: 20),
      //       child: Column(
      //         children: [
      //           Text('Welcome'
      //             ,style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 50.0
      //             ),),
      //
      //
      //         ],
      //       ),
      //     ),
      //
      //
      //   ],
      // ),
    );
  }
}
