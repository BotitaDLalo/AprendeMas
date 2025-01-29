import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/providers.dart';

class OptionDropdownForm extends ConsumerStatefulWidget {
  const OptionDropdownForm({super.key});

  @override
  ConsumerState<OptionDropdownForm> createState() => _OptionDropdownFormState();
}

class _OptionDropdownFormState extends ConsumerState<OptionDropdownForm> {
  String? _selectedType; // Almacena "Grupo" o "Materia"
  int? _selectedItemId; // Almacena el ID seleccionado
  List<Map<String, dynamic>> _options = []; // Lista dinámica para el segundo dropdown
  

  @override
void initState() {
  super.initState();
  // Cargar grupos si aún no se han cargado
  final groupsState = ref.read(groupsProvider);
  if (groupsState.groups.isEmpty) {
    ref.read(groupsProvider.notifier).getGroupsSubjects();
  }

  final subjectsState = ref.read(subjectsProvider);
  if (subjectsState.isEmpty) {
    ref.read(subjectsProvider.notifier).getSubjects();
  }
}

void _updateOptions(String selectedType) {
  setState(() {
    _selectedType = selectedType;
    _selectedItemId = null; // Reinicia la selección del segundo dropdown

    if (selectedType == 'Grupo') {
      final groupsState = ref.read(groupsProvider);

      print('Grupos cargados: $groupsState'); // Depuración

      _options = groupsState.groups.map((group) {
        return {'id': group.grupoId.toString(), 'name': group.nombreGrupo};
      }).toList();
    } else {
      final subjectsState = ref.read(subjectsProvider);

      print('Materias cargadas: $subjectsState'); // Depuración

      _options = subjectsState.map((subject) {
        return {'id': subject.subjectId.toString(), 'name': subject.nombreMateria};
      }).toList();
    }

    print('Opciones actualizadas: $_options'); // Verifica las opciones cargadas
  });
}


  @override
Widget build(BuildContext context) {
  return Row(
    children: [
      // Primer Dropdown: Selección de tipo
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
          items: ['Grupo', 'Materia']
              .map((type) => DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  ))
              .toList(),
          value: _selectedType,
          onChanged: (value) {
            if (value != null) {
              _updateOptions(value); // Llama al método de actualización
            }
          },
        ),
      ),
      const SizedBox(width: 8), // Espaciado entre dropdowns

      Flexible(
  flex: 2,
  child: DropdownButtonFormField<int>(
    decoration: InputDecoration(
      labelText: _selectedType == null
          ? 'Seleccione un tipo primero'
          : 'Seleccione ${_selectedType!.toLowerCase()}',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      isDense: true,
    ),
    items: _options.isEmpty
        ? [] // Si no hay opciones, muestra vacío
        : _options.map((option) {
            return DropdownMenuItem(
              value: int.parse(option['id']), // Convierte a entero
              child: Text(option['name']),
            );
          }).toList(),
    value: _selectedItemId,
    onChanged: _options.isNotEmpty
        ? (value) {
            setState(() {
              _selectedItemId = value;
            });
          }
        : null, // Deshabilita si no hay opciones
  ),
),

    ],
  );
}

}
