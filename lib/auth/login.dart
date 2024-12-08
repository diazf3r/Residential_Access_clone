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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 214, 171, 106), Colors.white],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 50),
                CustomInput(
                  controller: _email,
                  label: "Correo",
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El correo es obligatorio';
                    }

                    if (!value.contains('@')) {
                      return 'El correo no es válido';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomInput(
                  controller: _password,
                  label: "Contraseña",
                  icon: Icons.lock,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese la contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => _login(),
                  child: const Text('Iniciar Sesión'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  goToHome() => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );

  _login() async {
    final user =
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      goToHome();
    }
  }
}
