import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:studybuddy/firebase_options.dart';
import 'package:studybuddy/screens/group_creation_screen.dart';
import 'package:studybuddy/screens/home_screen.dart';
import 'package:studybuddy/screens/login_screen.dart';
import 'package:studybuddy/screens/registration_screen.dart';
import 'package:studybuddy/providers/auth_provider.dart';
import 'package:studybuddy/providers/group_provider.dart';
import 'package:studybuddy/models/group_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    // androidDebugToken: 'D4ADE873-0E2E-42DC-9E2E-C85C7E1E11B1', // Uncomment if needed
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()..checkAuthState()),
        ChangeNotifierProvider(create: (context) => GroupProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'StudyBuddy',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/login',
        routes: {
          '/login': (context) =>  LoginScreen(),
          '/home': (context) =>  HomeScreen(),
          '/register': (context) =>  RegistrationScreen(),
          '/creategroup':(context)=>GroupCreationScreen(),
         },
      ),
    );
  }
}