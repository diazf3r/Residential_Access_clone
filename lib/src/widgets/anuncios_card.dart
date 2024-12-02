import 'package:flutter/material.dart';

class AnuncioCard extends StatelessWidget {
  const AnuncioCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'AVISO',
                style: TextStyle(
                    color: Colors.amberAccent[400],
                    fontWeight: FontWeight.w400,
                    fontSize: 23),
              ),
              Text(
                maxLines: 4,
                'Esto es un texto informativo',
                style: TextStyle(
                    color: Colors.blueGrey[400], fontWeight: FontWeight.w300),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                fit: StackFit.passthrough,
                children: [
                  Center(
                    child: Image(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                        'https://th.bing.com/th/id/R.3bcb36f3d4774fb93fbe48d0a25737eb?rik=WXX7B4olBgn8TQ&riu=http%3a%2f%2f4.bp.blogspot.com%2f-DYVbSKM0xGQ%2fUnKclbsDugI%2fAAAAAAAAAI0%2fv3FhyPcK02Y%2fs1600%2fimagenes-de-perritos-bonitos.jpg&ehk=uY%2bcX0a3udlR4%2bcaEqFEHaDmly9dBmwI4ktryOKByl8%3d&risl=&pid=ImgRaw&r=0',
                      ),
                      width: 120,
                      height: 160,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      color: Colors.teal[50],
                      shadowColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 110),
                        child: Text(
                          'VER MÁS',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
