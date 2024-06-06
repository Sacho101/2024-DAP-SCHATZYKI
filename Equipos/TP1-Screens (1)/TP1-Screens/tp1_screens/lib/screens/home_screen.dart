import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  static const String name = 'The best teams of Germany';

  String nombredeUsuario;
  HomeScreen({super.key, this.nombredeUsuario = ''});

 List<String> teams = ['Wehen', 'Holstein Kiel', 'Schalke 04',"Hamburgo","Fortuna Dusseldorf","St. Pauli","Herta Berlin","Kaiserslautern","Eintracht Braunschweig","Bochum","Borussia Monchengladbach"];
 List<String> info = [
 "El Wehen fue fundado en 1926,  es un club de fútbol alemán de la ciudad de Taunusstein, su mayor título es 7X Landespokal winner",
 "El Holstein Kiel fundado el 7 de octubre de 1900, consiguió su primer ascenso en la temporada 23/24, siendo ese, su mayor logro",
 "El Schalke 04 fue fundado  el 4 de mayo de 1904,  es un club de fútbol alemán de la ciudad de Gelsenkirchen, su mayor título es 1 copa de la UEFA en la temporada 96/97",
 "El Hamburgo se fundó el 29 de septiembre de 1887, su mayor tÍtulo es el campeonato de la copa de Europa 82/83",
 "El Fortuna Dusseldorf fue fundado en 1895 y juega actualmente en la 2da, su mayor título es 3 veces campeón de la copa Intertoto",
 "El St. Pauli fue fundado el 15 de mayo de 1910,  es un club de fútbol alemán de la ciudad de San Pauli su mayor título es el ascenso a la primera división en este mismo año",
 "El Herta Berlin fue fundado 25 de julio de 1892 mientras que su mayor título es la copa Alemana en los años 2001 y 2002",
 "El Kaiserslautern fue fundado El 2 de junio de 1900 y es un club de fútbol alemán de la ciudad de Kaiserslautern su mayor título es 3 veces campeón de la Bundesliga",
 "El Eintracht Braunschweig fue fundado el 15 de diciembre de 1895, mientras que su mayor título es la Bundesliga en el año 66/67",
 "El Bochum fue fundado en 1848, su mayor título es ganar la segunda división alemana, la mas reciente en la temporada 20/21",
 "Borussia Mönchengladbach fue fundado el 1 de agosto de 1900, su mayor título es la Bundesliga habiendo ganado 5 veces esta misma, la última en 1976/77"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The "best" teams of Germany')),
      body: ListView.builder(
      itemCount: teams.length,
      itemBuilder:(context, index) {
        return Card(
        child: ListTile(
          title: Text(teams[index]),
          subtitle: Text(info[index]),
        ),
        );
      },

      )
      
    );
  }
}
