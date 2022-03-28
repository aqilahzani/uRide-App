import 'package:flutter/material.dart';
import 'package:rider_app/AllScreens/mainscreen.dart';

class AboutScreen extends StatefulWidget
{
  static const String idScreen = "about";

  @override
  _MyAboutScreenState createState() => _MyAboutScreenState();
}

class _MyAboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        body: ListView(
          children: <Widget>[
            Container(
              height: 320,
              child: Center(
                child: Image.asset('images/logo.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 24, right: 24),
              child: Column(

                children: <Widget>[
                  Text(
                    'uRide',
                    style: TextStyle(
                        fontSize: 90, fontFamily: 'Signatra'),
                  ),
                  SizedBox(height: 20),
                  Text(
                      'This app has been developed by Aqilah Zani, '
                          'a final year student of Bachelor of Computer Science (Hons.)'
                          'Netcentric Computing (CS251) UiTM Melaka branch, Jasin Campus. '
                          'This app offer cheap rides at cheap rates for UiTM Jasin students',
                    style: TextStyle(fontFamily: "Brand Bold"),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),
            TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
                },
                child: const Text(
                    'Go Back',
                    style: TextStyle(
                        fontSize: 18, color: Colors.black
                    )
                ),
                // shape: RoundedRectangleBorder(
                //     borderRadius: new BorderRadius.circular(10.0))
            ),
          ],
        ));
  }
}