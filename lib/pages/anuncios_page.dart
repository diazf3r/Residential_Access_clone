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
                    return AnuncioCard(
                      title: 'ANUNCIO',
                      description: 'ESTO ES UNA PRUEBA',
                      imagen: NetworkImage(
                          'https://th.bing.com/th/id/R.3bcb36f3d4774fb93fbe48d0a25737eb?rik=WXX7B4olBgn8TQ&riu=http%3a%2f%2f4.bp.blogspot.com%2f-DYVbSKM0xGQ%2fUnKclbsDugI%2fAAAAAAAAAI0%2fv3FhyPcK02Y%2fs1600%2fimagenes-de-perritos-bonitos.jpg&ehk=uY%2bcX0a3udlR4%2bcaEqFEHaDmly9dBmwI4ktryOKByl8%3d&risl=&pid=ImgRaw&r=0'),
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
