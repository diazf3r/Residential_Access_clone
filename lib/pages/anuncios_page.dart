import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/anuncios.dart';
import 'package:myapp/widgets/anuncios_card.dart';

class AnnouncePage extends StatelessWidget {
  AnnouncePage({super.key});

  final CollectionReference ref =
      FirebaseFirestore.instance.collection('anuncios');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent[700],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ANUNCIOS',
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
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: FutureBuilder(
                  future: ref.get(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return const AlertDialog(
                        title: Text('Error al bbtener los datos'),
                      );
                    }

                    if (!snapshot.hasData) {
                      return const AlertDialog(
                        title: Text('No hay datos disponibles'),
                      );
                    }

                    final listaAnuncios =
                        snapshot.data!.docs.map((itemAnuncio) {
                      final temp = itemAnuncio.data() as Map<String, dynamic>;
                      temp['id'] = itemAnuncio.id;
                      return Anuncios.fromJson(temp);
                    }).toList();

                    return ListView.separated(
                      itemCount: listaAnuncios.length,
                      itemBuilder: (context, index) {
                        final anuncio = listaAnuncios[index];

                        return AnuncioCard(
                            title: anuncio.title,
                            description: anuncio.content,
                            imagen: anuncio.imageURL);
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 12),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
