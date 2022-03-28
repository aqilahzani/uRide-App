import 'package:firebase_auth/firebase_auth.dart';
import 'package:rider_app/Models/allUsers.dart';

String mapKey = "AIzaSyBSeox9GKDoDcWDdPbi7OOwJDSedCvye1g";

User firebaseUser;

Users userCurrentInfo;

int driverRequestTimeOut = 40;
String statusRide = "";
String rideStatus = "Driver is Coming";
String carDetailsDriver = "";
String driverName = "";
String driverphone = "";

double starCounter=0.0;
String title="";

String serverToken = "key=AAAAXKERnS4:APA91bFO56O6eWmx7W8fS-am-0T5xN3NlhhyqS97Ao4-IXZ0ijqM3hXazVAbW5MHjcA7SUjlSz5bJwffj9LNJKhdsiNKU00vQRt16M1-DDI9lTdzBEBouCnppN3RAKiNaUzvHRuG8X5Q";