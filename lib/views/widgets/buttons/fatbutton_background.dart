import 'package:aprende_mas/config/utils/packages.dart';

class FatButtonBackground extends StatelessWidget {
  final String svg;
  final Color colorUno;
  final Color colorDos;

  const FatButtonBackground({
    super.key, 
    required this.colorUno, 
    required this.colorDos, 
    required this.svg
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow( 
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(4, 6),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [
            colorUno,
            colorDos,
          ]
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: SvgPicture.asset(
              svg,
              width: 100,
              height: 100,
              color: Colors.white.withOpacity(0.2),
            )
          )
        ],
      ),
    );
  }
}

class FatButton extends StatelessWidget {
  final String svg;
  final String groupName;
  final Color colorUno;
  final Color colorDos;
  final void Function() onPressed;

  const FatButton({
    super.key, 
    required this.svg, 
    required this.groupName, 
    this.colorUno = Colors.grey, 
    this.colorDos = Colors.blueGrey, 
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          FatButtonBackground(
            svg: svg,
            colorUno: colorUno,
            colorDos: colorDos,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 140, width: 40,),
              SvgPicture.asset(
                svg,
                width: 40,
                height: 40,
                color: Colors.white,
              ),
              const SizedBox(width: 20,),
              Expanded(
                child: Text(groupName, style: const TextStyle(color: Colors.white, fontSize: 18),)),
              IconButton(
                onPressed: onPressed, 
                icon: const Icon(Icons.chevron_right, color: Colors.white, size: 40,)
              ),
              const SizedBox(width: 30,),
            ],
          )
        ],
      ),
    );
  }
}