import 'package:flutter/material.dart';

class ResourceCard extends StatelessWidget {
  final dynamic resource;

  const ResourceCard({Key? key, required this.resource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(resource['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(resource['description']),
        trailing: const Icon(Icons.open_in_new),
        onTap: () {
          // Navegar al recurso externo
        },
      ),
    );
  }
}
