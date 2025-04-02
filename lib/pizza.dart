import 'package:flutter/material.dart';
import 'package:pada_flutter/pedidos.dart';

void main() {
  runApp(const Pizza());
}

class Pizza extends StatefulWidget {
  const Pizza({super.key});

  @override
  State<Pizza> createState() => PizzaState();
}

class PizzaState extends State<Pizza> {
  final _massaPizza = AssetImage('assets/massa-pizza.png');
  List<String> ingredientes = [
    'Calabresa',
    'Queijo',
    'Bacon',
    'Cebola',
    'Milho',
  ];
  List<String> ingredientesSelecionados = []; 
  List<String> imagensIngredientes = [];

  void _toggleIngrediente(String ingrediente, String imagem) {
    setState(() {
      if (ingredientesSelecionados.contains(ingrediente)) {
        ingredientesSelecionados.remove(ingrediente);
        imagensIngredientes.remove(imagem); 
      } else {
        ingredientesSelecionados.add(ingrediente);
        imagensIngredientes.add(imagem); 
      }
    });
  }

  void _finalizarPizza() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PedidosPage(pizza: ingredientesSelecionados),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Montagem Pizza',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 141, 81, 59),
        elevation: 4,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[            
            Stack(
              alignment: Alignment.center,
              children: [                
                Image(image: _massaPizza),                
                for (String imagem in imagensIngredientes)
                  Positioned(
                    top: 50, // Ajuste de posição da imagem
                    child: Image.asset(
                      imagem,
                      width: 350,
                      height: 350,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CheckboxListTile(
                    title: Text('Calabresa'),
                    value: ingredientesSelecionados.contains('Calabresa'),
                    onChanged: (bool? value) {
                      _toggleIngrediente('Calabresa', 'assets/calabresa.png');
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Queijo'),
                    value: ingredientesSelecionados.contains('Queijo'),
                    onChanged: (bool? value) {
                      _toggleIngrediente('Queijo', 'assets/queijo.png');
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Bacon'),
                    value: ingredientesSelecionados.contains('Bacon'),
                    onChanged: (bool? value) {
                      _toggleIngrediente('Bacon', 'assets/bacon.png');
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Cebola'),
                    value: ingredientesSelecionados.contains('Cebola'),
                    onChanged: (bool? value) {
                      _toggleIngrediente('Cebola', 'assets/cebola.png');
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Milho'),
                    value: ingredientesSelecionados.contains('Milho'),
                    onChanged: (bool? value) {
                      _toggleIngrediente('Milho', 'assets/milho.jpg');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _finalizarPizza,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 141, 81, 59),
              ),
              child: Text('Finalizar Pizza',
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
  }
}
