import 'package:access_project/src/pages/widgets/custom_input.dart';
import 'package:access_project/src/pages/widgets/list_consultas.dart';
import 'package:flutter/material.dart';

class ForoPage extends StatelessWidget {
  ForoPage({super.key});

  final tema = TextEditingController();
  final consulta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent[700],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Foro de Consultas',
                style: TextStyle(
                  color: Colors.amberAccent[700],
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: ListView.separated(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ListConsultas(
                    title: 'ESTO ES UN TITULO',
                    description: 'ESTO ES UNA DESCRIPCION DE ALGO',
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                  indent: 15,
                  endIndent: 15,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FilledButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actionsPadding: const EdgeInsets.all(15),
                  actions: [
                    CustomInput(
                      controlador: tema,
                      dialogo: 'Ingrese su consulta',
                    ),
                    const SizedBox(height: 15),
                    CustomInput(
                      controlador: consulta,
                      dialogo: 'Detalle su consulta',
                      maxLines: 6,
                      maxLength: 300,
                    ),
                    const SizedBox(height: 10),
                    FilledButton(
                      onPressed: () {},
                      child: Text('Crear Consulta'),
                    ),
                  ],
                );
              });
        },
        child: Text(
          'Agregar Solicitud/Consulta',
          style: TextStyle(fontSize: 16, height: 3),
        ),
        style: FilledButton.styleFrom(backgroundColor: Colors.amberAccent[700]),
      ),
    );
  }
}
