// lib/screens/login_screen.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:av/screens/add_user_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login'; // Identificador de ruta

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(), // Inicializa Firebase
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mientras se conecta Firebase, muestra el mensaje de carga
          return const Scaffold(
            body: Center(
              child: Text(
                'Conectándose a Firebase...',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          // Si hay un error al inicializar Firebase, muestra un mensaje de error
          return const Scaffold(
            body: Center(
              child: Text(
                'Error al conectar con Firebase. Por favor, reinicia la aplicación.',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
          );
        }

        // Si Firebase se inicializa correctamente, muestra la pantalla de login
        return const LoginForm();
      },
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                try {
                  // Intenta iniciar sesión con Firebase Auth
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Inicio de sesión exitoso'),
                    ),
                  );

                  // Aquí podrías agregar la navegación a otra pantalla si es necesario
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: $e')),
                  );
                }
              },
              child: const Text('Iniciar Sesión'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.go(AddUserScreen.routeName); // Navega a agregar usuario
              },
              child: const Text('Agregar Usuario'),
            ),
          ],
        ),
      ),
    );
  }
}
