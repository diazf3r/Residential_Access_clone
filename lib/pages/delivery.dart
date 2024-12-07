import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PantallaDelivery extends StatelessWidget {
  PantallaDelivery({super.key});

  final List<Map<String, String>> opcionesDelivery = [
    {
      'name': 'Yujuu',
      'phone': '*1777',
      'url': 'https://www.yujuu.hn',
      'icon':
          'https://play-lh.googleusercontent.com/h_3H7eZ82DX8XTf0HtQfRXfUMixGpaFrG9Walle5ex8XEjvDyEmEMWWkW7upBy2ECuA', // URL de icono genérico
    },
    {
      'name': 'PedidosYa!',
      'phone': '---',
      'url': 'https://www.pedidosya.com.hn',
      'icon':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Isologotipo_PedidosYa.jpg/640px-Isologotipo_PedidosYa.jpg', // URL de icono genérico
    },
    {
      'name': 'Hugo',
      'phone': '9430-5924',
      'url': 'https://www.hugoapp.com',
      'icon':
          'https://cdn.branch.io/branch-assets/1490227243953-og_image.png', 
    },
  ];


  final List<Map<String, String>> opcionRestaurantes = [
    {'name': 'McDonald\'s', 'phone': '2276-1770', 'url': 'https://mcdonalds.com.hn'},
    {'name': 'Wendy\'s', 'phone': '2512-6002', 'url': 'https://wendys.hn'},
    {'name': 'Burger King', 'phone': '2512-3677', 'url': 'https://burgerkinghonduras.hn'},
    {'name': 'KFC', 'phone': '2512-1779', 'url': 'https://kfc.hn'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.delivery_dining, size: 28), // Icono de encabezado
            SizedBox(width: 10),
            Text('Servicio de Delivery'),
          ],
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Opciones de Delivery en forma de tarjetas
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Tres columnas por fila
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: opcionesDelivery.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        _showDeliveryDetails(
                          context,
                          opcionesDelivery[index]['phone']!,
                          opcionesDelivery[index]['url']!,
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            opcionesDelivery[index]['icon']!,
                            height: 50,
                            width: 50,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.image_not_supported),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            opcionesDelivery[index]['name']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Botón para seleccionar un restaurante
            ElevatedButton(
              onPressed: () => _showRestaurantSelection(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text('Seleccionar Restaurante'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeliveryDetails(BuildContext context, String phone, String url) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Detalles de Delivery'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Teléfono: $phone'),
              Text('Página web: $url'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final Uri uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  _showError(context, 'No se puede abrir la URL.');
                }
              },
              child: const Text('Abrir Página'),
            ),
            TextButton(
              onPressed: () async {
                final Uri uri = Uri(scheme: 'tel', path: phone);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  _showError(context, 'No se puede realizar la llamada.');
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

  void _showRestaurantSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selecciona un Restaurante'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: opcionRestaurantes.map((restaurant) {
              return ListTile(
                title: Text(restaurant['name']!),
                onTap: () {
                  Navigator.of(context).pop();
                  _showRestaurantDetails(
                    context,
                    restaurant['phone']!,
                    restaurant['url']!,
                  );
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _showRestaurantDetails(BuildContext context, String phone, String url) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Detalles del Restaurante'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Teléfono: $phone'),
              Text('Página web: $url'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final Uri uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  _showError(context, 'No se puede abrir la URL.');
                }
              },
              child: const Text('Abrir Página'),
            ),
            TextButton(
              onPressed: () async {
                final Uri uri = Uri(scheme: 'tel', path: phone);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  _showError(context, 'No se puede realizar la llamada.');
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

  void _showError(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
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
