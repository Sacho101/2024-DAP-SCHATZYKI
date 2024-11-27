import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = 'details'; // Nombre de la ruta
  final String teamId;

  const DetailsScreen({Key? key, required this.teamId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalles del Equipo $teamId')),
      body: Center(
        child: Text('Información detallada del equipo: $teamId'),
      ),
    );
  }
}
