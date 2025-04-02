import 'package:flutter/material.dart';
import 'package:pada_flutter/detalhes.dart';

void main(){
  runApp(const FavoritosPage(favoritos: [],));
}

class FavoritosPage extends StatelessWidget {
  final List<Map<String, String>> favoritos;

  const FavoritosPage({super.key, required this.favoritos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favoritos',
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 122, 9, 104),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: favoritos.length,
        itemBuilder: (context, index) {
          final produto = favoritos[index];
          return ListTile(
            title: Text(produto['nome']!),
            subtitle: Text(produto['descricao']!),
            leading: Image.asset(produto['imagem']!, width: 50, height: 50, fit: BoxFit.cover),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalhesProduto(produto: produto),
                ),
              );
            },
          );
        },
      ),
    );
  }
}