import 'package:flutter/material.dart';
import 'package:myapp/src/pages/visita.dart';
import 'package:myapp/src/widgets/inputs.dart';

class AnunciarVisita extends StatelessWidget {
  AnunciarVisita({super.key});

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController identidadController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Focus nodes para rastrear cada campo
  final FocusNode nombreFocusNode = FocusNode();
  final FocusNode apellidoFocusNode = FocusNode();
  final FocusNode identidadFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sin fondo de pantalla, color de fondo por defecto
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 60),

                const Center(
                  child: Text(
                    'Anunciar visita',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Cambia el color si es necesario
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),

                // Campo Nombre
                CampoNombre(
                  nombreController: nombreController,
                  focusNode: nombreFocusNode,
                ),
                const SizedBox(height: 30),

                // Campo Apellido
                CampoApellido(
                  apellidoController: apellidoController,
                  focusNode: apellidoFocusNode,
                ),
                const SizedBox(height: 30),

                // Campo DNI
                CampoIdentidad(
                  identidadController: identidadController,
                  focusNode: identidadFocusNode,
                ),
                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VisitaCreada()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    '¡Anunciar Visita!',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
