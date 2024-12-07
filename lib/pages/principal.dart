import 'package:flutter/material.dart';
import 'package:myapp/pages/anunciar_visita.dart';
import 'package:myapp/pages/anuncios_page.dart';
import 'package:myapp/pages/delivery.dart';
import 'package:myapp/pages/encuestas.dart';
import 'package:myapp/pages/foro_page.dart';
import 'package:myapp/pages/gestionar_visitas.dart';
import 'package:myapp/widgets/profile.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
// Modificación en HomePage
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Parte superior naranja personalizada
          Stack(
            children: [
              ClipPath(
                clipper: CustomHeaderClipper(),
                child: Container(
                  color: Colors.orange,
                  height: 200,
                ),
              ),
              Positioned(
                top: 80,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    // Círculo con el texto "Access"
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'ACCESS',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'GESTIONES',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Botón de menú y perfil
              const Positioned(
                top: 40,
                left: 20,
                child: Icon(Icons.menu, color: Colors.white),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  ProfilePage()),
                    );
                  },
                  child: const Icon(Icons.person, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Opciones de gestión
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildOption(context, Icons.home, 'VISITAS', AnunciarVisita(onVisitaCreada: (Visita ) {  },)),
                  _buildOption(context, Icons.delivery_dining, 'DELIVERY', PantallaDelivery() ),
                  _buildOption(context, Icons.notifications, 'ANUNCIOS', const AnuncioPage() ),
                  _buildOption(context, Icons.chat, 'SUGERENCIAS', ForoPage() ),
                  _buildOption(context, Icons.calendar_month, 'GESTIÓN DE VISITAS', const GestionarVisitas() ),
                  _buildOption(context, Icons.bar_chart, 'ENCUESTAS', EncuestasPage() ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(BuildContext context, IconData icon, String label, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 30,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

// Clipper para la curva personalizada
class CustomHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2, size.height,
      size.width, size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

