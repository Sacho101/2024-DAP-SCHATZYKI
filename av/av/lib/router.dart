// lib/router.dart

import 'package:go_router/go_router.dart';
import 'package:av/screens/login_screen.dart';
import 'package:av/screens/add_user_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeName, // Ruta para la pantalla de login
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: AddUserScreen.routeName,
      path: AddUserScreen.routeName, // Ruta para agregar usuarios
      builder: (context, state) => const AddUserScreen(),
    ),
  ],
);
