import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar del perfil
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/avatar.jpg'), // Imagen local
                backgroundColor: Colors.grey.shade300,
              ),
              SizedBox(height: 16),
              // Nombre del usuario
              Text(
                'Juan Pérez',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              // Correo del usuario
              Text(
                'juan.perez@example.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 16),
              // Información adicional
              Divider(),
              ListTile(
                leading: Icon(Icons.phone, color: Colors.blueAccent),
                title: Text('Teléfono'),
                subtitle: Text('+1 234 567 890'),
              ),
              ListTile(
                leading: Icon(Icons.location_on, color: Colors.blueAccent),
                title: Text('Ubicación'),
                subtitle: Text('Ciudad de México, México'),
              ),
              ListTile(
                leading: Icon(Icons.cake, color: Colors.blueAccent),
                title: Text('Fecha de nacimiento'),
                subtitle: Text('15 de marzo de 1990'),
              ),
              SizedBox(height: 20),
              // Botón de cierre de sesión
              ElevatedButton.icon(
                onPressed: () {
                  // Aquí puedes implementar la funcionalidad de cierre de sesión
                  print('Cerrar sesión');
                },
                icon: Icon(Icons.logout),
                label: Text('Cerrar sesión'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
