// Importa pacotes e widgets necessários para a interface do usuário.
import 'package:cnpjbrasil/Widgets/InfAppBar.dart';
import 'package:flutter/material.dart';
import '../Model/Empresa.dart';
import '../ViewModel/cnpjAPI.dart';
import '../Widgets/InfoCard.dart';

// Componente Stateful para buscar informações de uma empresa com base no CNPJ
class BuscarEmpresa extends StatefulWidget {
  @override
  _BuscarEmpresaState createState() => _BuscarEmpresaState();
}

class _BuscarEmpresaState extends State<BuscarEmpresa> {
  final TextEditingController _cnpjController = TextEditingController(); // Controlador para o campo de texto do CNPJ
  final BuscarEmpresaViewModel _viewModel = BuscarEmpresaViewModel(); // Instância da ViewModel para buscar dados
  Empresa? empresaDados; // Variável para armazenar os dados da empresa
  String? _errorMessage; // Variável para armazenar mensagem de erro

  // Função assíncrona para buscar os dados da empresa com base no CNPJ fornecido
  Future<void> _buscarDadosEmpresa() async {
    final cnpj = _cnpjController.text; // Obtém o CNPJ digitado.
    final dados = await _viewModel.buscarDadosEmpresa(cnpj); // Chama a API para buscar os dados

    // Atualiza o estado com os dados retornados ou mensagem de erro
    setState(() {
      if (dados == null) {
        _errorMessage =
        'CNPJ não encontrado. Tente novamente.'; // Define mensagem de erro se não encontrar
      } else {
        _errorMessage = null; // Limpa a mensagem de erro
        empresaDados = dados; // Armazena os dados da empresa
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar CNPJ:'), // Título da AppBar
        backgroundColor: Colors.black, // Cor de fundo da AppBar
        foregroundColor: Colors.blue, // Cor do texto e ícones da AppBar
        automaticallyImplyLeading: false, // Desativa botão de voltar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Margem para os elementos
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 0.5,
                color: Colors.blue,
                margin: EdgeInsets.only(bottom: 16.0),
              ),
              // Campo de texto para inserir o CNPJ
              TextField(
                controller: _cnpjController,
                decoration: InputDecoration(
                  labelText: 'Digite o CNPJ',
                  labelStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
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
              SizedBox(height: 16.0), // Espaçamento entre os elementos
              // Botão para buscar dados da empresa
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
              // Exibe mensagem de erro, se houver
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 16.0),
              // Exibe os dados da empresa, se disponíveis
              if (empresaDados != null) EmpresaInfoCard(empresa: empresaDados!),
            ],
          ),
        ),
      ),
      bottomNavigationBar: InfAppBar(),
      backgroundColor: Colors.black87,
    );
  }
}