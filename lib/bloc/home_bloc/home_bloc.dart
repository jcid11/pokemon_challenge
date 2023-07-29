
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_challenge/services/interfaces/service_interface.dart';
import 'package:poke_challenge/services/services.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<PokemonEvent,PokemonState>{
  final ServiceInterface _serviceInterface;
  HomeBloc():_serviceInterface=Services(),super(PokemonState()){
    on<FetchPokemons>(_getPokemonList);
  }
  Future<void> _getPokemonList(PokemonEvent event,Emitter<PokemonState>emit)async{
    try{
      emit(state.copyWith(status: StateStatus.loading));
      final pokemonList = await _serviceInterface.getPokemonList();
      emit(state.copyWith(status: StateStatus.success,pokemonList: pokemonList.data));
    }catch(e){
      emit(state.copyWith(status: StateStatus.error,message: 'the pokemon api didn\'t reload correctly'));
    }
  }
}