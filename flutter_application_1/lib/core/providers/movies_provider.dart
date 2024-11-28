import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/CORE/entities/movies.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  final _moviesCollection = FirebaseFirestore.instance.collection('movies');

  
  Future<void> fetchMovies() async {
    try {
      final snapshot = await _moviesCollection.orderBy('createdAt', descending: true).get();
      _movies = snapshot.docs.map((doc) {
        final data = doc.data();
        return Movie(
          id: doc.id,
          title: data['title'],
          desc: data['description'],
          urlimag: data['imageUrl'],
        );
      }).toList();
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print('Error al cargar películas: $error');
      }
    }
  }

  Future<void> addMovie(Movie movie) async {
    try {
      final docRef = await _moviesCollection.add({
        'title': movie.title,
        'description': movie.desc,
        'imageUrl': movie.urlimag,
        'createdAt': FieldValue.serverTimestamp(),
      });
      movie.id = docRef.id;
      _movies.add(movie);
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print('Error al agregar película: $error');
      }
    }
  }

  Future<void> updateMovie(String id, String title, String description, String imageUrl) async {
    try {
      await _moviesCollection.doc(id).update({
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
      });

      final movieIndex = _movies.indexWhere((movie) => movie.id == id);
      if (movieIndex != -1) {
        _movies[movieIndex].title = title;
        _movies[movieIndex].desc = description;
        _movies[movieIndex].urlimag = imageUrl;
        notifyListeners();
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error al actualizar película: $error');
      }
    }
  }


  Future<void> deleteMovie(String id) async {
    try {
      await _moviesCollection.doc(id).delete();
      _movies.removeWhere((movie) => movie.id == id);
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print('Error al eliminar película: $error');
      }
    }
  }
}