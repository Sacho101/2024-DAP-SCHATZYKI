import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dap_final_schatzyki/screens/home_screen.dart';
import 'package:dap_final_schatzyki/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool textoOculto = true;
  bool textoCubierto = false;

  String mensajeError = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          const Text(
            "Iniciar Sesión",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: 350,
            child: TextField(
              controller: userController,
              style: const TextStyle(color: Colors.red),
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: const TextStyle(color: Colors.red),
                icon: const Icon(Icons.email, color: Colors.red),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 65,
            width: 350,
            child: TextField(
              controller: passController,
              obscureText: textoOculto,
              style: const TextStyle(color: Colors.red),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                hintStyle: const TextStyle(color: Colors.red),
                icon: const Icon(Icons.key, color: Colors.red),
                suffixIcon: IconButton(
                  icon: Icon(
                    textoOculto ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      textoOculto = !textoOculto;
                    });
                  },
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (mensajeError.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                mensajeError,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () async {
              setState(() {
                mensajeError = '';
              });
              try {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: userController.text,
                  password: passController.text,
                );
                context.pushNamed(HomeScreen.name);
              } on FirebaseAuthException catch (e) {
                setState(() {
                  if (e.code == 'channel-error') {
                    mensajeError = 'Complete email y contraseña';
                  } else if (e.code == 'invalid-credential') {
                    mensajeError = 'Usuario o contraseña incorrecto';
                  } else if (e.code == 'missing-password') {
                    mensajeError = 'Poner contraseña';
                  } else if (e.code == 'invalid-email') {
                    mensajeError = 'Email inválido';
                  } else if (e.code == 'too-many-requests') {
                    mensajeError =
                        'Se intentó iniciar sesión muchas veces, intente más tarde.';
                  } else {
                    mensajeError = 'Error desconocido: ${e.code}';
                  }
                });
              }
            },
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 20),
          MouseRegion(
            onEnter: (_) => setState(() => textoCubierto = true),
            onExit: (_) => setState(() => textoCubierto = false),
            child: GestureDetector(
              onTap: () {
                context.pushNamed(RegisterScreen.name);
              },
              onTapDown: (_) {
                setState(() {
                  textoCubierto = true;
                });
              },
              onTapUp: (_) {
                setState(() {
                  textoCubierto = false;
                });
              },
              onTapCancel: () {
                setState(() {
                  textoCubierto = false;
                });
              },
              child: Text(
                "No tenés cuenta? Registrate",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: textoCubierto
                      ? const Color.fromARGB(178, 255, 0, 0)
                      : const Color.fromARGB(255, 255, 50, 50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
