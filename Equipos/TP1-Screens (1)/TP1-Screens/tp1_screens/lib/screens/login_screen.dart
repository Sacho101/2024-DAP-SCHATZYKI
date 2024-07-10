import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tp1_screens/core/contradata.dart';
import 'package:tp1_screens/screens/home_screen.dart';
import 'package:tp1_screens/entities/contra.dart';




// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  static const String name = 'login';
  final List<Usuario> teams = usuariolist;
  LoginScreen({super.key});

  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userController,
              decoration: const InputDecoration(
                hintText: 'Usuario',
                icon: Icon(Icons.person),
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Contraseña',
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                String textoingresadouser = userController.text;
                String textoingresadopass = passwordController.text;

                if (textoingresadouser.isEmpty || textoingresadopass.isEmpty) {
                  //¿Se ha ingresado Usuario y Contraseña?
                  const logInVacio = SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('Campos Vacíos'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(logInVacio);
                  return;
                }

                Usuario? usuario = usuariolist.firstWhere(
                  (user) => user.nombre == textoingresadouser,
                  orElse: () => Usuario(id: '', nombre: '', contra: ''),
                );

                if (usuario.nombre.isEmpty) {
                  const userNoExiste = SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('Usuario no existe.'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(userNoExiste);
                } else if (usuario.contra != textoingresadopass) {
                  const logInFallido = SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('Contraseña incorrecta.'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(logInFallido);
                } else {
                  context.pushNamed(Teamsscreen.name, extra: usuario.nombre);
                  const logInExitoso = SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('Inicio de sesión exitoso.'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(logInExitoso);
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
