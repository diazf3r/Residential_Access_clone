import 'package:flutter/material.dart';
import 'package:myapp/pages/tipo_visita.dart';
import 'anunciar_visita.dart';
import 'visita.dart';

class GestionarVisitas extends StatefulWidget {
  const GestionarVisitas({super.key});

  @override
  _GestionarVisitasState createState() => _GestionarVisitasState();
}

class _GestionarVisitasState extends State<GestionarVisitas> {
  final List<Visita> visitas = []; // Lista de visitas agendadas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de Visitas'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de anunciar visita
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnunciarVisita(
                      onVisitaCreada: (visita) {
                        setState(() {
                          visitas.add(visita); // Agregar visita a la lista
                        });
                      },
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[300],
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
              ),
              child: const Text('Anunciar Visita'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (visitas.isEmpty) {
                  // Mensaje si no hay visitas agendadas
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No hay visitas agendadas aún.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }

                // Navegar a la pantalla de visitas agendadas
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VisitasAgendadas(
                      visitas: visitas,
                      onVisitaEliminada: (index) {
                        setState(() {
                          visitas.removeAt(index); // Eliminar visita
                        });
                      },
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[300],
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
              ),
              child: const Text('Ver Visitas Generadas'),
            ),
          ],
        ),
      ),
    );
  }
}
