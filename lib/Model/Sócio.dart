class Socio {
  final String nomeSocio;

  Socio({required this.nomeSocio});

  factory Socio.fromJson(Map<String, dynamic> json) {
    return Socio(
      nomeSocio: json['nome_socio'],
    );
  }
}