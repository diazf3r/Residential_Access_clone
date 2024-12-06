import 'package:flutter/material.dart';
import 'package:myapp/widgets/custom_input.dart';
import 'package:myapp/widgets/list_consultas.dart';

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
                      maxLines: 2,
                      dialogo: 'Ingrese su consulta',
                    ),
                    const SizedBox(height: 15),
                    CustomInput(
                      controlador: consulta,
                      dialogo: 'Detalle su consulta',
                      maxLines: 4,
                      maxLength: 300,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FilledButton(
                          style: FilledButton.styleFrom(
                              backgroundColor: Colors.red[800]),
                          onPressed: () {
                            Navigator.pop(context);
                            tema.text = '';
                            consulta.text = '';
                          },
                          child: const Text('Cancelar'),
                        ),
                        const SizedBox(width: 5),
                        FilledButton(
                          style: FilledButton.styleFrom(
                              backgroundColor: Colors.amberAccent[700]),
                          onPressed: () {},
                          child: const Text('Crear Consulta'),
                        ),
                      ],
                    ),
                  ],
                );
              });
        },
        style: FilledButton.styleFrom(backgroundColor: Colors.amberAccent[700]),
        child: const Text(
          'Agregar Solicitud/Consulta',
          style: TextStyle(fontSize: 16, height: 3),
        ),
      ),
    );
  }
}
