import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/agenda/form_event_state.dart';

class FormEventNotifier extends StateNotifier<FormEventState>{
  final TextEditingController titleController; 

  FormEventNotifier()
    : titleController = TextEditingController(),
      super(FormEventState());

}
