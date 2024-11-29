import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dap_final_schatzyki/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String name = 'register';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            "Regístrate",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _RegisterView(),
          ),
        ],
      ),
    );
  }
}

class _RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String mensajeError = '';
  bool textoOculto1 = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 350,
            child: TextField(
              controller: userController,
              decoration: const InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.red),
                icon: Icon(Icons.email, color: Colors.red),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              style: const TextStyle(color: Colors.red),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: 350,
            child: TextField(
              controller: passController,
              obscureText: textoOculto1,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                hintStyle: const TextStyle(color: Colors.red),
                icon: const Icon(Icons.key, color: Colors.red),
                suffixIcon: IconButton(
                  icon: Icon(
                    textoOculto1 ? Icons.visibility_off : Icons.visibility,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      textoOculto1 = !textoOculto1;
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
              style: const TextStyle(color: Colors.red),
            ),
          ),
          if (mensajeError.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
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
              if (passController.text.isEmpty || userController.text.isEmpty) {
                setState(() {
                  mensajeError = 'Por favor, completar los datos';
                });
                return;
              }
              try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: userController.text,
                  password: passController.text,
                );
                context.goNamed(LoginScreen.name);
              } on FirebaseAuthException catch (e) {
                setState(() {
                  if (e.code == 'weak-password') {
                    mensajeError = 'La contraseña es demasiado débil';
                  } else if (e.code == 'email-already-in-use') {
                    mensajeError = 'El email ya está en uso';
                  } else if (e.code == 'invalid-email') {
                    mensajeError = 'El email es inválido';
                  } else {
                    mensajeError = 'Error desconocido: ${e.code}';
                  }
                });
              }
            },
            child: const Text(
              "Confirmar",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
