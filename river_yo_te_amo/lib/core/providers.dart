import 'package:flut/flutter_riverpod.dart';

import 'package:river_yo_te_amo/data/fake_notes_repository.dart';
import '../domain/notes_repository.dart';

final notesRepositoryProvider = Provider<NotesRepository>(
  (ref) => FakeNotesRepository(),
);