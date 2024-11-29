import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:dap_final_schatzyki/entities/equipo.dart';
import 'package:dap_final_schatzyki/screens/details_screen.dart';
import 'package:dap_final_schatzyki/providers/provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String name = 'home';
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(equipoProvider.notifier).obtenerDatos();
  }

  @override
  Widget build(BuildContext context) {
    final List<Equipo> listaEquipo = ref.watch(equipoProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            "Lista de Equipos",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: listaEquipo.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.red[100],
                  child: ListTile(
                    title: Text(
                      listaEquipo[index].nombre,
                      style: const TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      listaEquipo[index].dt,
                      style: const TextStyle(color: Colors.black),
                    ),
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(listaEquipo[index].escudo),
                    ),
                    onTap: () {
                      ref.read(indexEquipoSeleccionado.notifier).state = index;
                      context.pushNamed(DetailScreen.name);
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              ref.read(indexEquipoSeleccionado.notifier).state = -1;
              context.pushNamed(DetailScreen.name);
            },
            child: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
