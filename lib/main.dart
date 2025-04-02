import 'package:flutter/material.dart';
import 'package:pada_flutter/pizza.dart';
import 'package:pada_flutter/detalhes.dart';
import 'package:pada_flutter/favoritos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panificadora Vitória',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 183, 154, 58)),
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> favoritos = [];

  static const List<Map<String, String>> produtos = [
    {
      "id": "1",
      "nome": "Lanche 1",
      "imagem": "assets/lanche1.png",
      "preco": "30.00",
      "categoria": "Lanches",
      "descricao": "Pão, presunto, queijo e salada",
    },
    {
      "id": "2",
      "nome": "Lanche 2",
      "imagem": "assets/lanche2.png",
      "preco": "35.00",
      "categoria": "Lanches",
      "descricao": "Pão, presunto, queijo, salada, bacon, cebola caramelizada",
    },
    {
      "id": "3",
      "nome": "Lanche 3",
      "imagem": "assets/lanche3.png",
      "preco": "25.00",
      "categoria": "Lanches",
      "descricao": "Pão, presunto, queijo",
    },
    {
      "id": "4",
      "nome": "Pizza 1",
      "imagem": "assets/pizza1.png",
      "preco": "30.00",
      "categoria": "Pizzas",
      "descricao": "Calabresa e oregano",
    },
    {
      "id": "5",
      "nome": "Pizza 2",
      "imagem": "assets/pizza2.png",
      "preco": "32.00",
      "categoria": "Pizzas",
      "descricao": "4 queijos",
    },
    {
      "id": "6",
      "nome": "Pizza 3",
      "imagem": "assets/pizza3.png",
      "preco": "35.00",
      "categoria": "Pizzas",
      "descricao": "Frango com catupiry",
    },
  ];

  void _toggleFavorito(Map<String, String> produto) {
    setState(() {
      if (favoritos.contains(produto)) {
        favoritos.remove(produto);
      } else {
        favoritos.add(produto);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Panificadora Vitória',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 196, 148, 76),
        elevation: 4,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            color: Colors.red,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritosPage(favoritos: favoritos),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // Seção do banner ou anúncio
          Expanded(
            flex: 1, 
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 135, 114),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/pizza.png'),
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 15),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Pizza(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        icon: Icon(Icons.local_pizza, color: const Color.fromARGB(255, 212, 166, 13)),
                        label: Text(
                          'Monte sua Pizza!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 212, 166, 13),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Grid de opções de categorias
          Expanded(
            flex: 1, 
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
              children: <Widget>[
                _MenuOption(
                  icon: 'assets/pizza-menu.png',
                  title: 'Pizza',
                  onTap: () {
                    // Ação para pizza
                  },
                ),
                _MenuOption(
                  icon: 'assets/lanches-menu.png',
                  title: 'Lanches',
                  onTap: () {
                    // Ação para lanches
                  },
                ),
                _MenuOption(
                  icon: 'assets/sanduiche-menu.png',
                  title: 'Sanduíches',
                  onTap: () {
                    // Ação para sanduíches
                  },
                ),
              ],
            ),
          ),
       
          // Grid de produtos
          Expanded(
            flex: 2, 
            child: GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.75,
              ),
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                final produto = produtos[index];
                final isFavorito = favoritos.contains(produto);

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalhesProduto(produto: produto),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100, 
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(produto['imagem']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          produto['nome']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'R\$ ${produto['preco']}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isFavorito ? Icons.favorite : Icons.favorite_border,
                            color: isFavorito ? Colors.red : Colors.grey,
                          ),
                          onPressed: () => _toggleFavorito(produto),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) {
                                  return DetalhesProduto(produto: produto);
                                },
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  
                                  var fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
                                    CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeInOut,
                                    ),
                                  );
                                  return FadeTransition(opacity: fadeAnimation, child: child);
                                },
                                transitionDuration: Duration(seconds: 1), 
                              ),
                            );

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 72, 41, 30),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Ver Produto',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuOption extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const _MenuOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(icon),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
