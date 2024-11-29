import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dap_final_schatzyki/entities/equipo.dart';

StateProvider<int> indexEquipoSeleccionado = StateProvider((ref) => -1);

final equipoProvider = StateNotifierProvider<EquipoNotifier, List<Equipo>>(
  (ref) => EquipoNotifier(),
);

class EquipoNotifier extends StateNotifier<List<Equipo>> {
  EquipoNotifier() : super([]);

  final db = FirebaseFirestore.instance;

  Future<void> obtenerDatos() async {
    try {
      final querySnapshot = await db.collection("Equipo").get();

      final listaEquipos = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Equipo(
          doc.id,
          data["nombre"] as String,
          data["lugardenacimiento"] as String,
          data["dt"] as String,
          data["year"] as String,
          data["escudo"] as String,
        );
      }).toList();
      state = listaEquipos;
    } catch (error) {
      print("Error al obtener datos: $error");
    }
  }

  Future<void> subirDatos(nombre, lugardenacimiento, dt, year, escudo) async {
    try {
      await db
          .collection("Equipo")
          .add({"nombre": nombre, "lugardenacimiento": lugardenacimiento, "dt": dt, "year": year, "escudo": escudo});
    } catch (error) {
      print("Error al subir datos: $error");
    }
  }

  Future<void> modificarDatos(id, nombre, lugardenacimiento, dt, year, escudo) async {
    try {
      await db.collection("Equipo").doc(id).set(
        {"nombre": nombre, "lugardenacimiento": lugardenacimiento, "dt": dt, "year": year, "escudo": escudo},
      );
    } catch (error) {
      print("Error al subir datos: $error");
    }
  }
}
