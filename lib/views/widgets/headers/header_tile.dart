import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'header_background.dart';

class HeaderTile extends StatelessWidget {
  final String svg;
  final String titulo;
  final Color colorUno;
  final Color colorDos;

  const HeaderTile({
    super.key,
    required this.svg,
    required this.titulo, 
    this.colorUno = Colors.grey, 
    this.colorDos = Colors.blueGrey, 
  });

  @override
  Widget build(BuildContext context) {
    final Color colorWhite = Colors.white;

    return Stack(
      children: [
        HeaderBackground(
          colorUno: colorUno, 
          colorDos: colorDos,          
        ),
        Positioned(
          top: -40,
          left: -70, 
          child: SvgPicture.asset(
            width: 250,
            height: 250,
            svg, 
            color: Colors.white.withOpacity(0.1) ,
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 120, width: double.infinity,),
            Text(titulo, style: TextStyle(color: colorWhite, fontSize: 30, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            SvgPicture.asset(
            width: 70,
            height: 70,
            svg, 
            color: Colors.white,
          ),
          ],
        ),
      ],
    );
  }
}