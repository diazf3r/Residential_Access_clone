import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PantallaDelivery extends StatelessWidget {
  PantallaDelivery({super.key});

  final List<Map<String, String>> opcionesDelivery = [
    {
      'name': 'Yujuu',
      'phone': '*1777',
      'url': 'https://www.yujuu.hn',
      'icon': 'https://play-lh.googleusercontent.com/h_3H7eZ82DX8XTf0HtQfRXfUMixGpaFrG9Walle5ex8XEjvDyEmEMWWkW7upBy2ECuA',
    },
    {
      'name': 'PedidosYa!',
      'phone': '---',
      'url': 'https://www.pedidosya.com.hn',
      'icon': 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Isologotipo_PedidosYa.jpg/640px-Isologotipo_PedidosYa.jpg',
    },
    {
      'name': 'Hugo',
      'phone': '9430-5924',
      'url': 'https://www.hugoapp.com',
      'icon': 'https://cdn.branch.io/branch-assets/1490227243953-og_image.png',
    },
  ];

  final List<Map<String, String>> opcionRestaurantes = [
    {
      'name': 'McDonald\'s',
      'phone': '2276-1770',
      'url': 'https://mcdonalds.com.hn',
      'icon': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL4-knehKxPAcY53F6vqF3FFllRTHr3YGhkg&s',
    },
    {
      'name': 'Wendy\'s',
      'phone': '2512-6002',
      'url': 'https://wendys.hn',
      'icon': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAReG-u1SPTDn8e3P_rAFs2txNke6WNPN0xg&s',
    },
    {
      'name': 'Burger King',
      'phone': '2512-3677',
      'url': 'https://burgerkinghonduras.hn',
      'icon': 'https://1000marcas.net/wp-content/uploads/2019/12/Burger-King-logo.jpg',
    },
    {
      'name': 'KFC',
      'phone': '2512-1779',
      'url': 'https://kfc.hn',
      'icon': 'https://mma.prnewswire.com/media/2263790/KFC_Logo.jpg?p=facebook',
    },
  ];

  final List<Map<String, String>> opcionServicios = [
    {
      'name': 'Tropigas',
      'phone': '3259-8608',
      'url': 'https://almacenestropigas.com',
      'icon': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-EICLelndC7oGOjimz8v2-wfOGv9ysMG9TQ&s',
    },
    {
      'name': 'Cable Color',
      'phone': '2540-1234',
      'url': 'https://cablecolor.hn',
      'icon': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThWkQ-IEQ85JfRdOysI1Dm4tTPk7iE2P5RYw&s',
    },
    {
      'name': 'Tigo',
      'phone': '*099',
      'url': 'https://tigo.com.hn',
      'icon': 'https://yt3.googleusercontent.com/-F2RtY7NgYJxyU5a-A-VOStBE3LKbIARpgYDpUHR7ExlciLKSh4-XZDB-ZlrYmdINccU4L6n6g=s900-c-k-c0x00ffffff-no-rj',
    },
    {
      'name': 'Claro',
      'phone': '2205-4126',
      'url': 'https://claro.com.hn',
      'icon': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq3Pqjae2wGXsUSdbo-GfcNX-ywlG1QJ58TA&s',
    },
    {
      'name': 'Farmacia Siman',
      'phone': '3170-7433',
      'url': 'https://farmaciasiman.com',
      'icon': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0mR7odekyrzftHq1DpS26gL9b-i9r-q5nww&s',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Icon(Icons.delivery_dining, size: 28),
              SizedBox(width: 10),
              Text('Servicios de Delivery'),
            ],
          ),
          backgroundColor: Colors.orange,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Delivery'),
              Tab(text: 'Restaurantes'),
              Tab(text: 'Servicios'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildGrid(opcionesDelivery),
            _buildGrid(opcionRestaurantes),
            _buildGrid(opcionServicios),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(List<Map<String, String>> options) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: options.length,
        itemBuilder: (context, index) {
          final option = options[index];
          return Card(
            elevation: 4,
            child: InkWell(
              onTap: () => _showDetails(context, option),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    option['icon']!,
                    height: 50,
                    width: 50,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image_not_supported, size: 50),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    option['name']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showDetails(BuildContext context, Map<String, String> option) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(option['name']!),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Puedes llamar a este número: ${option['phone']}'),
              Text('Ir directamente a su Página web: ${option['url']}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final Uri uri = Uri.parse(option['url']!);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
              child: const Text('Abrir Página'),
            ),
            TextButton(
              onPressed: () async {
                final Uri uri = Uri(scheme: 'tel', path: option['phone']);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
              child: const Text('Llamar'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
