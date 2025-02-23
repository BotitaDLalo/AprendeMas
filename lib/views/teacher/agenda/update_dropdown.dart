import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/agenda/form_event_provider.dart';
import 'package:aprende_mas/providers/groups/groups_provider.dart';
import 'package:aprende_mas/providers/subjects/subjects_provider.dart';

class UpdateDropdownForm extends ConsumerStatefulWidget {
  final int? initialItemId;
  final bool isGroup;

  const UpdateDropdownForm({
    super.key,
    required this.isGroup,
    this.initialItemId,
  });

  @override
  ConsumerState<UpdateDropdownForm> createState() => _OptionDropdownFormState();
}

class _OptionDropdownFormState extends ConsumerState<UpdateDropdownForm> {
  int? _selectedItemId;

  @override
void initState() {
  super.initState();
  _selectedItemId = widget.initialItemId;

  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!mounted) return; // Verifica si el widget aún está montado antes de modificar el estado

    final groupsNotifier = ref.read(groupsProvider.notifier);
    final subjectsNotifier = ref.read(subjectsProvider.notifier);

    if (widget.isGroup && ref.read(groupsProvider).groups.isEmpty) {
      groupsNotifier.getGroupsSubjects();
    }
    if (!widget.isGroup && ref.read(subjectsProvider).subjects.isEmpty) {
      subjectsNotifier.getSubjects();
    }
  });
}


  void _onItemSelected(int? value) {
  if (value == null || !mounted) return; // Asegura que el widget aún está montado

  setState(() {
    _selectedItemId = value;
  });

  final formEventNotifier = ref.read(formEventProvider.notifier);
  if (!mounted) return; // Segunda verificación antes de modificar el estado global

  if (widget.isGroup) {
    formEventNotifier.onUpdateGroupIdsChanged([value]);
    formEventNotifier.onUpdateGroupColorChanged(Colors.blue);
  } else {
    formEventNotifier.onUpdateSubjectIdsChanged([value]);
    formEventNotifier.onUpdateGroupColorChanged(Colors.green);
  }
}


  @override
  Widget build(BuildContext context) {
    // Usamos ref.watch() solo en lo necesario para evitar reconstrucciones
    final groupsState = ref.watch(groupsProvider.select((state) => state.groups));
    final subjectsState = ref.watch(subjectsProvider.select((state) => state.subjects));

    // Si los datos aún no están cargados, mostramos un indicador de carga
    if ((widget.isGroup && groupsState.isEmpty) || (!widget.isGroup && subjectsState.isEmpty)) {
      return const Center(child: CircularProgressIndicator());
    }

    // Construcción de la lista de opciones
    final options = widget.isGroup
        ? groupsState.map((group) => DropdownMenuItem<int>(
              value: group.grupoId,
              child: Text(group.nombreGrupo),
            )).toList()
        : subjectsState.map((subject) => DropdownMenuItem<int>(
              value: subject.materiaId,
              child: Text(subject.nombreMateria),
            )).toList();

    return Row(
      children: [
        // Dropdown para seleccionar el tipo (Grupo/Materia) [Solo visual]
        Flexible(
          flex: 2,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Tipo',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              isDense: true,
            ),
            items: const [
              DropdownMenuItem(value: 'Grupo', child: Text('Grupo')),
              DropdownMenuItem(value: 'Materia', child: Text('Materia')),
            ],
            value: widget.isGroup ? 'Grupo' : 'Materia',
            onChanged: null, // Desactivado, solo visual
          ),
        ),
        const SizedBox(width: 8),
        // Dropdown para seleccionar el grupo o materia
        Flexible(
          flex: 2,
          child: DropdownButtonFormField<int>(
            decoration: InputDecoration(
              labelText: widget.isGroup ? 'Grupo' : 'Materia',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              isDense: true,
            ),
            items: options,
            value: _selectedItemId,
            onChanged: _onItemSelected,
          ),
        ),
      ],
    );
  }
}
