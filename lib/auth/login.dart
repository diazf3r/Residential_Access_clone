import 'package:flutter/material.dart';
import 'package:myapp/auth/auth.dart';
import 'package:myapp/pages/principal.dart';
import 'package:myapp/widgets/custom_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Spacer(),
                const Text("Login",
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
                const SizedBox(height: 50),
                CustomInput(
                  controlador: _email,
                  dialogo: "Email",
                ),
                const SizedBox(height: 20),
                CustomInput(
                  controlador: _password,
                  dialogo: "Password",
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () => _login(),
                  child: const Text('Iniciar sesion'),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );

  _login() async {
    final user =
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      goToHome(context);
    }
  }
}
