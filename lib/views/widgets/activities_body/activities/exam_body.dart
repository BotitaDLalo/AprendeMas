import 'package:aprende_mas/config/utils/packages.dart';
import '../custom_container_style.dart';

class ExamBody extends StatelessWidget {
  const ExamBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomContainerStyle(
      height: 70,
      width: double.infinity, 
      color: Colors.white,
      borderColor: Colors.blue, 
      child: Column(
        children: [
          _DateBody(),          
        ],
      ),
    );
  }
}


class _DateBody extends StatelessWidget {
  const _DateBody();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.workspace_premium, size: 30,),
          SizedBox(width: 10,),
          _ActivityDates(),
          SizedBox(width: 70,),
          _DeliveryDate()
        ],
      ),
    );
  }
}

class _DeliveryDate extends StatelessWidget {
  const _DeliveryDate();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Fecha de entrega :', 
          style: TextStyle( fontWeight: FontWeight.bold, fontSize: 12),),
        Text('19/10/2024   23:59', style: TextStyle(fontSize: 8),)
      ],
    );
  }
}

class _ActivityDates extends StatelessWidget {
  const _ActivityDates();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nombre del examen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12
          ),
        ),
        Text(
          'Publicado: 18/10/2024 23:59',
          style: TextStyle(fontSize: 8),
        )
      ],
    );
  }
}