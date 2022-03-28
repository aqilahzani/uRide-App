import 'package:drivers_app/AllScreens/loginScreen.dart';
import 'package:drivers_app/AllScreens/mainscreen.dart';
import 'package:drivers_app/tabsPages/profileTabPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../configMaps.dart';
import '../main.dart';

class EditProfile extends StatefulWidget
{
  static const String idScreen = "EditProfile";
  final String currentUserId;

  EditProfile({this.currentUserId});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              driversInformation.name.toUpperCase(),
              style: TextStyle(
                fontSize: 65.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Signatra',
              ),
            ),

            Text(
              title + " " + driversInformation.email,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blueGrey[200],
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Brand-Regular'
              ),
            ),

            SizedBox(
              height: 10,
              width: 200,
              child: Divider(
                color: Colors.white,
              ),
            ),

            SizedBox(height: 20.0,),

            InfoCard(
              text: driversInformation.phone,
              icon: Icons.phone,
              onPressed: () async {
                print("This is phone.");
              },
            ),

            InfoCard(
              text: driversInformation.car_model,
              icon: Icons.directions_car_rounded,
              onPressed: () async {
                print("This is car model.");
              },
            ),

            InfoCard(
              text: driversInformation.car_color,
              icon: Icons.directions_car_rounded,
              onPressed: () async {
                print("This is car color.");
              },
            ),

            InfoCard(
              text: driversInformation.car_number,
              icon: Icons.directions_car_rounded,
              onPressed: () async {
                print("This is car number.");
              },
            ),

            //update profile
            GestureDetector(
              onTap: ()
              {
                Navigator.pushNamedAndRemoveUntil(context, EditProfile.idScreen, (route) => false);
              },
              child: Card(
                color: Colors.blueAccent,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 110.0),
                child: ListTile(
                  trailing: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Update Profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: 'Brand Bold',
                    ),
                  ),
                ),
              ),
            ),

            //sign out
            GestureDetector(
              onTap: ()
              async {
                var tableRef = usersRef.child("users");
                await tableRef.child(firebaseUser.uid).remove();
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(context, LoginScreen.idScreen, (route) => false);
              },
              child: Card(
                color: Colors.blueAccent,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 110.0),
                child: ListTile(
                  trailing: Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Delete Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: 'Brand Bold',
                    ),
                  ),
                ),
              ),
            ),

            //go back
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
        ),
      ),

    );
  }
}
