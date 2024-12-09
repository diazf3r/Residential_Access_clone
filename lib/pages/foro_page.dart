import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/foro.dart';
import 'package:myapp/widgets/custom_input2.dart';
import 'package:myapp/widgets/list_consultas.dart';

class ForoPage extends StatelessWidget {
  ForoPage({super.key});

  final tema = TextEditingController();
  final consulta = TextEditingController();

  final CollectionReference ref = FirebaseFirestore.instance.collection('foro');

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
              child: StreamBuilder(
                  stream: ref.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return const AlertDialog(
                        title: Text(
                          'Error al obtener los datos',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w800),
                        ),
                      );
                    }

                    if (!snapshot.hasData) {
                      return const AlertDialog(
                        title: Text('No hay datos disponibles',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w800)),
                      );
                    }

                    final listaForo = snapshot.data!.docs.map((itemForo) {
                      final temp = itemForo.data() as Map<String, dynamic>;
                      temp['id'] = itemForo.id;
                      return Foro.fromJson(temp);
                    }).toList();

                    return ListView.separated(
                      itemCount: listaForo.length,
                      itemBuilder: (context, index) {
                        final foro = listaForo[index];
                        return ListConsultas(
                          title: foro.title,
                          description: foro.description,
                          titleRespuesta: foro.titleRespuesta,
                          respuesta: foro.respuesta,
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                        thickness: 1,
                        indent: 15,
                        endIndent: 15,
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
      floatingActionButton: FilledButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: AlertDialog(
                    scrollable: true,
                    actionsPadding: const EdgeInsets.all(15),
                    actions: [
                      CustomInput2(
                        controlador: tema,
                        maxLines: 2,
                        dialogo: 'Ingrese su consulta',
                      ),
                      const SizedBox(height: 15),
                      CustomInput2(
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
                            onPressed: () {
                              if (tema.text.isEmpty || consulta.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'No puede subir una consulta con algún campo vacio')));
                              } else {
                                final nuevaConsulta = Foro(
                                    title: tema.text, description: consulta.text);
                  
                                ref.add(nuevaConsulta.toJson());
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Crear Consulta'),
                          ),
                        ],
                      ),
                    ],
                  ),
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
