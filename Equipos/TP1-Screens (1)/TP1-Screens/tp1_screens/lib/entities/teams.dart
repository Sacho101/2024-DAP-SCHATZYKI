class Teams {
  final String nuemro;
  final String nombre;
  final String lugardenacimiento;
  final String dt;
  final String year;
  final String? escudo;
//
  Teams({
     required this.nuemro,
    required this.nombre,
    required this.lugardenacimiento,
    required this.dt,
    required this.year,
    this.escudo,
  });
}