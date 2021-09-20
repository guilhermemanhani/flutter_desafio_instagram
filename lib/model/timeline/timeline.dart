import 'dart:convert';

class Timeline {
  final String urlPerfil;
  final String urlFoto;
  final String nome;
  final int curtidas;
  final int comentarios;
  final String msg;
  Timeline({
    required this.urlPerfil,
    required this.urlFoto,
    required this.nome,
    required this.curtidas,
    required this.comentarios,
    required this.msg,
  });

  Map<String, dynamic> toMap() {
    return {
      'urlPerfil': urlPerfil,
      'urlFoto': urlFoto,
      'nome': nome,
      'curtidas': curtidas,
      'comentarios': comentarios,
      'msg': msg,
    };
  }

  factory Timeline.fromMap(Map<String, dynamic> map) {
    return Timeline(
      urlPerfil: map['urlPerfil'],
      urlFoto: map['urlFoto'],
      nome: map['nome'],
      curtidas: map['curtidas'],
      comentarios: map['comentarios'],
      msg: map['msg'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Timeline.fromJson(String source) =>
      Timeline.fromMap(json.decode(source));
}
