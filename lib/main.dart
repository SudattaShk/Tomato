import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tomato/Pages/LoginPage.dart';
import 'package:tomato/firebase/firebase_options.dart';

/// The entry point of the application.
Future<void> main() async {
  // Ensure that the Flutter binding is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with the default options for the current platform.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the application by calling the MyApp widget.
  runApp(MyApp());
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  /// Builds the root MaterialApp widget.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tomato Game',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,

      // The initial screen displayed when the application starts
      home: LoginPage(),
    );
  }
}
