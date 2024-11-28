import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/CORE/providers/movies_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/core/SCREEN/login_screen.dart';

void main() async {
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      child: MaterialApp(
        title: 'Movie List App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const LoginScreen(),
      ),
    ),
  );
}
