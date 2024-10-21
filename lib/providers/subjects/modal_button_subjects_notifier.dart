import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/subjects/modal_button_subjects_state.dart';
import 'package:aprende_mas/views/infrastructure/color_input.dart';

class ModalButtonSubjectsNotifier
    extends StateNotifier<ModalButtonSubjectsState> {
  ModalButtonSubjectsNotifier() : super(ModalButtonSubjectsState());

  onColorCodeChanged(Color color){
    final newColorCode = ColorInput.dirty(color);
    state = state.copyWith(
      pickerColor: color,
      colorCode: newColorCode,
      
    );
  }
}
