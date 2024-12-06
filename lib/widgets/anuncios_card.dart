import 'package:flutter/material.dart';

class AnuncioCard extends StatelessWidget {
  const AnuncioCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagen,
  });

  final String title;
  final String description;
  final NetworkImage imagen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.amberAccent[400],
                        fontWeight: FontWeight.w400,
                        fontSize: 23),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(
                        image: imagen,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 160,
                        child: SingleChildScrollView(
                          child: Text(
                            description,
                            style: TextStyle(
                                color: Colors.blueGrey[400],
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Image(
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://www.laprensa.hn/binrepository/1278x1277/0c99/1278d1080/none/11004/AGYS/448769750-790555046551042-21150748269_7791397_20240618190144.jpg'))
                    ],
                  ),
                ));
      },
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
                title,
                style: TextStyle(
                    color: Colors.amberAccent[400],
                    fontWeight: FontWeight.w400,
                    fontSize: 23),
              ),
              Text(
                maxLines: 4,
                description,
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
                      image: imagen,
                      width: 120,
                      height: 160,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      color: Colors.teal[50],
                      shadowColor: Colors.transparent,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 110),
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
