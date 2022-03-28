2202 CS251 NURUL AQILAH BINTI MUHAMMAD ZANI

E-Hailing Application for UiTM Jasin Students Using Geolocation
---------------------------------------------------------------

This project is an e-hailing application which is a transportation network application and its done with the flutter frame work.
It allows passengers to submit trip request which is then routed to drivers who use their own cars.

The app implements some of the main features of:
Signup, login and logout
- Request a driver
- Check passenger request (distance, location)
- Get direction to the passenger who request an driver
- Get position of the driver and passenger in real time

## Setup Guide
### Setup firebase
- Add a new project your [Firebase console](https://console.firebase.google.com/)
- Add a new Android application, you have to do add 2 applicatitons, driver and passenger one.
- Then go to the project settings > Cloud Messaging. On this tab you will copy the Server Key. You will put that key in common/ConfigApp.java file on CLOUD_MESSAGING_SERVER_GEY constant on passenger and driver apps

### Setup Google APIs
- Go to your [Google cloud platform](https://console.cloud.google.com/) and select your project or create a new project.
- Search and active this API keys:
    - Geocoding API
	- Places API
	- Token Service API
	- Places SDK for Android
	- Maps SDK for Android
	- Directions API
	- Cloud Messaging			
	- Firebase Installations API
- Go to your Credentials, create an API Key 
- You will put that API key in common/ConfigApp.java file on GOOGLE_API_KEY constant on driver and passenger apps


## Link
* [Font](https://drive.google.com/drive/folders/1bGN23KcIfei0NEC1BUtEO4B8EhbKYugo?usp=sharing)
* [Image](https://drive.google.com/drive/folders/1K-TE_rdhfpOL93vLhlQ9L09AgftZ4vl8?usp=sharing)
