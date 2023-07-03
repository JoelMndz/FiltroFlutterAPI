import 'package:flutter/material.dart';
import 'package:reporte_aeropuerto/models/ItemReporte.dart';

class CardItem extends StatelessWidget {
  final ItemReporte item;

  CardItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 12),
      child: ListTile(
        title: Center(
            child: Text(
          item.aerolinea,
          style: TextStyle(fontSize: 20),
        )),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Monto recaudado: ${item.monto}'),
            Text('Impuesto recaudado: ${item.impuesto}'),
            Text('Total alcanzado: ${item.total}'),
            Text('Promedio alcanzado: ${item.promedio}'),
          ],
        ),
      ),
    );
  }
}
