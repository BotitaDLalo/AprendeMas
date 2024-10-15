import 'package:aprende_mas/config/utils/packages.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../../models/message/message.dart';

final chatProvider = ChangeNotifierProvider((ref) => ChatProvider());

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController(); 
  final TextEditingController controller = TextEditingController();
  final List<Message> _messages = [];

  List<Message> get messages => _messages;

  Future<void> callGeminiModel(String prompt) async {
    try {
      // Lógica para agregar el mensaje del usuario
      _messages.add(Message(text: prompt, isUser: true));
      // controller.clear();
      notifyListeners();

      // Llamada a la API de Gemini
      final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: dotenv.env['GOOGLE_API_KEY']!);
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      // Agregar la respuesta de Gemini a la lista
      _messages.add(Message(text: response.text!, isUser: false));
      notifyListeners();
      moveScrollToBottom();
    } catch (e) {
      print('Error al llamar a Gemini: $e');
    }
  }

  void moveScrollToBottom() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (chatScrollController.hasClients) {
      chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
    }
  });
}

}