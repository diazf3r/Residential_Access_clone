import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/widgets/inputs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AnunciarVisita extends StatelessWidget {
  final Function(Visita) onVisitaCreada;

  AnunciarVisita({super.key, required this.onVisitaCreada});

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController identidadController = TextEditingController();
  final TextEditingController motivoController = TextEditingController();
  final TextEditingController fechaController = TextEditingController();
  final TextEditingController horaController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final FocusNode nombreFocusNode = FocusNode();
  final FocusNode apellidoFocusNode = FocusNode();
  final FocusNode identidadFocusNode = FocusNode();
  final FocusNode motivoFocusNode = FocusNode();
  final FocusNode fechaFocusNode = FocusNode();
  final FocusNode horaFocusNode = FocusNode();

  final CollectionReference visitasCollection = FirebaseFirestore.instance.collection('visitas');

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
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
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      final nuevaVisita = Visita(
                        nombre: nombreController.text,
                        apellido: apellidoController.text,
                        identidad: identidadController.text,
                        motivo: motivoController.text,
                        fecha: fechaController.text,
                        hora: horaController.text,
                      );

                      onVisitaCreada(nuevaVisita);
                      
                      visitasCollection.add({
                        'nombre': nuevaVisita.nombre,
                        'apellido': nuevaVisita.apellido,
                        'identidad': nuevaVisita.identidad,
                        'motivo': nuevaVisita.motivo,
                        'fecha': nuevaVisita.fecha,
                        'hora': nuevaVisita.hora,
                        'creado_por': FirebaseAuth.instance.currentUser!.uid,
                        'createdDate' : DateTime(now.year, now.month, now.day),
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('¡La visita ha sido anunciada correctamente!'),
                          duration: Duration(seconds: 2),
                        ),
                      );

                      Navigator.pop(context);
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

class Visita {
  final String nombre;
  final String apellido;
  final String identidad;
  final String motivo;
  final String fecha;
  final String hora;

  Visita({
    required this.nombre,
    required this.apellido,
    required this.identidad,
    required this.motivo,
    required this.fecha,
    required this.hora,
  });

    factory Visita.fromJson(Map<String, dynamic> json) {
    return Visita(
      nombre: json['nombre'],
      apellido: json['apellido'],
      identidad: json['identidad'],
      motivo: json['motivo'],
      fecha: json['fecha'],
      hora: json['hora'],
    );
  }
}
