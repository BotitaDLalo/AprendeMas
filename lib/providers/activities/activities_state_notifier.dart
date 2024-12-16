import 'package:aprende_mas/providers/activities/activities_state_notifier.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/groups/groups_provider.dart';
import '../../models/models.dart';

class ActivitiesStateNotifier extends StateNotifier<List<Activities>> {
  final Ref ref;

  ActivitiesStateNotifier(this.ref) : super([]) {
    getActivities();
  }

  void getActivities() {
    final grupos = ref.read(groupsProvider);
    List<Activities> actividades = [];
  }
}