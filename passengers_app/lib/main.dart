import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/AllScreens/aboutScreen.dart';
import 'package:rider_app/AllScreens/editProfileScreen.dart';
import 'package:rider_app/AllScreens/loginScreen.dart';
import 'package:rider_app/AllScreens/mainscreen.dart';
import 'package:rider_app/AllScreens/profileTabPage.dart';
import 'package:rider_app/AllScreens/signupScreen.dart';
import 'package:rider_app/DataHandler/appData.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

DatabaseReference usersRef = FirebaseDatabase.instance.reference ().child("users");
DatabaseReference driversRef = FirebaseDatabase.instance.reference().child("drivers");
DatabaseReference rideRequestRef = FirebaseDatabase.instance.reference().child("Ride Requests");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'uRide',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: FirebaseAuth.instance.currentUser == null ? LoginScreen.idScreen : MainScreen.idScreen,
        routes:
        {
          SignupScreen.idScreen: (context) => SignupScreen (),
          LoginScreen.idScreen: (context) => LoginScreen (),
          MainScreen.idScreen: (context) => MainScreen (),
          AboutScreen.idScreen: (context) => AboutScreen(),
          EditProfile.idScreen: (context) => EditProfile(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


