import "package:flutter/material.dart";
class VisitaCreada extends StatelessWidget {
  final String nombre;
  final String apellido;
  final String identidad;
  final String motivo;
  final String fecha;
  final String hora;

  const VisitaCreada({
    super.key,
    required this.nombre,
    required this.apellido,
    required this.identidad,
    required this.motivo,
    required this.fecha,
    required this.hora,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visita creada'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: $nombre', style: const TextStyle(fontSize: 18)),
            Text('Apellido: $apellido', style: const TextStyle(fontSize: 18)),
            Text('DNI: $identidad', style: const TextStyle(fontSize: 18)),
            Text('Motivo: $motivo', style: const TextStyle(fontSize: 18)),
            Text('Fecha: $fecha', style: const TextStyle(fontSize: 18)),
            Text('Hora: $hora', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
