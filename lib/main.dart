
import 'package:dartaholics/Screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'Screens/login_screen.dart';
import 'Screens/signup_screen.dart';
import 'firebase_options.dart';
import 'providers/google_sign_in.dart';
import 'services/auth.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider.value(
          value: AuthServices().user  ,
          initialData: null,
        ),
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
      ],
      child:MaterialApp(
      routes: {
        '/': (context) => const WelcomePage(),
        '/login':(context) => Login(),
        '/sign-Up':(context) => SignUp(),
        // '/home': (context) =>
        // '/event-timeline':(context) =>
        // '/event-description': (context) =>
        // '/voice-meetings':(context) => 
        // '/user-list' :(context) => 
      },),
    );
  }
}