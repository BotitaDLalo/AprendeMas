import 'package:aprende_mas/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateNoticeScreen extends StatelessWidget {
  const CreateNoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  HeaderTile(
                    svg: 'assets/icons/notificaciones.svg', 
                    titulo: 'Crear Avisos',
                    colorUno: Color(0xff536cf6),
                    colorDos: Color(0xff66A9F2),
                  ),
                  Positioned(
                    left: 10,
                    top: 40,
                    child: ButtonClose(),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    FormNotice(),
                    IconRow(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconRow extends StatelessWidget {
  const IconRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.file_upload_outlined), iconSize: 35,),
          IconButton(onPressed: () {}, icon: Icon(Icons.link_rounded), iconSize: 35,)
        ],
      ),
    );
  }
}
