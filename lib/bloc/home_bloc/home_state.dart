import 'package:equatable/equatable.dart';

import '../../services/models.dart';

enum StateStatus { initial, loading, success, error }

class PokemonState extends Equatable {
  final StateStatus status;
  final List<PokemonModel> pokemonList;
  final String? message;

  PokemonState(
      {this.status = StateStatus.initial, List<PokemonModel>? pokemonList,this.message})
      : pokemonList = pokemonList ?? [];

  @override
  List<Object?> get props => [status, pokemonList];

  PokemonState copyWith(
      {List<PokemonModel>? pokemonList, StateStatus? status,String? message}) {
    return PokemonState(
        pokemonList: pokemonList ?? this.pokemonList,
        status: status ?? this.status,message: message??this.message);
  }
}
