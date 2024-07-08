import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tp1_screens/screens/home_screen.dart';

List<String> users = ['Mati', 'Gabi', 'Messi'];
List<String> passwords = ['123', '456', '789'];

int user1 = users.indexOf('Mati');
int user2 = users.indexOf('Gabi');
int user3 = users.indexOf('Messi');

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  static const String name = 'login';
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

                if (!users.contains(textoingresadouser)) {
                  const userNoExiste = SnackBar(
                    duration: Duration(seconds: 5),
                    content: Text('Usuario no existe.'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(userNoExiste);
                } else {
                  int user = users.indexOf(textoingresadouser);
                  if (passwords[user] != textoingresadopass) {
                    const logInFallido = SnackBar(
                      duration: Duration(seconds: 5),
                      content: Text('Contraseña incorrecta.'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(logInFallido);
                  } else {
                    context.pushNamed(Teamsscreen.name,
                        extra: userController.text);
                    const logInExitoso = SnackBar(
                      duration: Duration(seconds: 5),
                      content: Text('Contraseña incorrecta.'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(logInExitoso);
                  }
                }
                if (textoingresadouser.isEmpty || textoingresadopass.isEmpty) {
                  //¿Se ha ingresado Usuario y Contraseña?
                  const logInVacio = SnackBar(
                    duration: Duration(seconds: 5),
                    content: Text('Campos Vacíos'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(logInVacio);
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