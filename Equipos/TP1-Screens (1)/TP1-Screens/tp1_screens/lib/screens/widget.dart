import 'package:flutter/material.dart';
import 'package:tp1_screens/entities/teams.dart';
//

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.teams,
    this.onTap,
  });

  final Teams teams;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: teams.escudo != null
            ? _getPoster(teams.escudo!)
            : const Icon(Icons.sports_football_outlined),
        title: Text(teams.nombre),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => onTap?.call(),
      ),
    );
  }

  Widget _getPoster(String posterUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(posterUrl),
    );
  }
}