import 'package:flutter/material.dart';
import 'package:rider_app/AllScreens/editProfileScreen.dart';
import 'package:rider_app/configMaps.dart';
import 'mainscreen.dart';

class ProfileTabPage extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              userCurrentInfo.name.toUpperCase(),
              style: TextStyle(
                fontSize: 65.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Signatra',
              ),
            ),

            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.white,
              ),
            ),

            SizedBox(height: 40.0,),

            InfoCard(
              text: userCurrentInfo.phone,
              icon: Icons.phone,
              onPressed: () async {
                print("This is phone.");
              },
            ),

            InfoCard(
              text: userCurrentInfo.email,
              icon: Icons.email,
              onPressed: () async {
                print("This is email.");
              },
            ),
            SizedBox(height: 10),

            //update profile
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, EditProfile.idScreen, (route) => false);
                },
                child: const Text('Update Profile'),
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  primary: Colors.deepPurple,
                  fixedSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),),

            SizedBox(height: 10),
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




class InfoCard extends StatelessWidget
{
  final String text;
  final IconData icon;
  Function onPressed;

  InfoCard({this.text, this.icon, this.onPressed,});

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.black87,
          ),
          title: Text(
            text,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
              fontFamily: 'Brand Bold',
            ),
          ),
        ),
      ),
    );
  }
}

