import 'package:aprende_mas/config/utils/packages.dart';
import 'package:flutter_svg/svg.dart';

class CustomExpansionTile extends ConsumerStatefulWidget {
  final String title;
  final List<Widget> children;
  final Duration animationDuration;
  final Color color;

  const CustomExpansionTile(
      {super.key,
      required this.title,
      required this.color,
      required this.children,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              color: widget.color,
              child: ListTile(
                leading: SvgPicture.asset(
                  "assets/icons/grupo.svg",
                  height: 35,
                  width: 35,
              colorFilter: const ColorFilter.mode(
                Colors.white, // Cambia el color del SVG aquí
                BlendMode.srcIn,),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(6.5),
                  child: Text(
                    widget.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                onTap: _toggleExpand, // Expande/contrae con un solo toque
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
