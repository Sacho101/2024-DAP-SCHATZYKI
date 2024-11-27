import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:av/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Equipos - 2. Bundesliga',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FirebaseInitializationScreen(),
    );
  }
}

// Pantalla para inicializar Firebase
class FirebaseInitializationScreen extends StatelessWidget {
  const FirebaseInitializationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Firebase se inicializó correctamente
          return const LoginScreen();
        } else if (snapshot.hasError) {
          // Error al inicializar Firebase
          return Scaffold(
            body: Center(
              child: Text('Error al iniciar Firebase: ${snapshot.error}'),
            ),
          );
        } else {
          // Mientras Firebase se está inicializando
          return const Scaffold(
            body: Center(
              child: Text(
                'Iniciando Firebase...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          );
        }
      },
    );
  }
}
