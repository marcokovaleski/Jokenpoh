import 'package:flutter/material.dart';

void main() {
  runApp(const PedraPapelTesouraApp());
}

class PedraPapelTesouraApp extends StatelessWidget {
  const PedraPapelTesouraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pedra Papel Tesoura',
      debugShowCheckedModeBanner: false,
      home: TelaEscolha(),
    );
  }
}

class TelaEscolha extends StatelessWidget {
  const TelaEscolha({super.key});

  /// Cria um botão de escolha usando GestureDetector para capturar o clique.
  Widget _botaoEscolha(BuildContext context, String nomeImagem) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TelaResultado(escolhaUsuario: nomeImagem),
          ),
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

class TelaResultado extends StatelessWidget {
  final String escolhaUsuario;

  const TelaResultado({super.key, required this.escolhaUsuario});

  @override
  Widget build(BuildContext context) {
    // Resultado fixo para demonstração
    String resultado = "Empate";
    String iconeResultado = "icons8-aperto-de-mãos-100.png";

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
            const Text("Escolha do APP"),
            Image.asset("assets/pedra.png", width: 100),
            const SizedBox(height: 20),
            const Text("Sua Escolha"),
            Image.asset("assets/$escolhaUsuario.png", width: 100),
            const SizedBox(height: 20),
            Text(
              resultado,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.asset("assets/$iconeResultado", width: 60),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Jogar Novamente"),
            ),
          ],
        ),
      ),
    );
  }
}
