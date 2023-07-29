import 'dart:convert';
import 'package:poke_challenge/services/ws_service.dart';
import '../../ws_response.dart';
import 'interfaces/service_interface.dart';
import 'package:http/http.dart' as http;

import 'models.dart';

class Services with WsService implements ServiceInterface {
  @override
  Future<WsResponse> getPokemonList()async{
    List<PokemonModel> pokemonList=[];
    http.Response? response = await executeHttpRequest(url: 'https://db.pokemongohub.net/api/pokemon/with-generation/1',method: HttpMethod.GET);
    List jsonList = jsonDecode(response!.body);
    if(response.statusCode==200){
      try{
        for(var element in jsonList){
          var pokemon = PokemonModel(name: element['name']);
          pokemonList.add(pokemon);
        }
        return WsResponse(success: true,data: pokemonList);
      }catch(e){
        return WsResponse(success: false,message: e.toString());
      }
    }
    return WsResponse(success: false,message: 'Connection was not successful');

  }
}