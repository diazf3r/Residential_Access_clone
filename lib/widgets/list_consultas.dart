import 'package:flutter/material.dart';

class ListConsultas extends StatelessWidget {
  const ListConsultas({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Title(
        color: const Color(0xFF42A5F5),
        child: Text(title),
      ),
      subtitle: Text(
        description,
        maxLines: 3,
      ),
      trailing:
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward)),
    );
  }
}
