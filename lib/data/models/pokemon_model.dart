import 'dart:convert';

class PokemonModel {
  final String nome;
  final String tipo;
  final double altura;
  final double peso;

  PokemonModel({
    required this.nome,
    required this.tipo,
    required this.altura,
    required this.peso,
  });

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));

  get body => null;

  static fromMap(decode) {}
}
