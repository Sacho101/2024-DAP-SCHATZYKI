import 'package:go_router/go_router.dart';
import 'package:tp1_screens/screens/Details.dart';
import 'package:tp1_screens/screens/home_screen.dart';
import 'package:tp1_screens/screens/login_Screen.dart';
//
final appRouter = GoRouter(routes: [
  GoRoute(
    name: LoginScreen.name,
    path: '/',
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    name: Teamsscreen.name,
    path: '/home',
    builder: (context, state) => Teamsscreen(),
  ),
   GoRoute(
      name: TeamsDetailScreen.name,
      path: '/details/:teamsId',
      builder: (context, state) {
      
        final teamsId = state.pathParameters['teamsId'];
        return TeamsDetailScreen(
         teamsId: teamsId!,
        );
      },
    ),
  ],
);

