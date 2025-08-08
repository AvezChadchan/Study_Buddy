import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:studybuddy/firebase_options.dart';
import 'package:studybuddy/screens/home_screen.dart';
import 'package:studybuddy/screens/login_screen.dart';
import 'package:studybuddy/screens/registration_screen.dart';
import 'package:studybuddy/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider()..checkAuthState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'StudyBuddy',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/login',
        routes: {
          '/login': (context) =>  LoginScreen(),
          '/home': (context) =>  HomeScreen(),
          '/register': (context) => const RegistrationScreen(),
        },
      ),
    );
  }
}