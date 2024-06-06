import 'package:go_router/go_router.dart';
import 'package:tp1_screens/screens/home_screen.dart';
import 'package:tp1_screens/screens/login_Screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    name: LoginScreen.name,
    path: '/',
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    name: HomeScreen.name,
    path: '/home',
    builder: (context, state) => HomeScreen(),
  ),
]);
