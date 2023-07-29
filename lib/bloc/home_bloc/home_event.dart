
import 'package:equatable/equatable.dart';

class PokemonEvent extends Equatable{
  const PokemonEvent();
  @override
  List<Object?>get props=>[];
}

final class FetchPokemons extends PokemonEvent{
  const FetchPokemons();
}