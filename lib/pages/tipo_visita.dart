import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'anunciar_visita.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class PantallaTipoVisita extends StatefulWidget {
  const PantallaTipoVisita({super.key});

  @override
  State<PantallaTipoVisita> createState() => _PantallaTipoVisitaState();
}

class _PantallaTipoVisitaState extends State<PantallaTipoVisita> {
  // Lista compartida de visitas agendadas
  List<Visita> visitasAgendadas = [];
  void agregarVisita(Visita visita) {
    setState(() {
      visitasAgendadas.add(visita);
    });
  }

  @override
  void initState() {
    super.initState();
    _obtenerVisitasAgendadas();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _obtenerVisitasAgendadas() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('visitas').get();
      setState(() {
        visitasAgendadas = snapshot.docs.map((item) {
          final data = item.data() as Map<String, dynamic>;
          data['id'] = item.id;
          return Visita.fromJson(data);
        }).toList();
      });
    } catch (e) {
      print('Error al obtener las visitas agendadas: $e');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error al cargar las visitas agendadas'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gestión de Visitas'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'On-Demand', icon: Icon(Icons.flash_on)),
              Tab(text: 'Agendadas', icon: Icon(Icons.calendar_today)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            VisitasOnDemand(onAgregarVisita: agregarVisita),
            RefreshIndicator(
              onRefresh:
                  _obtenerVisitasAgendadas,
              child: VisitasAgendadas(
                visitas: visitasAgendadas,
                onVisitaEliminada: (index) {
                  setState(() {
                    visitasAgendadas.removeAt(index);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VisitasOnDemand extends StatelessWidget {
  final Function(Visita visita) onAgregarVisita;

  const VisitasOnDemand({super.key, required this.onAgregarVisita});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnunciarVisita(
                onVisitaCreada: onAgregarVisita,
              ),
            ),
          );
        },
        child: const Text('Anunciar Visita'),
      ),
    );
  }
}

class VisitasAgendadas extends StatelessWidget {
  final List<Visita> visitas;
  final Function(int) onVisitaEliminada;

  const VisitasAgendadas({
    super.key,
    required this.visitas,
    required this.onVisitaEliminada,
  });

  @override
  Widget build(BuildContext context) {
    if (visitas.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No hay visitas agendadas aún.'),
            duration: Duration(seconds: 2),
          ),
        );
      });
      return const Center(
        child: Text(
          'No hay visitas agendadas.',
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: visitas.length,
        itemBuilder: (context, index) {
          final visita = visitas[index];

          return Dismissible(
            key: Key(visita.identidad),
            background: Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.qr_code, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Código QR de la Visita'),
                      content: PrettyQrView.data(
                        data:
                            'Nombre: ${visita.nombre} ${visita.apellido}\nMotivo: ${visita.motivo}\nFecha: ${visita.fecha}\nHora: ${visita.hora}',
                        errorCorrectLevel: QrErrorCorrectLevel.H,
                        decoration: const PrettyQrDecoration(
                          shape: PrettyQrSmoothSymbol(),
                          image: PrettyQrDecorationImage(
                            image: AssetImage('images/flutter.png'),
                            position: PrettyQrDecorationImagePosition.embedded,
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Cerrar'))
                      ],
                    );
                  },
                );
                return false;
              } else if (direction == DismissDirection.endToStart) {
                return await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Eliminar Visita'),
                      content: const Text(
                        '¿Estás seguro de que deseas eliminar esta visita?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () => {
                            Navigator.of(context).pop(true),
                            onVisitaEliminada(index),
                            FirebaseFirestore.instance
                                .collection('visitas')
                                .doc(visitas[index].identidad)
                                .delete(),
                          },
                          child: const Text('Eliminar',
                              style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    );
                  },
                );
              }
              return false;
            },
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                onVisitaEliminada(index);
              }
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text('${visita.nombre} ${visita.apellido}'),
                subtitle: Text(
                  'Motivo: ${visita.motivo}\nFecha: ${visita.fecha} - Hora: ${visita.hora}',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
