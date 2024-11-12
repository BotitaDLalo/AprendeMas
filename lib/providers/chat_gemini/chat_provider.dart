import 'dart:convert';
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

   // Método de limpieza en el Provider
  String cleanText(String input) {
    return input.replaceAll(RegExp(r'\*+'), '');
  }

 Future<void> callGeminiModel(String prompt) async {
    await _fetchGeminiResponse(prompt);
  }

 Future<void> generateQuestionnaire(String topic, int quantity) async {
    // Crear el JSON con el tema y la cantidad de preguntas
    final questionnaireJson = {
      "topic": topic,
      "quantity": quantity,
    };

    // Convertir a un String JSON
    final jsonString = jsonEncode(questionnaireJson);

    // Lógica para agregar el mensaje del usuario
    _messages.add(Message(text: jsonString, isUser: true));
    notifyListeners();

    await _fetchGeminiResponse(jsonString);
  }

   Future<void> _fetchGeminiResponse(String prompt) async {
    try {
      // Lógica para agregar el mensaje del usuario
      _messages.add(Message(text: prompt, isUser: true));
      notifyListeners();

      // Llamada a la API de Gemini
      final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: dotenv.env['GOOGLE_API_KEY']!);
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      // Limpiar la respuesta de asteriscos
      final cleanedResponseText = cleanText(response.text!);

      // Agregar la respuesta de Gemini a la lista
      _messages.add(Message(text: cleanedResponseText, isUser: false));
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