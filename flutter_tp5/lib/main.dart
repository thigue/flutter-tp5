// Aluno: THIAGO GUERRA SOARES
import 'package:flutter/material.dart';

void main() {
  runApp(const AplicativoMusical());
}

class AplicativoMusical extends StatelessWidget {
  const AplicativoMusical({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferências Musicais',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.deepPurple),
      home: const Principal(),
    );
  }
}

class GeneroMusical {
  final String nome;
  final String imagem;
  final String descricao;
  bool gosta;
  double volume;
  bool receberRecomendacoes;

  GeneroMusical({
    required this.nome,
    required this.imagem,
    required this.descricao,
    this.gosta = false,
    this.volume = 50,
    this.receberRecomendacoes = false,
  });
}

// THIAGO GUERRA SOARES
class Principal extends StatefulWidget {
  const Principal({super.key});
  static const nomeAluno = 'THIAGO GUERRA SOARES';

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Principal.nomeAluno, style: TextStyle(fontSize: 18)),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.headphones, size: 72, color: Colors.deepPurple),
              SizedBox(height: 16),
              Text(
                'Preferências Musicais',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 12),
              Text(
                'Escolha seus gêneros favoritos e personalize como gosta de ouvir música.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Suas preferências\n\n'
                    'Marque os gêneros que você gosta, ajuste o volume '
                    'e escolha se deseja receber recomendações.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
