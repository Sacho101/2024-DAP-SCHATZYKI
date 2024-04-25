import 'package:a_3_0/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String user = "yo";
  String pass = "vos";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Logueo",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                ),
              TextField(
                controller: userController,
                decoration: const InputDecoration(
                  hintText: 'Usuario',
                  icon: Icon(Icons.person)
                  ),
              ),
              TextField(
                controller: passController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Contraseña',
                  icon: Icon(Icons.key)
                  ),
              ),
              ElevatedButton(
                onPressed: (){
                  if(userController.text == 'yo' && passController.text == 'vos'){
                    print("Ok");
                    context.pushNamed(HomeScreen.name, extra: userController.text);
                  }
                  else if(userController.text == '' && passController.text == ''){
                    print('Usuario y Contraseña Vacios');
                  }
                  else if(userController.text == ''){
                    print('Usuario Vacio');
                  }
                  else if(passController.text == ''){
                    print('Contraseña Vacia');
                  }
                  else if(userController.text != user || passController.text != pass){
                    print('Usuario o Contraseña incorrecto');
                  }
                }, 
                child: const Text("Login")
              ),
            ],
          )
        )
      ),
    );
  }
}
