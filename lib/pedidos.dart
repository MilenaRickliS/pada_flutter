import 'package:flutter/material.dart';

void main(){
  runApp(const PedidosPage(pizza: [],));
}

class PedidosPage extends StatelessWidget {
  final List<String> pizza;

  const PedidosPage({super.key, required this.pizza});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos',
        style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 141, 81, 59),
        elevation: 4,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pizza Montada:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            
            pizza.isEmpty
                ? Text('Nenhum ingrediente selecionado.')
                : Column(
                    children: pizza.map((ingrediente) {
                      return Text(
                        ingrediente,
                        style: TextStyle(fontSize: 18),
                      );
                    }).toList(),
                  ),

            SizedBox(height: 20),

          
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 141, 81, 59),
              ),
              child: Text('Editar Pizza', 
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