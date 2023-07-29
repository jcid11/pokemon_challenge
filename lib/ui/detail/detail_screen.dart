import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String pokemonName;

  const DetailScreen({Key? key, required this.pokemonName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(pokemonName,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
            ],
          )
        ],
      ),
    );
  }
}
