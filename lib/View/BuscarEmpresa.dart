import 'package:flutter/material.dart';
import '../ModelEmpresa/Empresa.dart';
import '../ViewModelEmpresa/EmpresaAPI.dart';
import '../Widgets/InfoCard.dart';

class BuscarEmpresa extends StatefulWidget {
  @override
  _BuscarEmpresaState createState() => _BuscarEmpresaState();
}

class _BuscarEmpresaState extends State<BuscarEmpresa> {
  final TextEditingController _cnpjController = TextEditingController();
  final BuscarEmpresaViewModel _viewModel = BuscarEmpresaViewModel();
  Empresa? empresaDados;

  Future<void> _buscarDadosEmpresa() async {
    final cnpj = _cnpjController.text;
    final dados = await _viewModel.buscarDadosEmpresa(cnpj);

    setState(() {
      empresaDados = dados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Empresa:'),
        backgroundColor: Colors.black, // Cor escura para a AppBar
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView( // Permite rolagem
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Para que os widgets ocupem a largura total
            children: [
              TextField(
                controller: _cnpjController,
                decoration: InputDecoration(
                  labelText: 'Digite o CNPJ',
                  labelStyle: TextStyle(color: Colors.white), // Texto do rótulo em branco
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  fillColor: Colors.grey[850], // Fundo do TextField
                  filled: true,
                ),
                style: TextStyle(color: Colors.white), // Texto em branco
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _buscarDadosEmpresa,
                child: Text('Buscar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Cor do botão
                  padding: EdgeInsets.symmetric(vertical: 12.0), // Aumentar o espaço vertical do botão
                ),
              ),
              SizedBox(height: 16.0),
              if (empresaDados != null) EmpresaInfoCard(empresa: empresaDados!),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black87, // Cor de fundo do Scaffold
    );
  }
}
