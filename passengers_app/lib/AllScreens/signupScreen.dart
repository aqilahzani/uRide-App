import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rider_app/AllScreens/loginScreen.dart';
import 'package:rider_app/AllScreens/mainscreen.dart';
import 'package:rider_app/AllWidgets/progressDialog.dart';
import 'package:rider_app/main.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget
{
  static const String idScreen = "signup";

  TextEditingController nameTextEditingController =  TextEditingController();
  TextEditingController emailTextEditingController =  TextEditingController();
  TextEditingController phoneTextEditingController =  TextEditingController();
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
                SizedBox(height: 5.0,),
                Image(
                  image: AssetImage("images/logo.png"),
                  width: 390.0,
                  height: 230.0,
                  alignment: Alignment.center,
                ),

                SizedBox(height: 1.0,),
                Text(
                  "Signup as a Passenger",
                  style: TextStyle(fontSize: 24.0, fontFamily: "Brand-Regular", fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),

                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [

                      SizedBox(height: 1.0,),
                      TextField(
                        controller: nameTextEditingController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Name",
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
                        controller: phoneTextEditingController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Phone",
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
                          if(nameTextEditingController.text.length < 3)
                          {
                            displayToastMessage("Name must be at least 3 characters", context);
                          }
                          else if(!emailTextEditingController.text.contains("@"))
                          {
                            displayToastMessage("Email address is not valid", context);
                          }
                          else if(phoneTextEditingController.text.isEmpty)
                          {
                            displayToastMessage("Phone Number is Mandatory", context);
                          }
                          else if(passwordTextEditingController.text.length < 6)
                          {
                            displayToastMessage("Password must be at least 3 characters", context);
                          }
                          else
                            {
                              registerNewUser(context);
                            }

                        },
                        child: const Text('Create Account'),
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
                    Navigator.pushNamedAndRemoveUntil(context, LoginScreen.idScreen, (route) => false);
                  },
                  child: Text(
                      "Already have an Account? Login Here",
                       style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context)
        {
          return ProgressDialog(message: "Registering, Please wait",);
        }
    );

    final User firebaseUser =
    (
        await firebaseAuth.createUserWithEmailAndPassword
        (
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text
        ).catchError((errMsg)
    {
      Navigator.pop(context);
      displayToastMessage("Error: " + errMsg.toString(), context);
    })).user;

    if(firebaseUser != null) //user created
      {
        //user info saved in DB
        Map userDataMap =
        {
          "name": nameTextEditingController.text.trim(),
          "email": emailTextEditingController.text.trim(),
          "phone": phoneTextEditingController.text.trim(),
        };

        usersRef.child(firebaseUser.uid).set(userDataMap);
        displayToastMessage("Your account has been created", context);

        Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
      }
    else
      {
        Navigator.pop(context);
        //error occurred - display error msg
        displayToastMessage("New user account not created.", context);
      }
  }
}

displayToastMessage(String message, BuildContext context)
{
  Fluttertoast.showToast(msg: message);
}