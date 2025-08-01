import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy/screens/login_screen.dart';
import 'package:studybuddy/screens/registration_screen.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: RegistrationScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
    @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(

   );
  }
}
