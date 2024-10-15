import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_input_message.dart';
import '../../providers/chat_gemini/chat_provider.dart';
import '../widgets/custom_chat/message_list.dart';

class ChatGeminiScreen extends ConsumerStatefulWidget {
  static const name = 'chat_screen';
  const ChatGeminiScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatGeminiScreenState();
}

class _ChatGeminiScreenState extends ConsumerState<ChatGeminiScreen> {

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
                scrollController: messages.chatScrollController ,
                messages: messages.messages,
              ),
            ),
            CustomInputMessage(
              controller: messages.controller,
              onPressed: () {
                final prompt = messages.controller.text.trim();
                if (prompt.isNotEmpty) {
                  ref.read(chatProvider).callGeminiModel(prompt);
                  ref.read(chatProvider).controller.clear();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}