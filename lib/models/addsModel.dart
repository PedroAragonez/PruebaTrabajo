

class Anuncio {
  final int id;
  final String titulo;
  final String tipo;
  final double precio;
  final String imagen;
  final String longitud;
  final String latitud;

  Anuncio({
    required this.id,
    required this.titulo,
    required this.tipo,
    required this.precio,
    required this.imagen,
    required this.longitud,
    required this.latitud,
  });

  factory Anuncio.fromJson(Map<String, dynamic> json) {
    return Anuncio(
      id: json['id'] as int,
      titulo: json['titulo'] as String,
      tipo: json['tipo'] as String,
      precio: double.parse(json['precio'].toString()),
      imagen: json['imagen'] as String,
      longitud: json['longitud'] as String,
      latitud: json['latitud'] as String,
    );
  }
}
