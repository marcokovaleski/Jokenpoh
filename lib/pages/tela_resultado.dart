import 'package:flutter/material.dart';

class TelaResultado extends StatelessWidget {
  final String escolhaUsuario;
  final String escolhaApp;

  const TelaResultado({
    super.key,
    required this.escolhaUsuario,
    required this.escolhaApp,
  });

  String _definirResultado() {
    if (escolhaUsuario == escolhaApp) return "Empate";

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      return "Você Venceu";
    }

    return "Você Perdeu";
  }

  String _iconeResultado(String resultado) {
    switch (resultado) {
      case "Você Venceu":
        return "icons8-vitória-48.png";
      case "Você Perdeu":
        return "icons8-perder-48.png";
      default:
        return "icons8-aperto-de-mãos-100.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    final resultado = _definirResultado();
    final iconeResultado = _iconeResultado(resultado);

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
            Image.asset("assets/$escolhaApp.png", width: 100),
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
