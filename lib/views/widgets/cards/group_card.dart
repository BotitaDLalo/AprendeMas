import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/groups/group.dart';
import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/data/data.dart';

class CustomExpansionTile extends ConsumerStatefulWidget {
  final int id;
  final String title;
  final String color;
  final String description;
  final String accessCode;
  final List<Widget> children;
  final Duration animationDuration;

  const CustomExpansionTile(
      {super.key,
      required this.id,
      required this.title,
      required this.color,
      required this.description,
      required this.children,
      required this.accessCode,
      this.animationDuration = const Duration(milliseconds: 600)});

  @override
  CustomExpansionTileState createState() => CustomExpansionTileState();
}

class CustomExpansionTileState extends ConsumerState<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador de animación
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    // Configura la animación con Curves.easeInOut para suavizar la animación
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward(); // Expande
      } else {
        _controller.reverse(); // Contrae
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyValueStorageService = KeyValueStorageServiceImpl();

    void pushGroupTeacherSettings(Group data) {
      context.push('/group-teacher-settings', extra: data);
    }

    void pushGroupStudentSettings(Group data) {
      context.push('/group-student-settings', extra: data);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              color: AppTheme.stringToColor(widget.color),
              child: Center(
                child: ListTile(
                  leading: SvgPicture.asset(
                    "assets/icons/grupo.svg",
                    height: 40,
                    width: 40,
                    colorFilter: const ColorFilter.mode(
                      Colors.white, // Cambia el color del SVG aquí
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(6.5),
                    child: Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  trailing: GestureDetector(
                    child: const Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 35,
                    ),
                    onTap: () async {
                      final data = Group(
                          grupoId: widget.id,
                          nombreGrupo: widget.title,
                          descripcion: widget.description,
                          codigoAcceso: widget.accessCode,
                          codigoColor: widget.color);

                      final role = await keyValueStorageService.getRole();

                      if (role == "Docente") {
                        pushGroupTeacherSettings(data);
                      } else {
                        pushGroupStudentSettings(data);
                      }
                    },
                  ),
                  onTap: _toggleExpand, // Expande/contrae con un solo toque
                ),
              ),
            ),
          ),
        ),
        // Usa AnimatedSize para suavizar la transición de tamaño
        AnimatedSize(
          duration: widget.animationDuration,
          //Curves.ease
          //Curves.easeOutCubic
          curve: Curves.decelerate,
          child: _isExpanded
              ? Column(
                  children: widget.children,
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
