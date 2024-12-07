import 'package:flutter/material.dart';
import 'package:myapp/pages/visita.dart';
import 'package:myapp/widgets/inputs.dart';

class AnunciarVisita extends StatelessWidget {
  AnunciarVisita({super.key});

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController identidadController = TextEditingController();
  final TextEditingController motivoController = TextEditingController();
  final TextEditingController fechaController = TextEditingController();
  final TextEditingController horaController = TextEditingController();
  final formKey = GlobalKey<FormState>();

    // Focus nodes para rastrear cada campo
  final FocusNode nombreFocusNode = FocusNode();
  final FocusNode apellidoFocusNode = FocusNode();
  final FocusNode identidadFocusNode = FocusNode();
  final FocusNode motivoFocusNode = FocusNode();
  final FocusNode fechaFocusNode = FocusNode();
  final FocusNode horaFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
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
                    'Anunciar Visita',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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

            // Campo Motivo
            CampoMotivo(
              motivoController: motivoController,
              focusNode: motivoFocusNode,
            ),
            const SizedBox(height: 30),

            // Campo Fecha
            CampoFecha(
              fechaController: fechaController,
            ),
            const SizedBox(height: 30),

            // Campo Hora
            CampoHora(
              horaController: horaController,
            ),
            const SizedBox(height: 30),

                const SizedBox(height: 30),
                ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    // Mostrar un mensaje emergente de confirmación
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('¡La visita ha sido anunciada correctamente!'),
                        duration: Duration(seconds: 2), // Duración del mensaje
                      ),
                    );

                    // Navegar a la pantalla de detalles
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VisitaCreada(
                          nombre: nombreController.text,
                          apellido: apellidoController.text,
                          identidad: identidadController.text,
                          motivo: motivoController.text,
                          fecha: fechaController.text,
                          hora: horaController.text,
                        ),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Campos incompletos'),
                        content: const Text(
                          'Por favor, complete todos los campos correctamente antes de continuar.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Cerrar'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[200],
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
