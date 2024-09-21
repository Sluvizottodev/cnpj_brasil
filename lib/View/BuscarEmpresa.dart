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
  String? _errorMessage; // Variável para armazenar a mensagem de erro

  Future<void> _buscarDadosEmpresa() async {
    final cnpj = _cnpjController.text;
    final dados = await _viewModel.buscarDadosEmpresa(cnpj);

    setState(() {
      if (dados == null) {
        _errorMessage = 'CNPJ não encontrado. Tente novamente.';
      } else {
        _errorMessage = null;
        empresaDados = dados;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Empresa:'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 0.5,
                color: Colors.blue,
                margin: EdgeInsets.only(bottom: 16.0),
              ),
              TextField(
                controller: _cnpjController,
                decoration: InputDecoration(
                  labelText: 'Digite o CNPJ',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  fillColor: Colors.grey[850],
                  filled: true,
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _buscarDadosEmpresa,
                child: Text('Buscar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                ),
              ),
              SizedBox(height: 16.0),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 16.0),
              if (empresaDados != null) EmpresaInfoCard(empresa: empresaDados!),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }
}
