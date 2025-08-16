import 'dart:math';
import 'package:flutter/material.dart';

class TelaEscolha extends StatelessWidget {
  const TelaEscolha({super.key});

  final List<String> opcoes = const ["pedra", "papel", "tesoura"];

  String _escolhaAleatoria() {
    final random = Random();
    return opcoes[random.nextInt(opcoes.length)];
  }

  Widget _botaoEscolha(BuildContext context, String nomeImagem) {
    return GestureDetector(
      onTap: () {
        final escolhaApp = _escolhaAleatoria();
        Navigator.pushNamed(
          context,
          '/resultado',
          arguments: {'usuario': nomeImagem, 'app': escolhaApp},
        );
      },
      child: Image.asset("assets/$nomeImagem.png", width: 100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Pedra, Papel, Tesoura",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text("Escolha do APP (Aleatório)"),
            const SizedBox(height: 10),
            Image.asset("assets/padrao.png", width: 80),
            const SizedBox(height: 30),
            const Text(
              "Sua Escolha",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _botaoEscolha(context, "pedra"),
                const SizedBox(width: 20),
                _botaoEscolha(context, "papel"),
                const SizedBox(width: 20),
                _botaoEscolha(context, "tesoura"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
