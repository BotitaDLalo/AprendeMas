import 'package:aprende_mas/config/utils/packages.dart';
import 'custom_container_style.dart';

class ActivityBody extends StatelessWidget {
  const ActivityBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomContainerStyle(
      height: 250,
      width: double.infinity, 
      color: Colors.white,
      borderColor: Colors.blue, 
      child: Column(
        children: [
          _DateBody(),          
          _CustomDivider(),
          _Description(),
          _CustomDivider(),
          Text('Ver Completo', style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Text('Proident culpa officia velit elit commodo laboris velit voluptate mollit excepteur. Consectetur amet nisi velit non voluptate sit consectetur Lorem Lorem irure ea excepteur consequat labore. Quis et proident reprehenderit ad velit ad cupidatat reprehenderit non elit anim ut duis. Ullamco consectetur commodo sunt laboris nostrud amet aute elit cillum minim ullamco Lorem sint. Do culpa velit esse amet elit deserunt mollit occaecat dolor mollit enim ad veniam ut. Aliqua eiusmod quis consectetur minim consectetur nulla cillum ea excepteur elit sunt irure in.',
      style: TextStyle(fontSize: 10),
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Divider(
        color: Colors.grey,
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
          Icon(Icons.assignment_outlined, size: 30,),
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
          'Nombre de la tarea',
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