import 'package:flutter/material.dart';

class EncuestasPage extends StatefulWidget {
  @override
  _EncuestasPageState createState() => _EncuestasPageState();
}

class _EncuestasPageState extends State<EncuestasPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _encuestaController = TextEditingController();
  final List<String> _encuestas = [];

  void _agregarEncuesta() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _encuestas.add(_encuestaController.text);
        _encuestaController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Gestión de Encuestas'),
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
                      decoration: InputDecoration(
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
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _agregarEncuesta,
                    child: Text('Agregar'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Encuestas:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _encuestas.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_encuestas[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _encuestas.removeAt(index);
                          });
                        },
                      ),
                    ),
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
