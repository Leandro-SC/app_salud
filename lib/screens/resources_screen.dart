import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/resource_card.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recursos Educativos')),
      body: FutureBuilder(
        future: ApiService().get('/resources'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar recursos'));
          } else {
            final resources = snapshot.data as List<dynamic>;
            return ListView.builder(
              itemCount: resources.length,
              itemBuilder: (context, index) {
                return ResourceCard(resource: resources[index]);
              },
            );
          }
        },
      ),
    );
  }
}

