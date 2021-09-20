import 'dart:convert';

class Heros {
  final String url;
  final String nome;
  final bool aovivo;
  final bool favorito;
  Heros({
    required this.url,
    required this.nome,
    required this.aovivo,
    required this.favorito,
  });

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'nome': nome,
      'aovivo': aovivo,
      'favorito': favorito,
    };
  }

  factory Heros.fromMap(Map<String, dynamic> map) {
    return Heros(
      url: map['url'],
      nome: map['nome'],
      aovivo: map['aovivo'],
      favorito: map['favorito'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Heros.fromJson(String source) => Heros.fromMap(json.decode(source));
}
