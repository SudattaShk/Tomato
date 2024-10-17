import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Auth import
import 'package:tomato/Pages/LoginPage.dart';
import 'package:tomato/Pages/HomePage.dart'; // Assume you have a HomePage
import 'package:tomato/firebase/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tomato Game',
      theme: ThemeData(
        // Set Minecraft as the default font for the whole app
        fontFamily: 'Minecraft',
        primarySwatch: Colors.red,
        primaryColor: Color(0xFFFFCBCB), // Hex color for primary color
        scaffoldBackgroundColor: Color(0xFFFFCBCB), // Set scaffold background color
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF9B111E), // AppBar background color set to #9B111E
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF9B111E), // Set regular button color to #9B111E
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF9B111E), // Set ElevatedButton background color to #9B111E
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: AuthCheck(), // New widget to check authentication status
    );
  }
}

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use FirebaseAuth instance to check if the user is already signed in
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // If Firebase returns a user, go to HomePage
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return LoginPage(); // Show login page if no user is logged in
          } else {
            return HomePage(); // Navigate to home page if user is logged in
          }
        }

        // While checking auth state, show loading spinner
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
