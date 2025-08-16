import 'package:flutter/material.dart';
import 'pages/tela_escolha.dart';
import 'pages/tela_resultado.dart';

void main() {
  runApp(const PedraPapelTesouraApp());
}

class PedraPapelTesouraApp extends StatelessWidget {
  const PedraPapelTesouraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedra Papel Tesoura',
      debugShowCheckedModeBanner: false,
      initialRoute: '/escolha',
      routes: {
        '/escolha': (_) => const TelaEscolha(),
        '/resultado': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return TelaResultado(
            escolhaUsuario: args['usuario'],
            escolhaApp: args['app'],
          );
        },
      },
    );
  }
}
