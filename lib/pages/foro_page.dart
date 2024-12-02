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
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 25),
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
                  return ListTile(
                    title: Title(
                        color: Color(0xFF42A5F5),
                        child: Text('TITULO DEL TEMA')),
                    subtitle: Text('ESTE ES EL CONTENIDO'),
                    trailing: IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward)),
                  );
                },
                separatorBuilder: (context, index) => Divider(
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
                  actionsPadding: EdgeInsets.all(15),
                  actions: [
                    CustomInput(
                      controlador: tema,
                      dialogo: 'Ingrese el tema de discución',
                    ),
                    const SizedBox(height: 15),
                    CustomInput(
                      controlador: consulta,
                      dialogo: 'Detalle el tema de discución',
                      maxLines: 6,
                      maxLength: 300,
                    ),
                    const SizedBox(height: 10),
                    FilledButton(
                      onPressed: () {},
                      child: Text('Crear Tema'),
                    ),
                  ],
                );
              });
        },
        child: Text(
          'Agregar Tema De Discusión',
          style: TextStyle(fontSize: 16, height: 3),
        ),
        style: FilledButton.styleFrom(backgroundColor: Colors.amberAccent[700]),
      ),
    );
  }
}
