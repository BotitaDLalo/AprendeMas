import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...cards.map((card) =>
            _CardType1(label: card['label'], elevation: card['elevation'])),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370,
      height: 350,
      child: Card(
        elevation: elevation,
        child: Column(
          children: [
            Container(
              width: 370,
              height: 70,
              color: Colors.blueAccent.shade400,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(label),
                    ),
                    const SizedBox(
                      width: 195,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert_outlined)),
                    ),
                  ],
                ),
              ),
            ),
            const Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text('19/08/2024  23:59 - Tarea XY'),
                Text('19/08/2024  23:59 - Tarea XX'),
              ],
            ),
            const SizedBox(
              height: 140,
            ),
            const Divider(
              color: Colors.black, // Color de la línea divisoria
              thickness: 1, // Grosor de la línea divisoria
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.assignment)),
                const SizedBox(
                  width: 90,
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.people_alt)),
                const SizedBox(
                  width: 80,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.star_border_rounded)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
