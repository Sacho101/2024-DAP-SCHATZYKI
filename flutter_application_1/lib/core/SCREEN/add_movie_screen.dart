import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/CORE/entities/movies.dart';
import 'package:flutter_application_1/CORE/providers/movies_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AddMovieScreen(),
    );
  }
}

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({super.key});

  @override
  _AddMovieScreenState createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  String _imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Película')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Título'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese un título';
                }
                return null;
              },
              onSaved: (value) => _title = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Descripción'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese una descripción';
                }
                return null;
              },
              onSaved: (value) => _description = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'URL de la imagen'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese una URL de imagen';
                }
                return null;
              },
              onSaved: (value) => _imageUrl = value!,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Guardar Película'),
              onPressed: () async {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();
    final movie = Movie(
      id: '', 
      title: _title,
      desc: _description,
      urlimag: _imageUrl,
    );

    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    await movieProvider.addMovie(movie);

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Película guardada', style: TextStyle(fontSize: 20)),
      backgroundColor: Color.fromARGB(255, 0, 255, 0),
    ));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Por favor, rellene los campos',
          style: TextStyle(fontSize: 20)),
      backgroundColor: Color.fromARGB(255, 255, 0, 0),
    ));
  }
}
,
            ),
          ],
        ),
      ),
    );
  }
}