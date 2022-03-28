import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/AllScreens/mainscreen.dart';
import 'package:rider_app/AllScreens/signupScreen.dart';
import 'package:rider_app/AllWidgets/progressDialog.dart';
import 'package:rider_app/main.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget
{
  static const String idScreen = "login";

  TextEditingController emailTextEditingController =  TextEditingController();
  TextEditingController passwordTextEditingController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30.0,),
              Image(
                image: AssetImage("images/logo.png"),
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
              
              SizedBox(height: 1.0,),
              Text(
                "Login as Passenger",
                style: TextStyle(fontSize: 24.0, fontFamily: "Brand-Regular", fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              
              Padding(
                  padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 1.0,),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontSize: 18.0,
                          fontFamily: "Brand-Regular",
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 18.0, fontFamily: "Brand-Regular"),
                    ),

                    SizedBox(height: 1.0,),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 18.0,
                          fontFamily: "Brand-Regular",
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 18.0, fontFamily: "Brand-Regular"),
                    ),

                    SizedBox(height: 16.0,),
                    ElevatedButton(
                      onPressed: ()
                      {
                        if(!emailTextEditingController.text.contains("@"))
                        {
                          displayToastMessage("Email address is not valid", context);
                        }
                        else if(passwordTextEditingController.text.length < 6)
                        {
                          displayToastMessage("Password must be at least 6 characters", context);
                        }
                        else
                        {
                          loginAndAunthenticateUser(context);
                        }
                      },
                      child: const Text('Login'),
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          primary: Colors.deepPurple,
                          fixedSize: const Size(300, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),

                  ],
                ),
              ),

              TextButton(
                onPressed: ()
                {
                  Navigator.pushNamedAndRemoveUntil(context, SignupScreen.idScreen, (route) => false);
                },
                child: Text(
                  "Do not have an Account? Register Here",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  final FirebaseAuth fAuth = FirebaseAuth.instance;
  void loginAndAunthenticateUser(BuildContext context) async
  {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context)
      {
        return ProgressDialog(message: "Login, Please wait",);
      }
    );

    final User firebaseUser = (await fAuth
        .signInWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text
    ).catchError((errMsg){
      Navigator.pop(context);
      displayToastMessage ("Error: " + errMsg.toString(), context);
    })).user;

    if(firebaseUser != null) //user created
    {
      usersRef.child(firebaseUser.uid).once().then((DataSnapshot snap) {
        if(snap.value != null)
        {
          Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen , (route) => false);
          displayToastMessage("You are logged in", context);
        }
        else
        {
          Navigator.pop(context);
          fAuth.signOut();
          displayToastMessage("Account not found", context);
        }
      });
    }
    else
    {
      Navigator.pop(context);
      //error occurred - display error msg
      displayToastMessage("Error occurred", context);
    }
  }
}

