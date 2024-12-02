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
    //SchedulerBinding.addPostFrameCallback: Este método asegura que el SnackBar y el diálogo solo se muestren 
    //después de que el widget haya sido construido completamente, evitando el error de construcción.
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          _mostrarDialogo(context, 'El campo Apellido no puede estar vacío');
          return '';
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

        if (value.length != 13) { 
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

class CampoMotivo extends StatelessWidget {
  const CampoMotivo({
    super.key,
    required this.motivoController,
    required this.focusNode,
  });

  final TextEditingController motivoController;
  final FocusNode focusNode;

  void _mostrarDialogo(BuildContext context, String mensaje) {
    //SchedulerBinding.addPostFrameCallback: Este método asegura que el SnackBar y el diálogo solo se muestren 
    //después de que el widget haya sido construido completamente, evitando el error de construcción.
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error en el Motivo'),
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
      controller: motivoController,
      focusNode: focusNode,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Motivo',
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: const Icon(Icons.sticky_note_2_outlined, color: Colors.black),
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
          _mostrarDialogo(context, 'Este campo no puede estar vacío');
          return '';
        }
        if (value.contains(RegExp(r'\d'))) {
          _mostrarDialogo(context, 'Este campo debe contener solo letras');
          return 'Debe contener solo letras';
        }
        return null;
      },
    );
  }
}

class CampoFecha extends StatefulWidget {
  const CampoFecha({
    super.key,
    required this.fechaController,
  });

  final TextEditingController fechaController;

  @override
  CampoFechaState createState() => CampoFechaState();
}

class CampoFechaState extends State<CampoFecha> {
  void _mostrarCalendario(BuildContext context) async {
    DateTime? fechaSeleccionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (fechaSeleccionada != null) {
      setState(() {
        widget.fechaController.text =
            '${fechaSeleccionada.year}-${fechaSeleccionada.month.toString().padLeft(2, '0')}-${fechaSeleccionada.day.toString().padLeft(2, '0')}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.fechaController,
      readOnly: true,
      onTap: () => _mostrarCalendario(context),
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Fecha de llegada',
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: const Icon(Icons.calendar_today, color: Colors.black),
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
          return 'Por favor seleccione una fecha';
        }
        return null;
      },
    );
  }
}

class CampoHora extends StatefulWidget {
  const CampoHora({
    super.key,
    required this.horaController,
  });

  final TextEditingController horaController;

  @override
  CampoHoraState createState() => CampoHoraState();
}

class CampoHoraState extends State<CampoHora> {
  void _mostrarSelectorHora(BuildContext context) async {
    TimeOfDay? horaSeleccionada = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (horaSeleccionada != null) {
      setState(() {
        widget.horaController.text =
            '${horaSeleccionada.hour.toString().padLeft(2, '0')}:${horaSeleccionada.minute.toString().padLeft(2, '0')}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.horaController,
      readOnly: true,
      onTap: () => _mostrarSelectorHora(context),
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Hora estimada',
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: const Icon(Icons.access_time, color: Colors.black),
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
          return 'Por favor seleccione una hora';
        }
        return null;
      },
    );
  }
}