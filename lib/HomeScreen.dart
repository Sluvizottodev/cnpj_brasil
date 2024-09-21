import 'package:flutter/material.dart';
import 'MapaEmpresa.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController cnpjController = TextEditingController();

  void _searchCNPJ(BuildContext context) {
    String cnpj = cnpjController.text.trim();
    if (cnpj.isNotEmpty) {
      // Aqui você pode implementar a lógica de busca de informações com o CNPJ.
      // Por enquanto, vamos navegar para a próxima tela passando o CNPJ.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MapaEmpresa(latitude: "0", longitude: "0"), // Passar valores reais
        ),
      );
    } else {
      // Mostrar um aviso se o campo estiver vazio
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, insira um CNPJ válido.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar CNPJ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: cnpjController,
              decoration: InputDecoration(
                labelText: 'Insira o CNPJ',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _searchCNPJ(context),
              child: Text('Buscar'),
            ),
          ],
        ),
      ),
    );
  }
}
