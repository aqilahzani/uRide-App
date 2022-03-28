import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/AllScreens/mainscreen.dart';
import 'package:rider_app/AllScreens/profileTabPage.dart';
import 'package:rider_app/AllScreens/signupScreen.dart';
import 'package:rider_app/Models/allUsers.dart';
import '../configMaps.dart';
import '../main.dart';

class EditProfile extends StatefulWidget
{
  static const String idScreen = "EditProfile";
  // final String currentUserId;
  //
  // EditProfile({this.currentUserId});
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Users user;
  TextEditingController emailTextEditingController =  TextEditingController();
  TextEditingController passwordTextEditingController =  TextEditingController();
  TextEditingController phoneTextEditingController =  TextEditingController();

  @override
  void initState() {
    super.initState();
    //getUser();
  }
  // getUser() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //   DocumentSnapshot doc = await usersRef.doc(widget.currentUserId).get();
  //   user = User.fromDocument(doc);
  //   displayNameController.text = user.displayName;
  //   bioController.text = user.bio;
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
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

            //Update Profile
            ElevatedButton(
              onPressed: ()
              {
                displayToastMessage("Profile Updated", context);
                //Navigator.pushNamedAndRemoveUntil(context, EditProfile.idScreen, (route) => false);
              },
              child: const Text('Update Profile'),
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  primary: Colors.deepPurple,
                  fixedSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),),

            SizedBox(height: 10),

            //Delete account
            ElevatedButton(
              onPressed: () async {
              var tableRef = usersRef.child("users");
              await tableRef.child(firebaseUser.uid).remove();
              FirebaseAuth.instance.signOut();
            },
                child: const Text('Delete Account'),
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  primary: Colors.deepPurple,
                  fixedSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),),

            SizedBox(height: 10),

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
  //edit
  // Widget _buildTextFormFliedPart() {
  //   return Container(
  //     height: double.infinity,
  //     width: double.infinity,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         TextField(
  //           controller: nameTextEditingController,
  //           keyboardType: TextInputType.text,
  //           decoration: InputDecoration(
  //             labelText: "Name",
  //             labelStyle: TextStyle(
  //               fontSize: 18.0,
  //               fontFamily: "Brand-Regular",
  //             ),
  //             hintStyle: TextStyle(
  //               color: Colors.grey,
  //               fontSize: 16.0,
  //             ),
  //           ),
  //           style: TextStyle(fontSize: 18.0, fontFamily: "Brand-Regular"),
  //         ),
  //
  //         TextField(
  //           controller: emailTextEditingController,
  //           keyboardType: TextInputType.emailAddress,
  //           decoration: InputDecoration(
  //             labelText: "Email",
  //             labelStyle: TextStyle(
  //               fontSize: 18.0,
  //               fontFamily: "Brand-Regular",
  //             ),
  //             hintStyle: TextStyle(
  //               color: Colors.grey,
  //               fontSize: 16.0,
  //             ),
  //           ),
  //           style: TextStyle(fontSize: 18.0, fontFamily: "Brand-Regular"),
  //         ),
  //
  //         TextField(
  //       controller: phoneTextEditingController,
  //       keyboardType: TextInputType.phone,
  //       decoration: InputDecoration(
  //         labelText: "Phone",
  //         labelStyle: TextStyle(
  //           fontSize: 18.0,
  //           fontFamily: "Brand-Regular",
  //         ),
  //         hintStyle: TextStyle(
  //           color: Colors.grey,
  //           fontSize: 16.0,
  //         ),
  //       ),
  //       style: TextStyle(fontSize: 18.0, fontFamily: "Brand-Regular"),
  //     ),
  //       ],
  //     ),
  //   );
  // }

  // void userDetailUpdate() async {
  //   Firebase.instance.collection("Users").doc(firebaseUser.uid).update({
  //     "Name": nameTextEditingController.text,
  //     "Phone Number": phoneTextEditingController.text,
  //     "Email": emailTextEditingController.text
  //   });
  //   setState(() {
  //     edit = false;
  //   });
  // }

}
