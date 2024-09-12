import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_signin/firebase_options.dart';
import 'package:flutter_signin/screen/homescreen.dart';
import 'package:flutter_signin/screen/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends HookWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user != null) {
          navigatorKey.currentState!.pushReplacement(
              MaterialPageRoute(builder: (context) => const Homescreen()));
        } else {
          navigatorKey.currentState!.pushReplacement(
              MaterialPageRoute(builder: (context) => const SignUpPage()));
        }
      });

      return null;
    }, []);

    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const SignUpPage(),
    );
  }
}
