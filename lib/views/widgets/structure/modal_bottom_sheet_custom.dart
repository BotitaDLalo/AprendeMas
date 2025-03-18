    import 'package:aprende_mas/config/utils/packages.dart';

void modalBottomSheetCustom(BuildContext context, List<Widget> lsOptions) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16), // Bordes redondeados
          ),
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: lsOptions,
            ),
          );
        },
      );
    }
