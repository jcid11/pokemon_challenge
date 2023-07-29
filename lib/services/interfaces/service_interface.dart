import '../../../ws_response.dart';

abstract class ServiceInterface{
  Future<WsResponse> getPokemonList();

}