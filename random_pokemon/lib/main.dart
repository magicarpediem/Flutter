import 'dart:math';

import 'package:flutter/material.dart';

import 'masked';

void main() {
  runApp(stlessPokemon());
}

class stlessPokemon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
      ),
      body: stfulPokemon(),
    );
  }
}

class stfulPokemon extends StatefulWidget {
  @override
  _stfulPokemonState createState() => _stfulPokemonState();
}

class _stfulPokemonState extends State<stfulPokemon> {
  int pokeNum = 0;
  String pokeStr = '000';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
          onPressed: () {
            pokeNum = Random().nextInt(829) + 1;
            if (pokeNum < 10) {
              pokeStr = '00' + pokeNum.toString();
            } else if (pokeNum < 100) {
              pokeStr = '0' + pokeNum.toString();
            } else {
              pokeStr = pokeNum.toString();
            }
          },
          child: Image.asset('images/$pokeStr.png'),
        ),
      ),
    );
  }
}
