import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/teacher/ia/custom_input_message.dart';
import '../../../providers/chat_gemini/chat_provider.dart';
import 'message_list.dart';

class ChatGeminiScreen extends ConsumerStatefulWidget {
  static const name = 'chat_screen';
  const ChatGeminiScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChatGeminiScreenState();
}

class _ChatGeminiScreenState extends ConsumerState<ChatGeminiScreen> {
  void _onGenerateQuestionnaire(String inputText) {
    // Expresión regular para buscar el formato de preguntas
    final match = RegExp(r'(\d+)\s+preguntas sobre (.+)').firstMatch(inputText);
    if (match != null) {
      int quantity = int.parse(match.group(1)!);
      String topic = match.group(2)!;

      // Llamada a generar el cuestionario con la cantidad y el tema
      ref.read(chatProvider).generateQuestionnaire(topic, quantity);
    } else {
      // Si no es un cuestionario, envía el mensaje como un mensaje general
      ref.read(chatProvider).callGeminiModel(inputText);
    }
    ref.read(chatProvider).controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(chatProvider);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: MessageList(
                scrollController: messages.chatScrollController,
                messages: messages.messages,
              ),
            ),
            CustomInputMessage(
              controller: messages.controller,
              onPressed: () {
                final prompt = messages.controller.text.trim();
                if (prompt.isNotEmpty) {
                  _onGenerateQuestionnaire(
                      prompt); // Llamada al método de interpretación
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
