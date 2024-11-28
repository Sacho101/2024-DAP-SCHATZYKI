import 'package:flutter/material.dart';
import 'package:flutter_application_1/CORE/entities/movies.dart';
import 'package:flutter_application_1/CORE/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class EditMovieScreen extends StatefulWidget {
  final Movie movie;

  const EditMovieScreen({super.key, required this.movie});

  @override
  _EditMovieScreenState createState() => _EditMovieScreenState();
}

class _EditMovieScreenState extends State<EditMovieScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late String _imageUrl;

  @override
  void initState() {
    super.initState();
    _title = widget.movie.title;
    _description = widget.movie.desc;
    _imageUrl = widget.movie.urlimag;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Película')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              initialValue: _title,
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
              initialValue: _description,
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
              initialValue: _imageUrl,
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
              child: const Text('Actualizar Película'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final movieProvider = Provider.of<MovieProvider>(context, listen: false);
                  movieProvider.updateMovie(
                    widget.movie.id,
                    _title,
                    _description,
                    _imageUrl,
                  );
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Pelicula actualizada', style: TextStyle(fontSize: 20)),
                  backgroundColor: Color.fromARGB(255, 0, 255, 0),
                ));
                
                } else {
                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Por favor, rellenar campos vacios', style: TextStyle(fontSize: 20)),
                  backgroundColor: Color.fromARGB(255, 255, 0, 0),
                ));
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Eliminar Película'),
              onPressed: () {
                final movieProvider = Provider.of<MovieProvider>(context, listen: false);
                movieProvider.deleteMovie(widget.movie.id);
                Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Pelicula eliminada', style: TextStyle(fontSize: 20)),
                  backgroundColor: Color.fromARGB(255, 255, 0, 0),
                ));
                
              },
            ),
          ],
        ),
      ),
    );
  }
}