// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:tp1_screens/core/data.dart';
import 'package:tp1_screens/entities/teams.dart';

class TeamsDetailScreen extends StatelessWidget {
  const TeamsDetailScreen({
    super.key,
    required this.teamsId,
  });

  static const String name = 'Teams_details_screen';
  final String teamsId;

  @override
  Widget build(BuildContext context) {
    final teams = teamsList.firstWhere((teams) => teams.nuemro == teamsId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Teams'),
      ),
      body: TeamsDetailView(teams: teams),
    );
  }
}

class TeamsDetailView extends StatelessWidget {
  const TeamsDetailView({
    super.key,
    required this.teams,
  });

  final Teams teams;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (teams.escudo != null) Image.network(teams.escudo!, height: 400),
          const SizedBox(height: 16),
          Text(
            teams.nombre,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'DT: ${teams.dt}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            'Año: ${teams.year}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
