import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:av/screens/login_screen.dart';
import 'package:av/screens/home_screen.dart';
import 'package:av/screens/detail_screen.dart';
// Configuración de las rutas
final appRouter = GoRouter(
  initialLocation: '/', // Ruta inicial
  routes: [
    // Ruta para la pantalla de Login
    GoRoute(
      name: LoginScreen.routeName,
      path: '/', // Ruta raíz
      builder: (context, state) => const LoginScreen(),
    ),
    // Ruta para la pantalla principal
    GoRoute(
      name: HomeScreen.routeName,
      path: '/home', // Ruta para Home
      builder: (context, state) => const HomeScreen(),
    ),
    // Ruta para la pantalla de Detalles
    GoRoute(
      name: DetailsScreen.routeName,
      path: '/details/:teamId', // Ruta dinámica con parámetro `teamId`
      builder: (context, state) {
        final String teamId = state.pathParameters['teamId']!;
        return DetailsScreen(teamId: teamId);
      },
    ),
  ],
);
