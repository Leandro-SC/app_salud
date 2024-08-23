import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat con Terapeutas')),
      body: const Center(
        child: Text('Chat no implementado'),
      ),
    );
  }
}
