import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CampoNombre extends StatelessWidget {
  const CampoNombre({
    super.key,
    required this.nombreController,
    required this.focusNode,
  });

  final TextEditingController nombreController;
  final FocusNode focusNode;

  void _mostrarDialogo(BuildContext context, String mensaje) {
    //SchedulerBinding.addPostFrameCallback: Este método asegura que el SnackBar y el diálogo solo se muestren 
    //después de que el widget haya sido construido completamente, evitando el error de construcción.
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error en el Nombre'),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nombreController,
      focusNode: focusNode,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Nombre',
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: const Icon(Icons.person, color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          _mostrarDialogo(context, 'El campo Nombre no puede estar vacío');
          return '';
        }
        if (value.length < 3 || value.length > 10) {
          _mostrarDialogo(context, 'El nombre debe tener entre 3 y 10 caracteres.');
          return 'Debe tener entre 3 y 10 caracteres';
        }
        if (value.contains(RegExp(r'\d'))) {
          _mostrarDialogo(context, 'El nombre debe contener solo letras');
          return 'Debe contener solo letras';
        }
        return null;
      },
    );
  }
}

class CampoApellido extends StatelessWidget {
  const CampoApellido({
    super.key,
    required this.apellidoController,
    required this.focusNode,
  });

  final TextEditingController apellidoController;
  final FocusNode focusNode;

  void _mostrarDialogo(BuildContext context, String mensaje) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error en el Apellido'),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: apellidoController,
      focusNode: focusNode,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Apellido',
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: const Icon(Icons.person, color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}


class CampoIdentidad extends StatelessWidget {
  const CampoIdentidad({
    super.key,
    required this.identidadController,
    required this.focusNode,
  });

  final TextEditingController identidadController;
  final FocusNode focusNode;

  void _mostrarDialogo(BuildContext context, String mensaje) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error en el DNI'),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: identidadController,
      focusNode: focusNode,
      maxLength: 13, // Cambiar el máximo a 13 para coincidir con el DNI
      style: const TextStyle(color: Colors.black),
      validator: (value) {
        if (value == null || value.isEmpty) {
          _mostrarDialogo(context, 'El DNI es obligatorio');
          return 'Este campo es obligatorio';
        }

        if (!RegExp(r'^\d+$').hasMatch(value)) {
          _mostrarDialogo(context, 'El DNI debe contener solo números');
          return 'Debe contener solo números';
        }

        if (value.length != 13) { // Verificar que tenga exactamente 13 dígitos
          _mostrarDialogo(context, 'El DNI debe tener exactamente 13 dígitos');
          return 'Debe tener 13 dígitos';
        }

        return null;
      },
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'DNI',
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: const Icon(Icons.credit_card, color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}