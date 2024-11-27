import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home'; // Nombre de la ruta
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Equipos')),
      body: ListView.builder(
        itemCount: 10, // Simula 10 equipos
        itemBuilder: (context, index) {
          final teamId = 'team_$index';
          return ListTile(
            title: Text('Equipo $index'),
            onTap: () {
              // Navega a la pantalla de detalles con el ID del equipo
              context.go('/details/$teamId');
            },
          );
        },
      ),
    );
  }
}
