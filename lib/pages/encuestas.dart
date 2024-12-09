import 'package:flutter/material.dart';

class EncuestasPage extends StatefulWidget {
  const EncuestasPage({super.key});

  @override
  _EncuestasPageState createState() => _EncuestasPageState();
}

class _EncuestasPageState extends State<EncuestasPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _encuestaController = TextEditingController();
  final List<Encuesta> _encuestas = [];

  void _agregarEncuesta() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _encuestas.add(Encuesta(
          texto: _encuestaController.text,
          likes: 0,
          dislikes: 0,
        ));
        _encuestaController.clear();
      });
    }
  }

  void _eliminarEncuesta(int index) {
    setState(() {
      _encuestas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Encuestas'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _encuestaController,
                      decoration: const InputDecoration(
                        labelText: 'Nueva encuesta',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa una encuesta';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _agregarEncuesta,
                    child: const Text('Agregar'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Encuestas:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _encuestas.length,
                itemBuilder: (context, index) {
                  return EncuestaTile(
                    encuesta: _encuestas[index],
                    onLike: () {
                      setState(() {
                        // Solo permite dar like si no se ha dado dislike previamente
                        if (!_encuestas[index].hasDisliked) {
                          for (var e in _encuestas) {
                            e.hasLiked = false;
                            e.hasDisliked = false;
                          }
                          _encuestas[index].hasLiked = true;
                          _encuestas[index].likes++;
                        }
                      });
                    },
                    onDislike: () {
                      setState(() {
                        // Solo permite dar dislike si no se ha dado like previamente
                        if (!_encuestas[index].hasLiked) {
                          for (var e in _encuestas) {
                            e.hasLiked = false;
                            e.hasDisliked = false;
                          }
                          _encuestas[index].hasDisliked = true;
                          _encuestas[index].dislikes++;
                        }
                      });
                    },
                    onDelete: () {
                      _eliminarEncuesta(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Encuesta {
  String texto;
  int likes;
  int dislikes;
  bool hasLiked = false;
  bool hasDisliked = false;

  Encuesta({required this.texto, this.likes = 0, this.dislikes = 0});
}

class EncuestaTile extends StatelessWidget {
  final Encuesta encuesta;
  final VoidCallback onLike;
  final VoidCallback onDislike;
  final VoidCallback onDelete;

  const EncuestaTile({super.key, 
    required this.encuesta,
    required this.onLike,
    required this.onDislike,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(encuesta.texto),
        subtitle: Text('Likes: ${encuesta.likes} - Dislikes: ${encuesta.dislikes}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.thumb_up, color: encuesta.hasLiked ? Colors.grey : Colors.green),
              onPressed: encuesta.hasLiked ? null : onLike,
            ),
            IconButton(
              icon: Icon(Icons.thumb_down, color: encuesta.hasDisliked ? Colors.grey : Colors.red),
              onPressed: encuesta.hasDisliked ? null : onDislike,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
