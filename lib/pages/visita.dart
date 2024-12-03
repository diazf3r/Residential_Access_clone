import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

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
    // Datos para el QR en formato combinado.
    final qrData =
        'Nombre: $nombre\nApellido: $apellido\nIdentidad: $identidad\nMotivo: $motivo\nFecha: $fecha\nHora: $hora';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Visita Creada'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Detalles de la Visita',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text('Nombre: $nombre', style: const TextStyle(fontSize: 18)),
            Text('Apellido: $apellido', style: const TextStyle(fontSize: 18)),
            Text('Identidad: $identidad', style: const TextStyle(fontSize: 18)),
            Text('Motivo: $motivo', style: const TextStyle(fontSize: 18)),
            Text('Fecha: $fecha', style: const TextStyle(fontSize: 18)),
            Text('Hora: $hora', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text(
              'Código QR generado:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Center(
              child: PrettyQrView.data(
                data: qrData, // Genera el QR con los datos.
                errorCorrectLevel: QrErrorCorrectLevel.H,
                decoration: const PrettyQrDecoration(
                  shape: PrettyQrSmoothSymbol(),
                  image: PrettyQrDecorationImage(
                    image: AssetImage('images/flutter.png'),
                    position: PrettyQrDecorationImagePosition.embedded,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}