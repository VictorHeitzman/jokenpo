// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _mensagem = 'Escolha uma opção abaixo';

  var _imagemApp = const AssetImage('img/padrao.png');

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];

    var numero = Random().nextInt(3);

    var escolhaApp = opcoes[numero];

    print('Escolha Usuario: $escolhaUsuario');
    print('Escolha App: $escolhaApp');

    switch (escolhaApp) {
      case 'pedra':
        setState(() {
          _imagemApp = const AssetImage('img/pedra.png');
        });
        break;

      case 'papel':
        setState(() {
          _imagemApp = const AssetImage('img/papel.png');
        });
        break;
      case 'tesoura':
        setState(() {
          _imagemApp = const AssetImage('img/tesoura.png');
        });
        break;
    }

    //Usuario ganhador
    if (escolhaUsuario == 'pedra' && escolhaApp == 'tesoura' ||
        escolhaUsuario == 'tesoura' && escolhaApp == 'papel' ||
        escolhaUsuario == 'papel' && escolhaApp == 'pedra') {
      setState(() {
        _mensagem = 'Você ganhou!';
      });
    }
    // App ganhador
    else if (escolhaApp == 'pedra' && escolhaUsuario == 'tesoura' ||
        escolhaApp == 'tesoura' && escolhaUsuario == 'papel' ||
        escolhaApp == 'papel' && escolhaUsuario == 'pedra') {
      setState(() {
        _mensagem = 'Você Perdeu!';
      });
    } else {
      setState(() {
        _mensagem = 'Empatamos!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jokenpo',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do App',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(
            image: _imagemApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada('pedra'),
                child: Image.asset(
                  'img/pedra.png',
                  height: 95,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('papel'),
                child: Image.asset(
                  'img/papel.png',
                  height: 95,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('tesoura'),
                child: Image.asset(
                  'img/tesoura.png',
                  height: 95,
                ),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                'Rodadas',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)            
              ),
              
              )
        ],
      ),
    );
  }
}
