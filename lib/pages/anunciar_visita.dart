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
      backgroundColor: const Color.fromARGB(255, 250, 171, 81),
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

            // Botón para Anunciar la Visita
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VisitaCreada(),
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
                backgroundColor: Colors.orange[700],
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