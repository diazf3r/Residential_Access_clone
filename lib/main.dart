import 'package:flutter/material.dart';
import 'package:myapp/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/pages/principal.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
        onGenerateRoute: (settings) {
          return null;
        });
  }
}
