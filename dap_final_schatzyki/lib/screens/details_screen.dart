// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dap_final_schatzyki/providers/provider.dart';
import 'package:dap_final_schatzyki/entities/equipo.dart';
import 'package:dap_final_schatzyki/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends ConsumerWidget {
  static const String name = 'detalles';
  DetailScreen({super.key});
  TextEditingController nombreController = TextEditingController();
  TextEditingController lugardenacimientoController = TextEditingController();
  TextEditingController dtController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController escudoController = TextEditingController();
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context, ref) {
    final List<Equipo> listaEquipo = ref.watch(equipoProvider);
    final index = ref.watch(indexEquipoSeleccionado);

    bool modoAgregar;
    if (index != -1) {
      nombreController.text = listaEquipo[index].nombre;
      lugardenacimientoController.text = listaEquipo[index].lugardenacimiento;
      dtController.text = listaEquipo[index].dt;
      yearController.text = listaEquipo[index].year;
      escudoController.text = listaEquipo[index].escudo;
      modoAgregar = false;
    } else {
      modoAgregar = true;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            "Detalles del Equipo",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ..._buildTextFields(),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      if (modoAgregar) {
                        ref.read(equipoProvider.notifier).subirDatos(
                            nombreController.text,
                            lugardenacimientoController.text,
                            dtController.text,
                            yearController.text,
                            escudoController.text);
                      } else {
                        ref.read(equipoProvider.notifier).modificarDatos(
                            listaEquipo[index].id,
                            nombreController.text,
                            lugardenacimientoController.text,
                            dtController.text,
                            yearController.text,
                            escudoController.text);
                      }
                      context.pushNamed(HomeScreen.name);
                    },
                    child: Text(
                      modoAgregar ? "Agregar" : "Modificar",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (!modoAgregar)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        db
                            .collection("Equipo")
                            .doc(listaEquipo[index].id)
                            .delete();
                        context.pushNamed(HomeScreen.name);
                      },
                      child: const Text(
                        "Eliminar",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildTextFields() {
    return [
      _buildTextField(nombreController, "Nombre del Equipo"),
      _buildTextField(lugardenacimientoController, "Lugar de nacimiento"),
      _buildTextField(dtController, "Director técnico"),
      _buildTextField(yearController, "Año"),
      _buildTextField(escudoController, "Link al escudo"),
    ];
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return SizedBox(
      height: 50,
      width: 350,
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.red),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.red),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
