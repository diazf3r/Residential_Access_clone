import "package:flutter/material.dart";

class VisitaCreada extends StatelessWidget {
  const VisitaCreada ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visita creada'),
      ),
      body: const Center(
        child: Text('Visita creada'),
      )
    );
  }
}