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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // QR en la parte superior
            Center(
              child: PrettyQrView.data(
                data: qrData,
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
            const SizedBox(height: 20),
            // Información dentro de una Card
            Card(
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Detalles de la Visita',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildInfoRow(
                      icon: Icons.person,
                      label: 'Nombre',
                      value: nombre,
                    ),
                    _buildInfoRow(
                      icon: Icons.person_outline,
                      label: 'Apellido',
                      value: apellido,
                    ),
                    _buildInfoRow(
                      icon: Icons.badge,
                      label: 'Identidad',
                      value: identidad,
                    ),
                    _buildInfoRow(
                      icon: Icons.edit_note,
                      label: 'Motivo',
                      value: motivo,
                    ),
                    _buildInfoRow(
                      icon: Icons.calendar_today,
                      label: 'Fecha',
                      value: fecha,
                    ),
                    _buildInfoRow(
                      icon: Icons.access_time,
                      label: 'Hora',
                      value: hora,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para crear una fila de información con ícono
  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.orange,
            size: 28,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              '$label: $value',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
