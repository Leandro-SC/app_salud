import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatService {
  late IO.Socket socket;

  // Conectar al servidor
  void connectToServer(String userId) {
    socket = IO.io('http://localhost:5000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();

    socket.onConnect((_) {
      print('Conectado al servidor');

      // Emitir un evento para notificar al servidor que el usuario está disponible
      socket.emit('setAvailability', {'userId': userId, 'available': true});
    });

    // Manejar los mensajes recibidos
    socket.on('receiveMessage', (data) {
      print('Nuevo mensaje recibido: ${data['message']}');
      // Aquí podrías implementar la lógica para actualizar la interfaz con el nuevo mensaje.
    });

    // Notificar cuando un usuario se desconecta
    socket.onDisconnect((_) {
      print('Desconectado del servidor');
    });
  }

  // Enviar un mensaje
  void sendMessage(String senderId, String receiverId, String message) {
    socket.emit('sendMessage', {
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
    });
  }

  // Desconectar del servidor
  void disconnect() {
    socket.disconnect();
  }
}
