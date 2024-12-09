import 'package:flutter/material.dart';
import 'package:myapp/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/pages/foro_page.dart';
import 'package:myapp/pages/principal.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
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
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    return MaterialApp(
      title: 'Access Clone',
      debugShowCheckedModeBanner: false,
      // home: user != null ? const HomePage() : const LoginScreen(),
      home: ForoPage(),
      onGenerateRoute: (settings) {
        return null;
      },
    );
  }
}
