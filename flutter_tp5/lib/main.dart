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
  final List<GeneroMusical> _generos = [
    GeneroMusical(
      nome: 'Rock',
      imagem: 'assets/imagens/rock.png',
      descricao:
          'Estilo marcado pelo som de guitarras elétricas, baixo e bateria.',
    ),
    GeneroMusical(
      nome: 'Pop',
      imagem: 'assets/imagens/pop.png',
      descricao: 'Possui melodias marcantes e refrões fáceis de cantar.',
    ),
    GeneroMusical(
      nome: 'Sertanejo',
      imagem: 'assets/imagens/sertanejo.png',
      descricao: 'Estilo brasileiro com raízes na música caipira, na viola e no violão.',
    ),
    GeneroMusical(
      nome: 'Samba',
      imagem: 'assets/imagens/samba.png',
      descricao: 'Gênero brasileiro de raízes afro-brasileiras, com destaque para a percussão.',
    ),
    GeneroMusical(
      nome: 'MPB',
      imagem: 'assets/imagens/mpb.png',
      descricao: 'A Música Popular Brasileira reúne diferentes ritmos e influências do país.',
    ),
    GeneroMusical(
      nome: 'Eletrônica',
      imagem: 'assets/imagens/eletronica.png',
      descricao: 'Utiliza sintetizadores, computadores e batidas programadas.',
    ),
  ];

  Widget _construirGenero(GeneroMusical genero) {
    return ListTile(
      leading: Image.asset(
        genero.imagem,
        width: 72,
        height: 56,
        fit: BoxFit.cover,
      ),
      title: Text(genero.nome),
      trailing: Switch(
        value: genero.gosta,
        onChanged: (valor) {
          setState(() {
            genero.gosta = valor;
          });
        },
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => ConfiguracoesGenero(genero: genero),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Principal.nomeAluno, style: TextStyle(fontSize: 18)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _generos.length,
        itemBuilder: (context, indice) => _construirGenero(_generos[indice]),
      ),
    );
  }
}

class ConfiguracoesGenero extends StatefulWidget {
  final GeneroMusical genero;

  const ConfiguracoesGenero({super.key, required this.genero});

  @override
  State<ConfiguracoesGenero> createState() => _ConfiguracoesGeneroState();
}

class _ConfiguracoesGeneroState extends State<ConfiguracoesGenero> {
  void _salvarPreferencias() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Preferências de ${widget.genero.nome} salvas!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Principal.nomeAluno, style: TextStyle(fontSize: 18)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(widget.genero.nome, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          Text(widget.genero.descricao),
          const SizedBox(height: 24),
          Text('Volume preferido: ${widget.genero.volume.round()}%'),
          Slider(
            value: widget.genero.volume,
            min: 0,
            max: 100,
            divisions: 100,
            label: '${widget.genero.volume.round()}%',
            onChanged: (valor) {
              setState(() {
                widget.genero.volume = valor;
              });
            },
          ),
          Row(
            children: [
              Checkbox(
                value: widget.genero.receberRecomendacoes,
                onChanged: (valor) {
                  setState(() {
                    widget.genero.receberRecomendacoes = valor!;
                  });
                },
              ),
              const Expanded(
                child: Text('Desejo receber recomendações deste gênero'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _salvarPreferencias,
            child: const Text('Salvar Preferências'),
          ),
        ],
      ),
    );
  }
}
