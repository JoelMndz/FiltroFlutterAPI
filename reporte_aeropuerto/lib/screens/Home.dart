import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reporte_aeropuerto/models/ItemReporte.dart';
import 'package:reporte_aeropuerto/widgets/CardItem.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:http/http.dart' as http;

const String API = "http://192.168.100.10:3000/api";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> _aeropuertos = [];
  List<ItemReporte> _resultados = [];

  @override
  void initState() {
    super.initState();
    obtenerAeropuertos();
  }

  Future<void> obtenerAeropuertos() async {
    try {
      var respuesta = await http.get(Uri.parse(API));
      if (respuesta.statusCode == 200) {
        var lista = List<Map<String, dynamic>>.from(jsonDecode(respuesta.body));
        for (var element in lista) {
          _aeropuertos.add(
              {"label": element["nombre"], "value": element["idaeropuerto"]});
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> filtrar(String id) async {
    try {
      var respuesta = await http.get(Uri.parse("$API/$id"));
      if (respuesta.statusCode == 200) {
        var lista = List<Map<String, dynamic>>.from(jsonDecode(respuesta.body));
        List<ItemReporte> temporal = [];
        for (var i in lista) {
          temporal.add(ItemReporte(
              i["AEROLINEA"],
              i["AEROPUERTO"],
              double.parse(i["MONTO RECAUDADO"].toString()),
              double.parse(i["IMPUESTO RECAUDADO"].toString()),
              double.parse(i["TOTAL ALCANZADO"].toString()),
              double.parse(i["PROMEDIO ALCANZADO"].toString())));
        }
        setState(() {
          _resultados = temporal;
        });
      }
    } catch (e) {
      print("Error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Reporte Aeropuertos',
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Color.fromARGB(255, 29, 59, 141),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SelectFormField(
              type: SelectFormFieldType.dialog,
              items: _aeropuertos,
              labelText: 'Aeropuerto',
              onChanged: ((id) => {filtrar(id)}),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _resultados.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardItem(_resultados[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
