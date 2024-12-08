import 'package:flutter/material.dart';
import 'package:myapp/widgets/anuncios_card.dart';

class AnuncioPage extends StatelessWidget {
  const AnuncioPage({super.key});

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
                child: ListView.separated(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return const AnuncioCard(
                      title: 'ANUNCIO',
                      description: 'ESTO ES UNA PRUEBA',
                      imagen: '',
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
