
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/subjects/modal_button_subjects_notifier.dart';
import 'package:aprende_mas/providers/subjects/modal_button_subjects_state.dart';

final modalButtonSubjectsProvider = StateNotifierProvider<ModalButtonSubjectsNotifier,ModalButtonSubjectsState>((ref) {
  return ModalButtonSubjectsNotifier();
},);