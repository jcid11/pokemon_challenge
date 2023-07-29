import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_challenge/bloc/home_bloc/home_event.dart';
import 'package:poke_challenge/bloc/home_bloc/home_state.dart';
import 'package:poke_challenge/ui/detail/detail_screen.dart';

import '../../bloc/home_bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const FetchPokemons());
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, PokemonState>(
      listener: (context, state) {
        if (state.status == StateStatus.error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.message ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<HomeBloc, PokemonState>(
              builder: (context, state) {
                return state.status == StateStatus.loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : state.status == StateStatus.success
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: state.pokemonList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: RawMaterialButton(
                                    constraints:
                                        const BoxConstraints(minHeight: 0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                                pokemonName: state
                                                    .pokemonList[index].name))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child:
                                          Text(state.pokemonList[index].name),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Text(state.message.toString());
              },
            )
          ],
        ),
      ),
    );
  }
}
