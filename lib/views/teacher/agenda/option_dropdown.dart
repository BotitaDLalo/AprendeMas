

import 'package:aprende_mas/config/utils/packages.dart';

class OptionDropdownForm extends StatefulWidget {
  const OptionDropdownForm({super.key});

  @override
  State<OptionDropdownForm> createState() => _OptionDropdownFormState();
}

class _OptionDropdownFormState extends State<OptionDropdownForm> {
  String? _selectedType; // Almacena "Grupo" o "Materia"
  String? _selectedItem; // Almacena la selección del segundo dropdown
  List<String> _options = []; // Lista dinámica para el segundo dropdown

  // Simulamos datos de grupos y materias
  final List<String> _groups = ['Grupo A', 'Grupo B', 'Grupo C'];
  final List<String> _subjects = ['Materia 1', 'Materia 2', 'Materia 3'];

  void _updateOptions(String selectedType) {
    setState(() {
      _selectedType = selectedType;
      _selectedItem = null; // Reinicia la selección del segundo dropdown
      _options = selectedType == 'Grupo' ? _groups : _subjects;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Primer Dropdown
        Flexible(
          flex: 2,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Tipo',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              isDense: true, // Reduce el tamaño vertical
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
                _updateOptions(value);
              }
            },
          ),
        ),
        const SizedBox(width: 8), // Espaciado horizontal entre dropdowns
        // Segundo Dropdown
        Flexible(
          flex: 2,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: _selectedType == null
                  ? 'Seleccione un tipo primero'
                  : 'Seleccione ${_selectedType!.toLowerCase()}',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              isDense: true, // Reduce el tamaño vertical
            ),
            items: _options
                .map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option),
                    ))
                .toList(),
            value: _selectedItem,
            onChanged: _options.isNotEmpty
                ? (value) {
                    setState(() {
                      _selectedItem = value;
                    });
                  }
                : null,
          ),
        ),
      ],
    );
  }
}
